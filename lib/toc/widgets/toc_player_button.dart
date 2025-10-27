import 'package:flutter/material.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TocPlayerButton extends StatelessWidget {
  final int courseIndex;
  final VoidCallback? clickedPrevious;
  final VoidCallback? clickedNext;
  final VoidCallback? clickedFinish;
  final List resourceNavigateItems;
  final Widget aiTutorButton;

  const TocPlayerButton({
    Key? key,
    required this.courseIndex,
    required this.resourceNavigateItems,
    this.clickedPrevious,
    this.clickedNext,
    required this.aiTutorButton,
    this.clickedFinish,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (courseIndex > 0) {
                clickedPrevious!();
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
              child: Text(
                TocLocalizations.of(context)!.mStaticPrevious,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  letterSpacing: 0.25,
                  height: 1.429.w,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
          aiTutorButton,
          courseIndex == resourceNavigateItems.length - 1
              ? InkWell(
                  onTap: () {
                    clickedFinish!();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
                    child: Text(
                      TocLocalizations.of(context)!.mStaticFinish,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        letterSpacing: 0.25,
                        height: 1.429.w,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    clickedNext!();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
                    child: Text(
                      TocLocalizations.of(context)!.mStaticNext,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        letterSpacing: 0.25,
                        height: 1.429.w,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
