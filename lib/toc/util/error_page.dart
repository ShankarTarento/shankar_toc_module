import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 160).w,
                    child: SvgPicture.asset(
                      'assets/img/Unexpected_error.svg',
                      alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24).w,
                child: Text(
                  TocLocalizations.of(context)!.mErrorOops,
                  style: GoogleFonts.montserrat(
                    color: TocModuleColors.primaryThree,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0).w,
                child: Text(
                  TocLocalizations.of(context)!.mErrorSomethingIsNotRight,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: TocModuleColors.greys87,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.w,
                    letterSpacing: 0.12,
                    height: 1.4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  TocLocalizations.of(context)!.mErrorWeAreSorry,
                  style: GoogleFonts.lato(
                    color: TocModuleColors.greys87,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 1.5,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 48.w,
                  width: 272.w,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: TocModuleColors.primaryThree,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      TocLocalizations.of(context)!.mErrorGoBack,
                      style: GoogleFonts.lato(
                        color: TocModuleColors.appBarBackground,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        letterSpacing: 0.5,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
