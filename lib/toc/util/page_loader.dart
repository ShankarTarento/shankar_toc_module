import 'package:flutter/material.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class PageLoader extends StatelessWidget {
  final double top;
  final double bottom;
  final double strokeWidth;
  final bool isLoginPage;
  final bool isLightTheme;

  PageLoader(
      {Key? key,
      this.top = 0,
      this.bottom = 0,
      this.isLightTheme = true,
      this.isLoginPage = false,
      this.strokeWidth = 4.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color:
            isLoginPage ? TocModuleColors.appBarBackground : Colors.transparent,
        margin: EdgeInsets.only(top: top, bottom: bottom),
        child: Center(
            child: CircularProgressIndicator(
          color: isLightTheme
              ? TocModuleColors.darkBlue
              : TocModuleColors.appBarBackground,
          strokeWidth: strokeWidth,
        )));
  }
}
