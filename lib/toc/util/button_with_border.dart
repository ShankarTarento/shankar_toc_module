import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class ButtonWithBorder extends StatelessWidget {
  final VoidCallback onPressCallback;
  final Color borderColor;
  final Color bgColor;
  final String text;
  final TextStyle? textStyle;
  final int maxLines;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const ButtonWithBorder(
      {super.key,
      required this.onPressCallback,
      this.bgColor = TocModuleColors.appBarBackground,
      this.borderColor = TocModuleColors.darkBlue,
      required this.text,
      this.textStyle,
      this.maxLines = 1,
      this.borderRadius = 63,
      this.padding});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressCallback,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius).r,
            side: BorderSide(color: borderColor)),
        // onSurface: Colors.grey,
      ),
      child: Text(text,
          maxLines: maxLines,
          style: textStyle ?? Theme.of(context).textTheme.titleSmall),
    );
  }
}
