import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:open_file_plus/open_file_plus.dart';

class CertificateBottomSheet extends StatelessWidget {
  final String filePath;
  const CertificateBottomSheet({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 20).r,
                height: 6.w,
                width: 0.25.sw,
                decoration: BoxDecoration(
                  color: TocModuleColors.grey16,
                  borderRadius: BorderRadius.all(Radius.circular(16).r),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15).r,
              child: Text(
                TocLocalizations.of(context)!.mStaticFileDownloadingCompleted,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10).r,
              child: GestureDetector(
                onTap: () => openFile(filePath: filePath, context: context),
                child: roundedButton(
                  TocLocalizations.of(context)!.mStaticOpen,
                  TocModuleColors.darkBlue,
                  TocModuleColors.appBarBackground,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15).r,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: roundedButton(
                    TocLocalizations.of(context)!.mStaticClose,
                    TocModuleColors.appBarBackground,
                    TocModuleColors.customBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> openFile(
      {required String filePath, required BuildContext context}) async {
    OpenResult openRes = await OpenFile.open(filePath);
    if (openRes.type == ResultType.done) {
    } else {
      TocHelper.showSnackBarMessage(
          context: context,
          text: openRes.message,
          textColor: Colors.white,
          bgColor: TocModuleColors.negativeLight);
    }
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = Container(
      width: 1.sw - 50.w,
      padding: EdgeInsets.all(10).r,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(const Radius.circular(4.0).r),
        border: bgColor == TocModuleColors.appBarBackground
            ? Border.all(color: TocModuleColors.grey40)
            : Border.all(color: bgColor),
      ),
      child: Text(
        buttonLabel,
        style: GoogleFonts.montserrat(
            decoration: TextDecoration.none,
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
      ),
    );
    return loginBtn;
  }
}
