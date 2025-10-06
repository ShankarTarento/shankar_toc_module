import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/competency_model.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class CompetencyCard extends StatefulWidget {
  final CompetencyTheme competencyTheme;
  final Color backgroundColor;

  const CompetencyCard({
    Key? key,
    required this.competencyTheme,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<CompetencyCard> createState() => _CompetencyCardState();
}

class _CompetencyCardState extends State<CompetencyCard> {
  bool showAllItems = false;

  CompetencyTheme? get currentTheme => widget.competencyTheme;

  @override
  Widget build(BuildContext context) {
    final subThemes = currentTheme?.subTheme ?? [];

    return Container(
      width: 340.w,
      margin: EdgeInsets.only(top: 15, right: 15).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: widget.backgroundColor,
      ),
      child: Container(
        width: 1.sw,
        margin: EdgeInsets.only(top: 4).r,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          border:
              Border.all(color: TocModuleColors.greys.withValues(alpha: 0.04)),
          color: TocModuleColors.appBarBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 8.h),
            _buildSubThemes(subThemes),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      currentTheme?.name ?? '',
      style: GoogleFonts.lato(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubThemes(List<CompetencySubTheme> subThemes) {
    final displayCount = showAllItems ? subThemes.length : 1;

    return SizedBox(
      width: 1.sw,
      child: Wrap(
        alignment:
            showAllItems ? WrapAlignment.start : WrapAlignment.spaceBetween,
        children: [
          ...List.generate(
              displayCount, (index) => _buildSubThemeChip(subThemes[index])),
          if (subThemes.length > 1) _buildToggleButton(),
        ],
      ),
    );
  }

  Widget _buildSubThemeChip(CompetencySubTheme subTheme) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 16).r,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8).r,
      decoration: BoxDecoration(
        border: Border.all(color: TocModuleColors.darkBlue),
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: Text(
        subTheme.name ?? "",
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
      ),
    );
  }

  Widget _buildToggleButton() {
    return GestureDetector(
      onTap: () => setState(() => showAllItems = !showAllItems),
      child: Padding(
        padding: EdgeInsets.only(top: 8.r),
        child: Text(
          showAllItems
              ? TocLocalizations.of(context)!.mCompetencyViewLessTxt
              : TocLocalizations.of(context)!.mCompetencyViewMoreTxt,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12.sp,
                height: 2.5.w,
                decoration: TextDecoration.underline,
                decorationThickness: 1.0.w,
              ),
        ),
      ),
    );
  }
}
