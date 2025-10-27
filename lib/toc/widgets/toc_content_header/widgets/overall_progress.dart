import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';
import 'package:toc_module/toc/widgets/course_progress_widget.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/widgets/toc_content_header/widgets/course_rating.dart';

class OverallProgress extends StatefulWidget {
  final Course enrolledCourse;
  final Course course;

  const OverallProgress({
    Key? key,
    required this.course,
    required this.enrolledCourse,
  }) : super(key: key);

  @override
  State<OverallProgress> createState() => _OverallProgressState();
}

class _OverallProgressState extends State<OverallProgress> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    getProgress();
  }

  @override
  void didUpdateWidget(OverallProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    getProgress();
  }

  getProgress() {
    progress = widget.enrolledCourse.completionPercentage! / 100;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TocRepository, double?>(
      selector: (context, tocService) => tocService.courseProgress,
      builder: (context, courseProgress, _) {
        if (courseProgress != null) {
          if (progress < courseProgress) {
            progress = courseProgress;
          } else {
            progress = courseProgress;
          }
        }
        return Container(
          height: 50.w,
          padding: EdgeInsets.only(left: 16, right: 16).r,
          width: 1.sw,
          color: (progress * 100).toInt() == COURSE_COMPLETION_PERCENTAGE
              ? ModuleColors.deepBlue
              : ModuleColors.appBarBackground,
          child: Row(
            children: [
              CourseProgressWidget(progress: progress, width: 200.w),
              Spacer(),
              Selector<TocRepository, Map<String, dynamic>>(
                selector: (context, learnRepo) => learnRepo.languageProgress,
                builder: (context, languageProgress, child) {
                  final showRating = _shouldShowRating(
                    languageProgress: languageProgress,
                    courseLanguage: widget.course.language,
                    progress: progress,
                    enrolledStatus: widget.enrolledCourse.status,
                  );

                  return Visibility(
                    visible: showRating,
                    child: Selector<TocRepository, dynamic>(
                      selector: (context, learnRepository) =>
                          learnRepository.courseRatingAndReview,
                      builder: (context, yourReviews, _) {
                        return GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseRating(
                                  widget.enrolledCourse.name,
                                  widget.course.id,
                                  widget.enrolledCourse.primaryCategory,
                                  yourReviews,
                                  parentAction: () {},
                                  onSubmitted: (value) async {
                                    // await Provider.of<TocRepository>(context,
                                    //         listen: false)
                                    //     .getCourseReviewSummery(
                                    //         forceUpdate: true,
                                    //         courseId: widget.course.id,
                                    //         primaryCategory: widget
                                    //             .course.primaryCategory);
                                    // await Provider.of<TocRepository>(context,
                                    //         listen: false)
                                    //     .getYourReview(
                                    //         id: widget.course.id,
                                    //         primaryCategory:
                                    //             widget.course.primaryCategory,
                                    //         forceUpdate: true);
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ).r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(63).r,
                              color:
                                  (progress * 100).toInt() ==
                                      COURSE_COMPLETION_PERCENTAGE
                                  ? ModuleColors.orangeTourText
                                  : Colors.transparent,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color:
                                      (progress * 100).toInt() ==
                                          COURSE_COMPLETION_PERCENTAGE
                                      ? ModuleColors.deepBlue
                                      : ModuleColors.darkBlue,
                                  size: 18.sp,
                                ),
                                Text(
                                  yourReviews != null
                                      ? TocLocalizations.of(
                                          context,
                                        )!.mLearnEditRating
                                      : TocLocalizations.of(
                                          context,
                                        )!.mStaticRateNow,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color:
                                        (progress * 100).toInt() ==
                                            COURSE_COMPLETION_PERCENTAGE
                                        ? ModuleColors.deepBlue
                                        : ModuleColors.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  bool _shouldShowRating({
    required Map<String, dynamic> languageProgress,
    required String courseLanguage,
    required double progress,
    required String enrolledStatus,
  }) {
    final langKey = courseLanguage.toLowerCase();
    final langProgress = languageProgress[langKey] ?? 0;
    final isEnrolledStatus2 = (int.tryParse(enrolledStatus) ?? 0) == 2;
    final isOverallProgressAbove50 =
        (progress * 100).toInt() >= RATING_DEFAULT_PERCENTAGE;

    if (languageProgress.isEmpty) {
      return isEnrolledStatus2 || isOverallProgressAbove50;
    } else {
      return langProgress >= 50;
    }
  }
}
