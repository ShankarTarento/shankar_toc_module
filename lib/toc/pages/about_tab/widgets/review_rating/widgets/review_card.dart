import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';

class ReviewCard extends StatelessWidget {
  final String review;
  final String time;
  final String rating;
  final String name;

  const ReviewCard({
    Key? key,
    required this.review,
    required this.time,
    required this.rating,
    required this.name,
  }) : super(key: key);

  String getReviewTime(BuildContext context, String time) {
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
      return '$months ${TocLocalizations.of(context)!.mStaticMonthsAgo}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1.sw / 1.25,
                child: Text(
                  review,
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    height: 1.5.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: TocModuleColors.primaryOne,
                  ),
                  Text(
                    rating,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                backgroundColor: TocModuleColors.greenTwo,
                child: Text(
                  TocHelper.getInitials(name),
                  style: GoogleFonts.lato(
                    color: TocModuleColors.appBarBackground,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Flexible(
                child: Text(
                  name,
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    color: TocModuleColors.greys60,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: CircleAvatar(
                  radius: 1.r,
                  backgroundColor: TocModuleColors.greys60,
                ),
              ),
              Text(
                getReviewTime(context, time),
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  color: TocModuleColors.greys60,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
