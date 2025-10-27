import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String title;
  final String content;
  final bool isHtml;
  final int maxLength;

  const ExpandableTextWidget({
    Key? key,
    required this.title,
    required this.content,
    this.isHtml = false,
    this.maxLength = 150,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;
  String? _parsedText;

  @override
  void initState() {
    super.initState();
    if (widget.isHtml) {
      _parsedText = html_parser.parse(widget.content).body?.text ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText = widget.isHtml ? _parsedText! : widget.content;
    final isOverflowing = displayText.length > widget.maxLength;
    final showText = isExpanded || !isOverflowing
        ? widget.content
        : (widget.isHtml
              ? _parsedText!.substring(0, widget.maxLength) + "..."
              : widget.content.substring(0, widget.maxLength) + "...");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8.w),
        widget.isHtml
            ? HtmlWidget(
                showText,
                textStyle: GoogleFonts.lato(
                  fontSize: 14.sp,
                  height: 1.5.w,
                  fontWeight: FontWeight.w400,
                  color: TocModuleColors.grey84,
                ),
              )
            : Text(
                showText,
                maxLines: isExpanded ? null : 3,
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  height: 1.5.w,
                  fontWeight: FontWeight.w400,
                  color: TocModuleColors.grey84,
                ),
              ),
        if (isOverflowing)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Padding(
              padding: EdgeInsets.only(top: 10.r),
              child: Text(
                isExpanded
                    ? TocLocalizations.of(context)!.mStaticViewLess
                    : "...${TocLocalizations.of(context)!.mStaticViewMore}",
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  height: 1.5.w,
                  color: TocModuleColors.darkBlue,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
