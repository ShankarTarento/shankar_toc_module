import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmayogi_mobile/constants/_constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

import '../../../../../constants/_constants/api_endpoints.dart';

class UpdateMessage extends StatelessWidget {
  const UpdateMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12).r,
      height: 250.w,
      width: 1.sw,
      color: TocModuleColors.greys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(TocLocalizations.of(context)!.mCompatibilityTitle,
              style: GoogleFonts.lato(
                  color: TocModuleColors.appBarBackground,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 12.w,
          ),
          Text(
            TocLocalizations.of(context)!.mCompatibilityDescription,
            style: GoogleFonts.lato(
              color: TocModuleColors.appBarBackground,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12.w,
          ),
          ElevatedButton(
              onPressed: () {
                launchURL(
                  url: Platform.isAndroid ? ApiUrl.androidUrl : ApiUrl.iOSUrl,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TocModuleColors.orangeTourText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50).r,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    TocLocalizations.of(context)!.mStaticUpdateApp,
                    style: GoogleFonts.lato(
                        color: TocModuleColors.appBarBackground,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Icon(
                    Icons.file_download_outlined,
                    size: 20.sp,
                  )
                ],
              ))
        ],
      ),
    );
  }

  void launchURL({required String url, BuildContext? context}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw TocLocalizations.of(context!)!.mStaticErrorMessage;
    }
  }
}
