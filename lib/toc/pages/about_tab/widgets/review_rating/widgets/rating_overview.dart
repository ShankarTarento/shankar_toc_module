import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/repository/review_rating_repository.dart';

class RatingOverview extends StatelessWidget {
  final Course courseRead;

  const RatingOverview({Key? key, required this.courseRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ReviewRatingRepository provider, _) {
        final bool shouldShowRating =
            provider.courseRating != null &&
            provider.courseRating!.totalNumberOfRatings != '0.0';

        if (!shouldShowRating) {
          return const SizedBox.shrink();
        }

        return Row(
          children: <Widget>[
            _buildRatingPill(
              context,
              getTotalRating(provider.courseRating!).toStringAsFixed(1),
              provider.courseRating!.totalNumberOfRatings != null
                  ? provider.courseRating!.totalNumberOfRatings!
                        .ceil()
                        .toString()
                  : "0",
            ),
            SizedBox(width: 8.w),
            _buildTagsList(context),
          ],
        );
      },
    );
  }

  Widget _buildRatingPill(
    BuildContext context,
    String rating,
    String noOfRating,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: TocModuleColors.greys60,
        borderRadius: BorderRadius.circular(63).r,
      ),
      padding: EdgeInsets.all(8).r,
      child: Row(
        children: [
          // Star Icon
          Padding(
            padding: EdgeInsets.only(right: 5).r,
            child: Icon(
              Icons.star,
              size: 16.sp,
              color: TocModuleColors.primaryOne,
            ),
          ),
          // Average Rating Text
          Text(
            rating,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.25,
            ),
          ),
          // Divider
          Container(
            height: 20.w,
            width: 2.w,
            color: TocModuleColors.white016,
            margin: EdgeInsets.symmetric(horizontal: 7).r,
          ),
          // Number of Ratings Text
          Text(
            noOfRating,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.25,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the horizontal list of tags, if any exist.
  Widget _buildTagsList(BuildContext context) {
    if (courseRead.additionalTags.isNotEmpty != true) {
      return const SizedBox.shrink();
    }

    return Expanded(
      child: SizedBox(
        height: 20.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: courseRead.additionalTags.length,
          itemBuilder: (BuildContext context, int index) {
            final tag = courseRead.additionalTags[index].toString();
            return _buildTagChip(context, tag);
          },
        ),
      ),
    );
  }

  /// Builds a single styled chip for a tag.
  Widget _buildTagChip(BuildContext context, String tag) {
    return Container(
      margin: EdgeInsets.only(left: 4).r,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4).r,
      decoration: BoxDecoration(
        color: TocModuleColors.yellowShade,
        borderRadius: BorderRadius.circular(2).r,
      ),
      child: Center(
        child: Text(
          _getLocalizedTag(context, tag),
          style: TextStyle(
            color: TocModuleColors.enrollLabelGrey,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }

  String _getLocalizedTag(BuildContext context, String tag) {
    final l10n = TocLocalizations.of(context)!;
    switch (tag) {
      case 'mostEnrolled':
        return l10n.mStaticMostEnrolled;
      case 'mostTrending':
        return l10n.mHomeLabelMostTrending;
      default:
        return tag;
    }
  }

  double getTotalRating(OverallRating courseRatingInfo) {
    return courseRatingInfo.sumOfTotalRatings != null &&
            courseRatingInfo.totalNumberOfRatings != null
        ? (courseRatingInfo.sumOfTotalRatings! /
              courseRatingInfo.totalNumberOfRatings!)
        : 0;
  }
}
