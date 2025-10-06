import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';

class CertificateNotGeneratedCard extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  const CertificateNotGeneratedCard(
      {super.key, required this.imageHeight, required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/img/default_certificate.png',
          alignment: Alignment.center,
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.cover,
        ),
        Container(
          height: imageHeight,
          width: MediaQuery.of(context).size.width / 1.5,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: TocModuleColors.greys60.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(8).r,
          ),
          child: Center(
              child: RichText(
            text: TextSpan(
              style: GoogleFonts.lato(
                color: TocModuleColors.appBarBackground,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                letterSpacing: 0.25,
                height: 1.5.w,
              ),
              children: [
                TextSpan(
                  text: TocLocalizations.of(context)!
                      .mStaticWaitingForCertificateGeneration,
                ),
                TextSpan(
                  text: ' $supportEmail',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: TocModuleColors.customBlue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      TocHelper.doLaunchUrl(url: "mailto:$supportEmail");
                    },
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
