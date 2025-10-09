import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class ShareResponseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 16).r,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12).r),
            actionsPadding: EdgeInsets.zero.r,
            actions: [
              Container(
                padding: EdgeInsets.all(16).r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12).r,
                    color: TocModuleColors.positiveLight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          TocLocalizations.of(context)!
                              .mContentSharePageSuccessMessage,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: TocModuleColors.appBarBackground,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 4, 0).r,
                      child: Icon(
                        Icons.check,
                        color: TocModuleColors.appBarBackground,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ],
    );
  }
}
