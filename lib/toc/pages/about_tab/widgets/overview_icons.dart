import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/date_time_helper.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';

class TocOverviewIcons extends StatefulWidget {
  final CourseHierarchyModel courseHierarchy;
  final Course courseRead;

  const TocOverviewIcons({
    Key? key,
    required this.courseHierarchy,
    required this.courseRead,
  }) : super(key: key);

  @override
  State<TocOverviewIcons> createState() => _TocOverviewIconsState();
}

class _TocOverviewIconsState extends State<TocOverviewIcons> {
  final Map<String, int> structure = {
    'video': 0,
    'pdf': 0,
    'assessment': 0,
    'Session': 0,
    'module': 0,
    'other': 0,
    'html': 0,
    'course': 0,
    'practiceTest': 0,
    'finalTest': 0,
    'audio': 0,
    'externalLink': 0,
    'offlineSession': 0,
  };
  final ValueNotifier<String?> cbpDateNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _processCourseHierarchy(widget.courseHierarchy.children);
    _fetchCBPEndDate();
  }

  void _processCourseHierarchy(List<dynamic>? items) {
    if (items == null) return;

    for (final item in items) {
      final contentType = item.contentType;
      final mimeType = item.mimeType.trim();

      if (contentType == 'Course') {
        structure['course'] = structure['course']! + 1;
        _processCourseHierarchy(item.children);
      } else if (contentType == 'Collection' || contentType == 'CourseUnit') {
        structure['module'] = structure['module']! + 1;
        _processCourseHierarchy(item.children);
      } else {
        switch (mimeType) {
          case EMimeTypes.mp4:
            structure['video'] = structure['video']! + 1;
            break;
          case EMimeTypes.pdf:
            structure['pdf'] = structure['pdf']! + 1;
            break;
          case EMimeTypes.assessment:
            structure['assessment'] = structure['assessment']! + 1;
            break;
          case EMimeTypes.collection:
            structure['module'] = structure['module']! + 1;
            break;
          case EMimeTypes.html:
            structure['html'] = structure['html']! + 1;
            break;
          case EMimeTypes.mp3:
            structure['audio'] = structure['audio']! + 1;
            break;
          case EMimeTypes.offline:
            structure['offlineSession'] = structure['offlineSession']! + 1;
            break;
          case EMimeTypes.externalLink:
            structure['externalLink'] = structure['externalLink']! + 1;
            break;
          case EMimeTypes.newAssessment:
            item.primaryCategory == PrimaryCategory.practiceAssessment
                ? structure['practiceTest'] = structure['practiceTest']! + 1
                : structure['finalTest'] = structure['finalTest']! + 1;
            break;
          default:
            structure['other'] = structure['other']! + 1;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    widgets.add(
      ValueListenableBuilder<String?>(
        valueListenable: cbpDateNotifier,
        builder: (context, value, _) {
          if (value != null) {
            return cbpEnddateWidget(date: value);
          }
          return const SizedBox.shrink();
        },
      ),
    );
    if (widget.courseRead.duration != null &&
        _calculateDuration(widget.courseRead.duration!) != "0 m") {
      widgets.add(detailsWidget(
          imagepath: 'assets/img/clock_white.svg',
          title: _calculateDuration(widget.courseRead.duration!)));
    }

    final dataMap = {
      'course': 'Course',
      'module': 'Module',
      'offlineSession': 'Session',
      'video': 'Video',
      'pdf': 'PDF',
      'audio': 'Audio',
      'assessment': 'Assessment',
      'externalLink': 'Web page',
      'html': 'Interactive Content',
      'practiceTest': 'Practice test',
      'finalTest': 'Final test',
    };

    dataMap.forEach((key, label) {
      if (structure[key]! > 0) {
        widgets.add(detailsWidget(
          imagepath: _getIconForType(key),
          title:
              "${structure[key]} ${structure[key] == 1 ? label : '${label}s'}",
        ));
      }
    });

    if (widget.courseRead.learningMode != null) {
      widgets.add(detailsWidget(
        imagepath: 'assets/img/instructor_led.svg',
        title: widget.courseRead.learningMode!,
      ));
    }

    if (widget.courseHierarchy.license != null) {
      widgets.add(detailsWidget(
        imagepath: 'assets/img/key.svg',
        title: widget.courseHierarchy.license!,
      ));
    }

    widgets.add(detailsWidget(
      imagepath: 'assets/img/rupee.svg',
      title: "Free",
    ));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 55.w,
        child: Row(children: widgets),
      ),
    );
  }

  Widget detailsWidget({required String title, required String imagepath}) {
    return Container(
      height: 60.w,
      width: 64.w,
      margin: const EdgeInsets.only(right: 24.0).r,
      child: Column(
        children: [
          SvgPicture.asset(
            imagepath,
            height: 20.w,
            width: 20.w,
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(TocModuleColors.darkBlue, BlendMode.srcIn),
          ),
          SizedBox(height: 2.w),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  String _calculateDuration(String duration) {
    final totalMinutes = int.tryParse(duration) ?? 0;
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return '$hours h $minutes m';
    } else if (hours > 0) {
      return '$hours h';
    } else {
      return '$minutes m';
    }
  }

  Widget cbpEnddateWidget({required String date}) {
    final dateDiff = _getDateDifference(date);

    return Container(
      padding: const EdgeInsets.only(right: 20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month_rounded,
              color: TocModuleColors.darkBlue, size: 20.sp),
          Container(
            margin: EdgeInsets.only(top: 5).r,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4).r,
            decoration: BoxDecoration(
              color: dateDiff < 0
                  ? TocModuleColors.negativeLight
                  : dateDiff < 30
                      ? TocModuleColors.verifiedBadgeIconColor
                      : TocModuleColors.positiveLight,
              borderRadius: BorderRadius.circular(4.0).r,
            ),
            child: Text(
              DateTimeHelper.getDateTimeInFormat(
                date,
                desiredDateFormat: IntentType.dateFormat2,
              ),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12.sp,
                    color: TocModuleColors.appBarBackground,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  int _getDateDifference(String date) {
    final parsedDate = DateTime.parse(date);
    final today = DateTime.now();
    return DateTime(parsedDate.year, parsedDate.month, parsedDate.day)
        .difference(DateTime(today.year, today.month, today.day))
        .inDays;
  }

  String _getIconForType(String key) {
    const iconMap = {
      'course': 'assets/img/course_icon.svg',
      'module': 'assets/img/icons-file-types-module.svg',
      'offlineSession': 'assets/img/icons-file-types-module.svg',
      'video': 'assets/img/icons-av-play.svg',
      'pdf': 'assets/img/icons-file-types-pdf-alternate.svg',
      'audio': 'assets/img/audio.svg',
      'assessment': 'assets/img/assessment_icon.svg',
      'externalLink': 'assets/img/web_page.svg',
      'html': 'assets/img/link.svg',
      'practiceTest': 'assets/img/assessment_icon.svg',
      'finalTest': 'assets/img/assessment_icon.svg',
    };
    return iconMap[key] ?? 'assets/img/link.svg';
  }

  Future<String?> getCBPEndDate() async {
    final cbPlanModel = await TocRepository().getCbpPlan();

    final cbpContent = cbPlanModel?.content;
    if (cbpContent == null || cbpContent.isEmpty) return null;

    for (final content in cbpContent) {
      if (content.id == widget.courseRead.id) {
        return content.endDate;
      }
    }

    return null;
  }

  void _fetchCBPEndDate() async {
    final endDate = await getCBPEndDate();
    cbpDateNotifier.value = endDate;
  }

  @override
  void dispose() {
    cbpDateNotifier.dispose();
    super.dispose();
  }
}
