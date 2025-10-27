import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/learn_compatability_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/pages/player/content_feedback.dart';
import 'package:toc_module/toc/resource_players/course_assessment_player.dart';
import 'package:toc_module/toc/resource_players/course_html_player.dart';
import 'package:toc_module/toc/resource_players/pdf_player/course_pdf_player.dart';
import 'package:toc_module/toc/resource_players/youtube_player/course_youtube_player.dart';
import 'package:toc_module/toc/widgets/toc_pdfplayer_structure.dart';
import '../pages/update_message.dart';

class OpenResource extends StatelessWidget {
  final resourceNavigateItem;
  final CourseHierarchyModel courseHierarchyData;
  final ValueChanged<bool> playNextResource;
  final ValueChanged<bool>? changeLayout;
  final ValueChanged<Map>? showLatestProgress;
  final String batchId, primaryCategory;
  final bool isCuratedProgram, isFeatured;
  final List navigationItems;
  final int? startAt;
  final String courseCategory;
  final bool isPreRequisite;
  OpenResource({
    Key? key,
    required this.resourceNavigateItem,
    required this.courseHierarchyData,
    required this.batchId,
    required this.primaryCategory,
    required this.navigationItems,
    this.isCuratedProgram = false,
    this.isFeatured = false,
    required this.playNextResource,
    this.showLatestProgress,
    this.startAt,
    this.changeLayout,
    required this.courseCategory,
    this.isPreRequisite = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return courseHierarchyData.compatibilityLevel >
            ResourceCategoryVersion.contentCompatibility.version
        ? ShowUpdate()
        : resourceNavigateItem.mimeType == EMimeTypes.assessment ||
              resourceNavigateItem.mimeType == EMimeTypes.newAssessment
        ? resourceNavigateItem.compatibilityLevel != null &&
                  resourceNavigateItem.compatibilityLevel >
                      ResourceCategoryVersion.navigationCompatibility.version
              ? ShowUpdate()
              : CourseAssessmentPlayer(
                  courseHierarchyData,
                  resourceNavigateItem.identifier,
                  showLatestProgress!,
                  isCuratedProgram
                      ? resourceNavigateItem.parentBatchId
                      : batchId,
                  parentCourseId: isCuratedProgram
                      ? resourceNavigateItem.parentCourseId
                      : courseHierarchyData.identifier,
                  playNextResource: playNextResource,
                  compatibilityLevel: resourceNavigateItem.compatibilityLevel,
                  resourceNavigateItems: resourceNavigateItem,
                  isFeatured: isFeatured,
                  courseCategory: courseCategory,
                  isPreRequisite: isPreRequisite,
                )
        : resourceNavigateItem.mimeType == EMimeTypes.pdf
        ? PDFStructureWidget(
            resourcename: resourceNavigateItem.name,
            player: CoursePdfPlayer(
              startAt: startAt,
              identifier: resourceNavigateItem.identifier,
              batchId: isCuratedProgram
                  ? resourceNavigateItem.parentBatchId
                  : batchId,
              parentCourseId: isCuratedProgram
                  ? resourceNavigateItem.parentCourseId
                  : courseHierarchyData.identifier,
              isFeaturedCourse: isFeatured,
              updateProgress: showLatestProgress,
              primaryCategory: primaryCategory,
              playNextResource: playNextResource,
              resourceNavigateItems: resourceNavigateItem,
              isPreRequisite: isPreRequisite,
              language: resourceNavigateItem.language,
            ),
          )
        : resourceNavigateItem.mimeType == EMimeTypes.survey
        ? Scaffold(
            body: Center(
              child:
                  resourceNavigateItem.completionPercentage == 100 ||
                      resourceNavigateItem.status == 2
                  ? Scaffold(
                      appBar: AppBar(
                        title: Text(
                          resourceNavigateItem.name,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      body: SizedBox(
                        height: 1.0.sw,
                        width: 1.0.sw,
                        child: Center(
                          child: Text(
                            TocLocalizations.of(context)!.mSurveySubmitted,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(color: TocModuleColors.greys),
                          ),
                        ),
                      ),
                    )
                  : ContentFeedback(
                      resourceNavigateItem.artifactUrl,
                      resourceNavigateItem.name,
                      courseHierarchyData,
                      resourceNavigateItem.identifier,
                      isCuratedProgram
                          ? resourceNavigateItem.parentBatchId
                          : batchId,
                      updateContentProgress: showLatestProgress,
                      parentCourseId: isCuratedProgram
                          ? resourceNavigateItem.parentCourseId
                          : courseHierarchyData.identifier,
                      playNextResource: playNextResource,
                      resourceNavigateItems: resourceNavigateItem,
                      isFeaturedCourse: isFeatured,
                      isPreRequisite: isPreRequisite,
                      language: resourceNavigateItem.language,
                    ),
            ),
          )
        : resourceNavigateItem.mimeType == EMimeTypes.html
        ? openInFullScreen(
            CourseHtmlPlayer(
              courseHierarchyData,
              resourceNavigateItem.identifier,
              isCuratedProgram ? resourceNavigateItem.parentBatchId : batchId,
              changeLayout!,
              parentAction3: showLatestProgress,
              isFeaturedCourse: isFeatured,
              parentCourseId: isCuratedProgram
                  ? resourceNavigateItem.parentCourseId
                  : courseHierarchyData.identifier,
              resourceNavigateItems: resourceNavigateItem,
              isPreRequisite: isPreRequisite,
              language: resourceNavigateItem.language,
            ),
            context,
          )
        : resourceNavigateItem.mimeType == EMimeTypes.externalLink ||
              resourceNavigateItem.mimeType == EMimeTypes.youtubeLink
        ? Scaffold(
            body: Center(
              child: CourseYoutubePlayer(
                contentId: resourceNavigateItem.identifier,
                batchId: isCuratedProgram
                    ? resourceNavigateItem.parentBatchId
                    : batchId,
                isFeaturedCourse: isFeatured,
                updateContentProgress: showLatestProgress,
                identifier: isCuratedProgram
                    ? resourceNavigateItem.parentCourseId
                    : courseHierarchyData.identifier,
                resourceNavigateItems: resourceNavigateItem,
                duration: courseHierarchyData.duration,
                isPreRequisite: isPreRequisite,
                language: resourceNavigateItem.language,
              ),
            ),
          )
        : Center();
  }

  Scaffold ShowUpdate() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: UpdateMessage()),
    );
  }

  Widget openInFullScreen(
    Widget player,
    BuildContext context, {
    bool fullScreen = false,
  }) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        await setOrientationAndPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TocModuleColors.greys,
          elevation: 0,
          titleSpacing: 0.w,
          leading: BackButton(
            color: TocModuleColors.white70,
            onPressed: () async {
              await setOrientationAndPop(context);
            },
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10).w,
                child: Text(
                  TocLocalizations.of(context)!.mStaticBack,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    color: TocModuleColors.white70,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(child: player),
      ),
    );
  }

  Future<void> setOrientationAndPop(context) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Navigator.of(context).pop();
  }
}
