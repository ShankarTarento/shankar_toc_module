import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/screens/view_all_reviews.dart';

class Reviews extends StatelessWidget {
  final OverallRating reviewAndRating;
  final Course course;
  const Reviews({Key? key, required this.reviewAndRating, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10).r,
          child: Row(
            children: [
              Text(
                TocLocalizations.of(context)!.mStaticTopReviews,
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ViewAllReviews(
                            course: course,
                          )),
                    ),
                  );
                },
                child: Text(
                  TocLocalizations.of(context)!.mStaticShowAll,
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    color: TocModuleColors.darkBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        // SizedBox(
        //   height: 16,
        // ),
        reviewAndRating.reviews!.isNotEmpty
            ? SizedBox(
                height: 112.w,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: reviewAndRating.reviews!.length,
                    itemBuilder: (context, index) => reviewCard(
                        index: index,
                        review: reviewAndRating.reviews![index],
                        context: context)),
              )
            : Container(
                padding: EdgeInsets.all(16).r,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16).r,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: TocModuleColors.appBarBackground,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Text(
                  TocLocalizations.of(context)!.mStaticNoReviewsFound,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
        SizedBox(
          height: 16.w,
        ),
      ],
    );
  }

  Widget reviewCard(
      {required Review review,
      required BuildContext context,
      required int index}) {
    return Container(
      height: 112.w,
      width: 1.sw / 1.2,
      padding: EdgeInsets.all(16).r,
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: TocModuleColors.appBarBackground,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                backgroundColor: TocModuleColors.greenOne,
                child: Text(
                  TocHelper.getInitials(review.firstName!),
                  style: GoogleFonts.lato(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: TocModuleColors.appBarBackground,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Flexible(
                child: Text(
                  review.firstName ?? "",
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: TocModuleColors.greys.withValues(alpha: 0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8).r,
                child: CircleAvatar(
                  radius: 1.r,
                  backgroundColor: TocModuleColors.greys.withValues(alpha: 0.6),
                ),
              ),
              Text(
                getReviewTime(review.date.toString(), context),
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: TocModuleColors.greys.withValues(alpha: 0.6),
                ),
              ),
              Spacer(),
              Icon(
                Icons.star,
                color: TocModuleColors.verifiedBadgeIconColor,
                size: 16.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                review.rating.toString(),
                style: GoogleFonts.lato(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: TocModuleColors.greys.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.w,
          ),
          Flexible(
            child: Text(
              review.review ?? '',
              style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: TocModuleColors.greys,
                  height: 1.5.w),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  String getReviewTime(String time, BuildContext context) {
    DateTime now = DateTime.now();
    DateTime reviewTime = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    Duration difference = now.difference(reviewTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${TocLocalizations.of(context)!.mStaticMinutesAgo}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${TocLocalizations.of(context)!.mStaticHoursAgo}';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} ${TocLocalizations.of(context)!.mStaticDaysAgo}';
    } else {
      int months =
          (now.year - reviewTime.year) * 12 + now.month - reviewTime.month;
      return '$months ${TocLocalizations.of(context)!.mHomeDiscussionMonthsAgo}';
    }
  }
}
