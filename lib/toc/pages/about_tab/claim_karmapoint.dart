import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class TocClaimKarmaPoints extends StatelessWidget {
  final String courseId;
  final ValueChanged<bool> claimedKarmaPoint;
  TocClaimKarmaPoints({
    Key? key,
    required this.courseId,
    required this.claimedKarmaPoint,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4).r,
      child: ElevatedButton(
        onPressed: () async {
          var response = await claimKarmaPoints();
          if (response.toString() == "Success") {
            claimedKarmaPoint(true);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  TocLocalizations.of(context)!.mStaticSomethingWrong,
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TocModuleColors.verifiedBadgeIconColor,
          minimumSize: const Size.fromHeight(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(63).r,
          ),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              textWidget(
                TocLocalizations.of(context)!.mStaticClaim + ' ',
                FontWeight.w700,
                color: TocModuleColors.appBarBackground,
                fontSize: 14.sp,
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: SvgPicture.asset(
                  'assets/img/kp_icon.svg',
                  width: 24.w,
                  height: 24.w,
                ),
              ),
              textWidget(
                ' +10 ' +
                    TocLocalizations.of(context)!.mStaticKarmaPoints +
                    '.',
                FontWeight.w700,
                color: TocModuleColors.appBarBackground,
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan textWidget(
    String message,
    FontWeight font, {
    Color color = TocModuleColors.greys87,
    double fontSize = 12,
  }) {
    return TextSpan(
      text: message,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: font,
        letterSpacing: 0.25,
      ),
    );
  }

  Future<String> claimKarmaPoints() async {
    return await TocRepository().claimKarmaPoints(courseId);
  }
}
