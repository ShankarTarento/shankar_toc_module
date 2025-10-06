import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class TocTags extends StatefulWidget {
  final List<dynamic> keywords;
  final String title;

  const TocTags({
    Key? key,
    required this.keywords,
    required this.title,
  }) : super(key: key);

  @override
  State<TocTags> createState() => _TagsState();
}

class _TagsState extends State<TocTags> {
  bool isExpanded = false;

  void _toggleExpanded() {
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final hasTags = widget.keywords.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        SizedBox(height: 15.w),
        hasTags ? _buildTagsList(context) : _buildEmptyText(context),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: GoogleFonts.lato(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildTagsList(BuildContext context) {
    return ExtendedWrap(
      minLines: 1,
      maxLines: isExpanded ? 10 : 1,
      overflowWidget: GestureDetector(
        onTap: _toggleExpanded,
        child: Text(
          isExpanded
              ? TocLocalizations.of(context)!.mStaticViewLess
              : TocLocalizations.of(context)!.mStaticViewMore,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                height: 1.3.w,
                decoration: TextDecoration.underline,
                decorationThickness: 1.0.w,
              ),
        ),
      ),
      runSpacing: 8,
      spacing: 0,
      alignment: WrapAlignment.start,
      children: _buildTagItems(context),
    );
  }

  List<Widget> _buildTagItems(BuildContext context) {
    return List.generate(widget.keywords.length, (index) {
      final tag = widget.keywords[index];
      final isLast = index == widget.keywords.length - 1;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tag,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            if (!isLast)
              Padding(
                padding: EdgeInsets.all(7.0).r,
                child: CircleAvatar(
                  backgroundColor: TocModuleColors.grey40,
                  radius: 1.r,
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildEmptyText(BuildContext context) {
    return Text(
      TocLocalizations.of(context)!.mProfileNoTags,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w400,
            height: 1.5.w,
          ),
    );
  }
}
