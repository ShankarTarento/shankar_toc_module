import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmayogi_mobile/constants/_constants/color_constants.dart';
import 'package:karmayogi_mobile/ui/widgets/_tips_for_learning/pages/view_all_tips.dart';
import 'package:karmayogi_mobile/ui/widgets/_tips_for_learning/repository/tips_repository.dart';
import 'package:karmayogi_mobile/ui/widgets/_tips_for_learning/widgets/tips_display_card.dart';
import 'package:karmayogi_mobile/util/faderoute.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class TocTipsForLearner extends StatelessWidget {
  const TocTipsForLearner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 8,
        ),
        child: Row(
          children: [
            Text(
              TocLocalizations.of(context)!.mTipsForLearners,
              style: GoogleFonts.montserrat(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeRoute(
                      page: ViewAllTips(
                        tips: TipsRepository.getTips(),
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      TocLocalizations.of(context)!.mCommonReadMore,
                      style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.darkBlue,
                      size: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
      TipsDisplayCard(
        tips: TipsRepository.getTips(),
      )
    ]);
  }
}
