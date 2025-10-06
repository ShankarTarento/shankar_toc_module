import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/repository/review_rating_repository.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/widgets/rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/widgets/review.dart';

class ReviewRating extends StatefulWidget {
  final Course courseRead;
  const ReviewRating({super.key, required this.courseRead});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ReviewRatingRepository value, child) {
        OverallRating? overallRatings = value.courseRating;
        if (overallRatings == null ||
            overallRatings.totalNumberOfRatings == '0.0') {
          return const SizedBox.shrink();
        }
        return Container(
          color: TocModuleColors.darkBlue.withValues(alpha: 0.18),
          child: Column(
            children: [
              Ratings(
                ratingAndReview: overallRatings,
              ),
              SizedBox(
                height: 16.w,
              ),
              Reviews(
                reviewAndRating: overallRatings,
                course: widget.courseRead,
              ),
            ],
          ),
        );
      },
    );
  }
}
