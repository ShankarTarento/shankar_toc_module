import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/model/batch_model.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/toc_player_model.dart';
import 'package:toc_module/toc/screen/toc_player_screen.dart';
import '../../../widgets/toc_button_widget.dart';

class IgotTutorAtrip extends StatefulWidget {
  final bool isEnrolled;
  final Course? enrolledCourse;
  final bool isModerated;
  final List navigationItems;
  final bool isCuratedProgram;
  final Course courseDetails;
  final String? batchId;
  final String courseId;
  final String? lastAccessContentId;
  final Batch? selectedBatch;
  final VoidCallback readCourseProgress, updateEnrolmentList;
  final List resourceNavigateItems;
  final bool isFeatured;
  final List<Course> enrollmentList;
  final int? numberOfCourseRating;
  final bool isLearningPathContent;
  final double? courseRating;
  final bool isBlendedProgram;

  const IgotTutorAtrip(
      {super.key,
      required this.isBlendedProgram,
      required this.isEnrolled,
      this.isModerated = false,
      this.enrolledCourse,
      required this.courseDetails,
      required this.navigationItems,
      this.isCuratedProgram = false,
      this.batchId,
      required this.courseId,
      this.lastAccessContentId,
      this.selectedBatch,
      required this.readCourseProgress,
      required this.updateEnrolmentList,
      required this.resourceNavigateItems,
      this.isFeatured = false,
      required this.enrollmentList,
      this.numberOfCourseRating,
      required this.isLearningPathContent,
      this.courseRating});

  @override
  State<IgotTutorAtrip> createState() => _IgotTutorAtripState();
}

class _IgotTutorAtripState extends State<IgotTutorAtrip> {
  double progress = 0;
  bool isModeratedMultiBatchCourse = false;
  Course? enrolledCourse;
  List<Course> enrollmentList = [];

  @override
  void initState() {
    super.initState();
    enrollmentList = widget.enrollmentList;
    isModeratedMultiBatchCourse = isModeratedWithMultipleBatch();
    if (!isModeratedMultiBatchCourse) {
      enrolledCourse = widget.enrolledCourse;
      if (!widget.isFeatured) {
        progress = checkProgress();
      }
    }
  }

  @override
  void didUpdateWidget(IgotTutorAtrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    enrollmentList = widget.enrollmentList;
    if (oldWidget.enrolledCourse != widget.enrolledCourse &&
        !isModeratedMultiBatchCourse) {
      enrolledCourse = widget.enrolledCourse;
      if (!widget.isFeatured) {
        progress = checkProgress();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8).r,
      padding: EdgeInsets.all(1.5).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        gradient: LinearGradient(
          colors: [TocModuleColors.primaryOne, TocModuleColors.darkBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color: TocModuleColors.appBarBackground,
        ),
        child: Row(
          children: [
            AiBotIcon(
              size: 50.w,
            ),
            SizedBox(
              width: 6.w,
            ),
            SizedBox(
              width: 0.55.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TocLocalizations.of(context)!.mChatBotGetStarted,
                    style: GoogleFonts.lato(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  Text(
                    TocLocalizations.of(context)!.mAiTutorWelcomeText,
                    style: GoogleFonts.lato(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                widget.isEnrolled
                    ? enrolledCourse?.batchId != null
                        ? navigateToContent(
                            batchId: enrolledCourse!.batchId!,
                            navigationItems: widget.navigationItems)
                        : null
                    : showPopup(context);
              },
              child: Container(
                padding: EdgeInsets.all(1.2).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80).r,
                  gradient: LinearGradient(
                    colors: [
                      TocModuleColors.primaryOne,
                      TocModuleColors.darkBlue
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(4).r,
                  decoration: BoxDecoration(
                    color: TocModuleColors.appBarBackground,
                    borderRadius: BorderRadius.circular(80).r,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 25.w,
                          height: 20.w,
                          child: Image.asset("assets/img/ai_loader.png")),
                      Text(
                        TocLocalizations.of(context)!.mAiTutor,
                        style: GoogleFonts.lato(
                            color: TocModuleColors.darkBlue,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 8.w,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showPopup(parentContext) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 0.22.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AiBotIcon(
                  size: 60.w,
                ),
                SizedBox(
                  height: 16.w,
                ),
                Text(
                  TocLocalizations.of(parentContext)!.mRememberToUseAiTutor,
                  style: GoogleFonts.lato(
                      color: TocModuleColors.darkBlue, fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 0.3.sw,
                      child: ElevatedButton(
                        child: Text(
                          TocLocalizations.of(parentContext)!.mStaticCancel,
                          style:
                              GoogleFonts.lato(color: TocModuleColors.darkBlue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: TocModuleColors.appBarBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: BorderSide(
                              color: TocModuleColors.darkBlue,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 0.3.sw,
                        child: TocButtonWidget(
                          isStandAloneAssesment:
                              widget.courseDetails.courseCategory ==
                                  PrimaryCategory.standaloneAssessment,
                          courseDetails: widget.courseDetails,
                          navigationItems: widget.navigationItems,
                          courseId: widget.courseId,
                          resourceNavigateItems: widget.resourceNavigateItems,
                          enrollmentList: widget.enrollmentList,
                          isLearningPathContent: widget.isLearningPathContent,
                          readCourseProgress: widget.readCourseProgress,
                          updateEnrolmentList: widget.updateEnrolmentList,
                          isAITutor: true,
                          isCuratedProgram: widget.isCuratedProgram,
                          isModerated: widget.isModerated,
                          enrolledCourse: widget.enrolledCourse,
                          batchId: widget.batchId,
                          lastAccessContentId: widget.lastAccessContentId,
                          selectedBatch: widget.selectedBatch,
                          numberOfCourseRating: widget.numberOfCourseRating,
                          courseRating: widget.courseRating,
                          isFeatured: widget.isFeatured,
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  navigateToContent({required String batchId, List? navigationItems}) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TocPlayerScreen(
                  arguments: TocPlayerModel(
                      enrolledCourse: enrolledCourse,
                      navigationItems: navigationItems,
                      isCuratedProgram: widget.isCuratedProgram,
                      batchId: batchId,
                      lastAccessContentId: widget.lastAccessContentId,
                      courseId: widget.courseId,
                      isFeatured: widget.isFeatured,
                      enrollmentList: enrollmentList),
                )));

    widget.readCourseProgress();
  }

  bool isModeratedWithMultipleBatch() {
    return (widget.enrolledCourse == null &&
        widget.isModerated &&
        widget.courseDetails.batches != null &&
        widget.courseDetails.batches!.isNotEmpty &&
        (widget.courseDetails.batches![0].enrollmentType == 'invite-only' ||
            widget.courseDetails.batches![0].endDate.isNotEmpty));
  }

  double checkProgress() {
    if (enrolledCourse != null) {
      double totalProgress = 0;
      widget.resourceNavigateItems.forEach((element) {
        if (element is! List) {
          if (element.status == 2) {
            totalProgress += 1;
          } else {
            totalProgress +=
                double.parse(element.completionPercentage.toString());
          }
        }
      });
      return totalProgress / widget.resourceNavigateItems.length;
    } else {
      return 0;
    }
  }
}
