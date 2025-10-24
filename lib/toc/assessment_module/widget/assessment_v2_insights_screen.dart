import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/assessment_module/widget/assessment_v2_overall_performance_summary.dart';
import 'package:toc_module/toc/assessment_module/widget/assessment_v2_question_status_summary.dart';
import 'package:toc_module/toc/constants/learn_compatability_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/navigation_model.dart';
import 'package:toc_module/toc/resource_players/course_assessment_player.dart';
import 'package:toc_module/toc/util/fade_route.dart';

import '../../constants/color_constants.dart';

class AssessmentV2Insights extends StatelessWidget {
  final String timeSpent;
  final Map apiResponse;
  final primaryCategory;
  final CourseHierarchyModel course;
  final identifier;
  final updateContentProgress;
  final String batchId;
  final assessmentsInfo;
  final int compatibilityLevel;
  final bool showBack;
  final NavigationModel resourceInfo;
  final bool isFeatured;
  final String courseCategory;
  final bool isPreRequisite;

  const AssessmentV2Insights(
      {Key? key,
      required this.timeSpent,
      required this.apiResponse,
      this.primaryCategory,
      required this.course,
      this.identifier,
      this.updateContentProgress,
      required this.batchId,
      this.assessmentsInfo,
      required this.compatibilityLevel,
      this.showBack = true,
      required this.resourceInfo,
      this.isFeatured = false,
      required this.courseCategory,
      this.isPreRequisite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pop();
        if (primaryCategory == PrimaryCategory.practiceAssessment) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
          appBar: primaryCategory != PrimaryCategory.practiceAssessment &&
                  compatibilityLevel >=
                      AssessmentCompatibility.multimediaCompatibility.version
              ? AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 152.w,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(38, 110, 235, 1),
                          Color.fromRGBO(19, 63, 139, 1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          if (primaryCategory ==
                              PrimaryCategory.practiceAssessment) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: TocModuleColors.appBarBackground,
                            size: 30,
                            weight: 10,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/trophy_cup_icon.png',
                                  height: 35.w,
                                  width: 30.w,
                                ),
                                Text(
                                  TocLocalizations.of(context)!
                                      .mAssessmentReportCard,
                                  style: GoogleFonts.robotoSlab(
                                      decoration: TextDecoration.none,
                                      color: TocModuleColors.whitetextShade,
                                      fontSize: 19.2.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.25),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 2.w,
                            height: 100.w,
                            color: TocModuleColors.whitetextShade,
                          ),
                          Column(
                            children: [
                              Text(
                                TocLocalizations.of(context)!.mStaticYourScore,
                                style: GoogleFonts.robotoSlab(
                                    decoration: TextDecoration.none,
                                    color: TocModuleColors.whitetextShade,
                                    fontSize: 19.2.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.25),
                              ),
                              Text(
                                '${apiResponse['totalSectionMarks']}/${apiResponse['totalMarks']}',
                                style: GoogleFonts.robotoSlab(
                                    decoration: TextDecoration.none,
                                    color: TocModuleColors.whitetextShade,
                                    fontSize: 19.2.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.25),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : null,
          body: SafeArea(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 90).r,
                  child: Column(
                    children: [
                      AssessmentV2OverallPerformanceSummary(
                        timeSpent: timeSpent,
                        apiResponse: apiResponse,
                        primaryCategory: primaryCategory,
                        showBack: showBack,
                        popBack: () {
                          Navigator.of(context).pop();
                          if (primaryCategory ==
                              PrimaryCategory.practiceAssessment) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      QuestionStatusSummaryV2(
                          apiResponse: apiResponse,
                          assessmentsInfo: assessmentsInfo.toList())
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            height: 90.w,
            width: 1.sw,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16).r,
            decoration: BoxDecoration(color: TocModuleColors.appBarBackground),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  _generateInteractTelemetryData(context: context);
                  Navigator.of(context).pop();
                  await Navigator.pushReplacement(
                      context,
                      FadeRoute(
                          page: CourseAssessmentPlayer(
                        course,
                        identifier,
                        updateContentProgress,
                        batchId,
                        parentCourseId: course.identifier,
                        compatibilityLevel: compatibilityLevel,
                        resourceNavigateItems: resourceInfo,
                        isFeatured: isFeatured,
                        courseCategory: courseCategory,
                        isPreRequisite: isPreRequisite,
                      )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: TocModuleColors.appBarBackground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)).r,
                        side: BorderSide(color: TocModuleColors.primaryBlue))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/img/reattempt.svg',
                      colorFilter: ColorFilter.mode(
                          TocModuleColors.darkBlue, BlendMode.srcIn),
                      height: 20.w,
                    ),
                    Text(
                      '  ${TocLocalizations.of(context)!.mAssessmentReattemptTest}',
                      style: GoogleFonts.lato(
                        color: TocModuleColors.primaryBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _generateInteractTelemetryData({required BuildContext context}) async {
    // var telemetryRepository = TelemetryRepository();
    // Map eventData = telemetryRepository.getInteractTelemetryEvent(
    //     pageIdentifier: TelemetryPageIdentifier.assessmentReattemptPageUri,
    //     contentId: identifier,
    //     subType: AssessmentType.questionWeightage,
    //     env: TelemetryEnv.learn,
    //     objectType: primaryCategory,
    //     clickId: TelemetryIdentifier.reattemptTest);
    // await telemetryRepository.insertEvent(eventData: eventData);
  }
}
