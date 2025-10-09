import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/util/fade_route.dart';

class RateNowPopUp extends StatelessWidget {
  final Course courseDetails;
  RateNowPopUp({Key? key, required this.courseDetails}) : super(key: key);
  final LearnService learnService = LearnService();

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
                    backgroundColor: TocModuleColors.grey40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: TocModuleColors.appBarBackground,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.sh / 3.5,
            ),
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
                  TocLocalizations.of(context)!
                      .mStaticCongratulationsOnCompleting,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: TocModuleColors.appBarBackground,
                  ),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  TocLocalizations.of(context)!
                      .mStaticYourCertificateWillBeGeneratedWithin48Hrs,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: TocModuleColors.white70,
                  ),
                ),
                Divider(
                  color: TocModuleColors.appBarBackground,
                  height: 40.w,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  glow: false,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  unratedColor: TocModuleColors.appBarBackground,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0).r,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: TocModuleColors.orangeBackground,
                  ),
                  onRatingUpdate: (rating) {
                    //     print(rating);
                    _saveRatingAndReview(
                        id: courseDetails.id,
                        context: context,
                        rating: rating,
                        comment: '',
                        type: courseDetails.courseCategory);
                  },
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  TocLocalizations.of(context)!.mCommonRateTheCourse,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: TocModuleColors.white70,
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
    Response response =
        await learnService.postCourseReview(id, type, rating, comment);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        FadeRoute(
            page: CourseRatingSubmitted(
          title: courseDetails.name,
          courseId: courseDetails.id,
          primaryCategory: courseDetails.primaryCategory,
        )),
      );
      Provider.of<TocServices>(context, listen: false)
          .getCourseRating(courseDetails: courseDetails);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(jsonDecode(response.body)['params']['errmsg']),
          backgroundColor: TocModuleColors.negativeLight,
        ),
      );
    }
  }
}
