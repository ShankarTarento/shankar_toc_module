import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/widgets/star_progress_bar.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class Ratings extends StatelessWidget {
  final OverallRating ratingAndReview;
  const Ratings({Key? key, required this.ratingAndReview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity.w,
      padding: const EdgeInsets.all(20).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                ratingAndReview.sumOfTotalRatings != null
                    ? (ratingAndReview.sumOfTotalRatings! /
                              ratingAndReview.totalNumberOfRatings!)
                          .toStringAsFixed(1)
                    : "0",
                style: GoogleFonts.montserrat(
                  fontSize: 24.sp,
                  color: TocModuleColors.darkBlue,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
              ),
              SizedBox(width: 16.w),
              RatingBarIndicator(
                rating: ratingAndReview.sumOfTotalRatings != null
                    ? ratingAndReview.sumOfTotalRatings! /
                          ratingAndReview.totalNumberOfRatings!
                    : 0,
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: TocModuleColors.primaryOne),
                itemCount: 5,
                itemSize: 30.0.sp,
                direction: Axis.horizontal,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20).r,
            child: Text(
              // '1 rating',
              "${ratingAndReview.totalNumberOfRatings!.ceil().toString()} ${TocLocalizations.of(context)!.mCommonratings}",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          StarProgressBar(
            text: '5 ${TocLocalizations.of(context)!.mStaticStar}',
            progress:
                ratingAndReview.totalCount5Stars != null &&
                    ratingAndReview.totalCount5Stars! > 0
                ? ratingAndReview.totalCount5Stars! /
                      ratingAndReview.totalNumberOfRatings!
                : 0,
          ),
          StarProgressBar(
            text: '4 ${TocLocalizations.of(context)!.mStaticStar}',
            progress:
                ratingAndReview.totalCount4Stars != null &&
                    ratingAndReview.totalCount4Stars! > 0
                ? ratingAndReview.totalCount4Stars! /
                      ratingAndReview.totalNumberOfRatings!
                : 0,
          ),
          StarProgressBar(
            text: '3 ${TocLocalizations.of(context)!.mStaticStar}',
            progress:
                ratingAndReview.totalCount3Stars != null &&
                    ratingAndReview.totalCount3Stars! > 0
                ? ratingAndReview.totalCount3Stars! /
                      ratingAndReview.totalNumberOfRatings!
                : 0,
          ),
          StarProgressBar(
            text: '2 ${TocLocalizations.of(context)!.mStaticStar}',
            progress:
                ratingAndReview.totalCount2Stars != null &&
                    ratingAndReview.totalCount2Stars! > 0
                ? ratingAndReview.totalCount2Stars! /
                      ratingAndReview.totalNumberOfRatings!
                : 0,
          ),
          StarProgressBar(
            text: '1 ${TocLocalizations.of(context)!.mStaticStar}',
            progress:
                ratingAndReview.totalCount1Stars != null &&
                    ratingAndReview.totalCount1Stars! > 0
                ? ratingAndReview.totalCount1Stars! /
                      ratingAndReview.totalNumberOfRatings!
                : 0,
          ),
        ],
      ),
    );
  }
}
