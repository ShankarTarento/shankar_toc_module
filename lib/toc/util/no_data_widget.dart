import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class NoDataWidget extends StatelessWidget {
  final bool isCompleted;
  final double paddingTop;
  final String? title;
  final String? message;
  final bool isEvent;
  final int maxLines;

  const NoDataWidget({
    Key? key,
    this.isCompleted = false,
    this.paddingTop = 40,
    this.title,
    this.message,
    this.isEvent = false,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: paddingTop).r,
                  child: SvgPicture.asset(
                    isCompleted || message != null
                        ? 'assets/img/nodata_default.svg'
                        : 'assets/img/nodata_to_learn.svg',
                    alignment: Alignment.center,
                    // color: TocModuleColors.grey16,
                    width: 0.2.sw,
                    height: isCompleted ? 0.08.sh : 0.13.sh,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (title != null)
              Padding(
                  padding:
                      const EdgeInsets.only(top: 16, left: 40, right: 40).r,
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                    maxLines: maxLines,
                    textAlign: TextAlign.center,
                  )),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 40, right: 40).r,
              child: message != null
                  ? Text(
                      message!,
                      style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: ModuleColors.greys87),
                      maxLines: maxLines,
                      textAlign: TextAlign.center,
                    )
                  : isCompleted || message != null
                      ? Text(
                          TocLocalizations.of(context)!.mNoResourcesFound,
                          style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: ModuleColors.greys87),
                          maxLines: maxLines,
                          textAlign: TextAlign.center,
                        )
                      : RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: isEvent
                                    ? TocLocalizations.of(context)!
                                        .mLearnNoEventInProgress
                                    : TocLocalizations.of(context)!
                                        .mLearnNoCourseInProgress,
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: TocModuleColors.greys87),
                              ),
                              TextSpan(
                                text:
                                    ' ${TocLocalizations.of(context)!.mStaticClickHere}',
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: TocModuleColors.darkBlue),
                              ),
                              TextSpan(
                                text:
                                    ' ${TocLocalizations.of(context)!.explore}',
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: TocModuleColors.greys87),
                              )
                            ],
                          ),
                        ),
            )
          ],
        ),
      ],
    );
  }
}
