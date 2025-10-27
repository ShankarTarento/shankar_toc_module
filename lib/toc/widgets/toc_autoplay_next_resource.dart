import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class AutoplayNextResource extends StatelessWidget {
  const AutoplayNextResource({
    Key? key,
    required this.clickedPlayNextResource,
    required this.cancelTimer,
  }) : super(key: key);

  final VoidCallback clickedPlayNextResource;
  final VoidCallback cancelTimer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => clickedPlayNextResource(),
          child: Container(
            padding: EdgeInsets.all(6).r,
            child: Text(
              TocLocalizations.of(context)!.mUpNext,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 16.sp,
                letterSpacing: 0.12,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            CircularCountDownTimer(
              duration: 30,
              fillColor: TocModuleColors.appBarBackground,
              backgroundColor: TocModuleColors.greys87,
              height: 50.w,
              ringColor: TocModuleColors.greys87,
              width: 50.w,
              onComplete: () => clickedPlayNextResource(),
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 24.sp,
              color: TocModuleColors.appBarBackground,
            ),
          ],
        ),
        InkWell(
          onTap: () => cancelTimer(),
          child: Container(
            padding: EdgeInsets.all(6).r,
            child: Text(
              TocLocalizations.of(context)!.mStaticCancel,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 16.sp,
                letterSpacing: 0.12,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
