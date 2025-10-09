import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';

class PrimaryCategoryWidget extends StatelessWidget {
  final String? contentType;
  final bool addedMargin, forceDefaultUi;
  final Color bgColor, textColor;

  const PrimaryCategoryWidget(
      {Key? key,
      this.contentType,
      this.addedMargin = false,
      this.forceDefaultUi = false,
      this.bgColor = TocModuleColors.orangeFaded,
      this.textColor = TocModuleColors.greys60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // width: 0.2.sh,
        margin: EdgeInsets.only(left: addedMargin ? 0 : 16).r,
        padding: EdgeInsets.all(4).r,
        decoration: BoxDecoration(
            color: (contentType == EventType.karmayogiSaptah && !forceDefaultUi)
                ? TocModuleColors.darkBlue
                : bgColor,
            borderRadius: BorderRadius.circular(16).r,
            border:
                Border.all(color: TocModuleColors.orangeTourText, width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/img/play_course.svg',
              width: 12.0.w,
              height: 12.0.w,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6).r,
              child: Text(
                contentType != null && contentType != '' ? contentType! : '',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 12.sp,
                      color: (contentType == EventType.karmayogiSaptah &&
                              !forceDefaultUi)
                          ? TocModuleColors.appBarBackground
                          : textColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
