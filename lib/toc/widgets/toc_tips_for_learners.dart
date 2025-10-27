import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/util/fade_route.dart';

class TocTipsForLearner extends StatelessWidget {
  const TocTipsForLearner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              Text(
                TocLocalizations.of(context)!.mTipsForLearners,
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   FadeRoute(
                  //     page: ViewAllTips(
                  //       tips: TipsRepository.getTips(),
                  //     ),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    Text(
                      TocLocalizations.of(context)!.mCommonReadMore,
                      style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        color: TocModuleColors.darkBlue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: TocModuleColors.darkBlue,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // TipsDisplayCard(
        //   tips: TipsRepository.getTips(),
        // )
      ],
    );
  }
}
