import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class AssessmentV2ColorCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16).r,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0).r,
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 2.w,
                  color: TocModuleColors.grey16,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4).r,
                  child: Text(TocLocalizations.of(context)!.mStaticLegend),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2.w,
                  color: TocModuleColors.grey16,
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  indicatorWidget(
                      img: 'assets/img/assessment_answered.png',
                      message: TocLocalizations.of(context)!.mStaticAnswered),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0).r,
                    child: indicatorWidget(
                        img: 'assets/img/assessment_marked_review.png',
                        message: TocLocalizations.of(context)!
                            .mStaticMarkedAttendence),
                  )
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  indicatorWidget(
                      img: 'assets/img/assessment_not_answered.png',
                      message:
                          TocLocalizations.of(context)!.mStaticNotAnswered),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0).r,
                    child: indicatorWidget(
                        img: 'assets/img/assessment_not_visited.png',
                        message:
                            TocLocalizations.of(context)!.mStaticNotVisited),
                  )
                ])
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget indicatorWidget({required String img, required String message}) {
    return Row(
      children: [
        Image.asset(
          img,
          height: 24.w,
          width: 24.w,
        ),
        SizedBox(width: 4.w),
        Text(
          message,
          style: GoogleFonts.lato(
            color: TocModuleColors.blackLegend,
            fontWeight: FontWeight.w400,
            fontSize: 14.0.sp,
          ),
        )
      ],
    );
  }
}
