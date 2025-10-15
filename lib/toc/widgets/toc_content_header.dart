import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/date_time_helper.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/widgets/primary_category_widget.dart';
import 'language_listview.dart';

class TocContentHeader extends StatelessWidget {
  const TocContentHeader(
      {Key? key,
      required this.course,
      this.enrolledCourse,
      this.clickedRating,
      this.recommendationId,
      required this.isFeedbackPending,
      required this.submitFeedback})
      : super(key: key);
  final Course? enrolledCourse;
  final Course course;
  final VoidCallback? clickedRating;
  final VoidCallback submitFeedback;
  final bool isFeedbackPending;
  final String? recommendationId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TocModuleColors.darkBlue,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 8.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: ListView(shrinkWrap: true, children: <Widget>[
              PrimaryCategoryWidget(
                contentType: course.courseCategory,
                bgColor: TocModuleColors.black40,
                textColor: TocModuleColors.appBarBackground,
                addedMargin: true,
              ),
              SizedBox(height: 12.w),
              Text(
                course.name,
                style: GoogleFonts.montserrat(
                    color: TocModuleColors.appBarBackground,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.12),
                softWrap: true,
              ),
              SizedBox(height: 8.w),
              Text(
                course.source != ''
                    ? '${TocLocalizations.of(context)!.mCommonBy.toLowerCase()} ${course.source}'
                    : '',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.429.w,
                      fontSize: 14.sp,
                      color: TocModuleColors.white70,
                      letterSpacing: 0.25,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.w),
              Consumer<TocRepository>(builder: (context, TocRepository, _) {
                var courseRatingInfo = TocRepository.courseRating;
                if (courseRatingInfo != null) {
                  if (courseRatingInfo.runtimeType != String) {
                    double totalRating = getTotalRating(courseRatingInfo);
                    int totalNoOfRating = getTotalNoOfRating(courseRatingInfo);

                    return InkWell(
                      onTap: clickedRating,
                      child: TotalRatingWidget(
                        rating: totalRating.toStringAsFixed(1),
                        noOfRating: totalNoOfRating.toString(),
                        additionalTags: course.additionalTags,
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                } else {
                  return SizedBox.shrink();
                }
              }),
              SizedBox(height: 8.w),
              Text(
                course.lastUpdatedOn != null
                    ? '(${TocLocalizations.of(context)!.mCourseLastUpdatedOn} ${DateTimeHelper.getDateTimeInFormat(course.lastUpdatedOn!, desiredDateFormat: 'MMM dd, yyyy')})'
                    : '',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12.sp,
                      height: 1.333.w,
                      color: TocModuleColors.white70,
                      letterSpacing: 0.25,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.w),
            ]),
          ),
          course.languageMap.languages.entries.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8).r,
                  child: LanguageListView(course: course),
                )
              : Center(),
          enrolledCourse != null
              ? OverallProgress(course: course, enrolledCourse: enrolledCourse!)
              : Center(),
          isFeedbackPending
              ? Container(
                  width: 1.0.sw,
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16).r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16).r,
                      color: TocModuleColors.whiteGradientOne),
                  padding: EdgeInsets.symmetric(horizontal: 16).r,
                  child: Row(
                    children: [
                      SvgPicture.network(
                          ApiUrl.baseUrl +
                              '/assets/images/sakshamAI/lady-greet.svg',
                          height: 70.w,
                          placeholderBuilder: (context) => SizedBox.shrink()),
                      Container(
                        width: 0.7.sw,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16, top: 16).r,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        TocLocalizations.of(context)!
                                            .mIgotAIIsThisRelevantCourse,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: TocModuleColors.greys)),
                                    SizedBox(height: 8.w),
                                    Text(
                                        TocLocalizations.of(context)!
                                            .mIgotAIPleaseShareFeedback,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: TocModuleColors.grey84))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                      right: 16, bottom: 16, top: 8)
                                  .r,
                              child: RelevanceChoiceButtons(
                                  onNonReleventBtnPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    isDismissible: true,
                                    enableDrag: false,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (BuildContext contextx) {
                                      return DraggableScrollableSheet(
                                          initialChildSize: 0.63.w,
                                          minChildSize: 0.3,
                                          maxChildSize: 0.9,
                                          expand: false,
                                          builder:
                                              (contextx, scrollController) {
                                            return SingleChildScrollView(
                                              controller: scrollController,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Wrap(
                                                  children: [
                                                    FeedbackOverlayCard(
                                                        isVisible: true,
                                                        padding: 16,
                                                        titleColor:
                                                            TocModuleColors
                                                                .deepBlue,
                                                        borderColor: TocModuleColors
                                                            .grey16,
                                                        submitBtnColor:
                                                            TocModuleColors
                                                                .darkBlue,
                                                        submitTextColor:
                                                            TocModuleColors
                                                                .appBarBackground,
                                                        cancelBtnColor:
                                                            TocModuleColors
                                                                .darkBlue,
                                                        textFieldFillColor:
                                                            Colors.transparent,
                                                        submitPressed:
                                                            (feedback) async {
                                                          if (recommendationId !=
                                                              null) {
                                                            await IgotAIRepository()
                                                                .saveFeedback(
                                                                    courseId:
                                                                        course
                                                                            .id,
                                                                    recommendationId:
                                                                        recommendationId!,
                                                                    feedback:
                                                                        feedback,
                                                                    rating: 0);
                                                            submitFeedback();
                                                            Navigator.pop(
                                                                contextx);
                                                          }
                                                        },
                                                        cancelPressed: () {
                                                          Navigator.pop(
                                                              contextx);
                                                        }),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    });
                              }, onReleventBtnPressed: () async {
                                if (recommendationId != null) {
                                  String response = await IgotAIRepository()
                                      .saveFeedback(
                                          courseId: course.id,
                                          recommendationId: recommendationId!,
                                          feedback: EnglishLang.good,
                                          rating: 1);
                                  if (response == EnglishLang.success) {
                                    Helper.showSnackbarWithCloseIcon(
                                        context,
                                        TocLocalizations.of(context)!
                                            .mIgotAIThanksForFeedback);
                                    submitFeedback();
                                  }
                                }
                              }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Center(),
        ],
      ),
    );
  }

  int getTotalNoOfRating(courseRatingInfo) {
    return courseRatingInfo['total_number_of_ratings'] != null
        ? courseRatingInfo['total_number_of_ratings'].ceil()
        : 0;
  }

  double getTotalRating(courseRatingInfo) {
    return courseRatingInfo['sum_of_total_ratings'] != null &&
            courseRatingInfo['total_number_of_ratings'] != null
        ? (courseRatingInfo['sum_of_total_ratings'] /
            courseRatingInfo['total_number_of_ratings'])
        : 0;
  }
}
