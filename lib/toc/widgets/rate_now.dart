import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:provider/provider.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/repository/review_rating_repository.dart';
import 'package:toc_module/toc/util/fade_route.dart';
import 'package:toc_module/toc/widgets/toc_content_header/widgets/course_rating_submitted.dart';

class RateNowPopUp extends StatelessWidget {
  final Course courseDetails;
  RateNowPopUp({Key? key, required this.courseDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Padding(
        padding: const EdgeInsets.all(24.0).r,
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 30).r,
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundColor: ModuleColors.grey40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: ModuleColors.appBarBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.sh / 3.5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/img/certificate_icon.svg',
                  width: 36.0.w,
                  height: 32.0.w,
                ),
                SizedBox(height: 8.w),
                Text(
                  TocLocalizations.of(
                    context,
                  )!.mStaticCongratulationsOnCompleting,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ModuleColors.appBarBackground,
                  ),
                ),
                SizedBox(height: 8.w),
                Text(
                  TocLocalizations.of(
                    context,
                  )!.mStaticYourCertificateWillBeGeneratedWithin48Hrs,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ModuleColors.white70,
                  ),
                ),
                Divider(color: ModuleColors.appBarBackground, height: 40.w),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  glow: false,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  unratedColor: ModuleColors.appBarBackground,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0).r,
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: ModuleColors.orangeBackground),
                  onRatingUpdate: (rating) {
                    //     print(rating);
                    _saveRatingAndReview(
                      id: courseDetails.id,
                      context: context,
                      rating: rating,
                      comment: '',
                      type: courseDetails.courseCategory,
                    );
                  },
                ),
                SizedBox(height: 8.w),
                Text(
                  TocLocalizations.of(context)!.mCommonRateTheCourse,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ModuleColors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _saveRatingAndReview({id, type, rating, comment, context}) async {
    bool response = await ReviewRatingRepository().postCourseReview(
      courseId: id,
      primaryCategory: type,
      rating: rating,
      comment: comment,
    );
    if (response) {
      Navigator.push(
        context,
        FadeRoute(
          page: CourseRatingSubmitted(
            title: courseDetails.name,
            courseId: courseDetails.id,
            primaryCategory: courseDetails.primaryCategory,
          ),
        ),
      );
      Provider.of<ReviewRatingRepository>(
        context,
        listen: false,
      ).getCourseReviewSummary(
        courseId: courseDetails.id,
        primaryCategory: courseDetails.primaryCategory,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong while submitting your rating."),
          backgroundColor: ModuleColors.negativeLight,
        ),
      );
    }
  }
}
