import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/competency_model.dart';
import 'package:toc_module/toc/model/competency_passbook.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/competency_strip/widgets/competency_card.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class CompetencyStrip extends StatefulWidget {
  final List<CompetencyPassbook> competencies;

  const CompetencyStrip({Key? key, required this.competencies})
      : super(key: key);

  @override
  State<CompetencyStrip> createState() => _CompetencyStripState();
}

class _CompetencyStripState extends State<CompetencyStrip> {
  late List<CompetencyArea> competencyAreas;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    competencyAreas = _transformToCompetencyAreas(widget.competencies);
  }

  /// Converts flat competency list to nested structure
  List<CompetencyArea> _transformToCompetencyAreas(
      List<CompetencyPassbook> competencies) {
    final areas = <CompetencyArea>[];

    for (var competency in competencies) {
      final area = areas.firstWhere(
        (a) => a.name == competency.competencyArea,
        orElse: () {
          final newArea = CompetencyArea(
            name: competency.competencyArea,
            id: competency.competencyAreaId.toString(),
            competencyTheme: [],
          );
          areas.add(newArea);
          return newArea;
        },
      );

      final theme = area.competencyTheme!.firstWhere(
        (t) => t.name == competency.competencyTheme,
        orElse: () {
          final newTheme = CompetencyTheme(
            id: competency.competencyThemeId.toString(),
            name: competency.competencyTheme,
            subTheme: [],
          );
          area.competencyTheme!.add(newTheme);
          return newTheme;
        },
      );

      theme.subTheme ??= [];
      theme.subTheme!.add(CompetencySubTheme(
        id: competency.competencySubThemeId.toString(),
        name: competency.competencySubTheme,
      ));
    }

    return areas;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.competencies.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(TocLocalizations.of(context)!.mMsgNoCompetenciesFound),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        SizedBox(height: 16.w),
        _buildAreaTabs(),
        SizedBox(height: 4.w),
        _buildCompetencyCards(),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      TocLocalizations.of(context)!.mCompetencies,
      style: GoogleFonts.lato(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildAreaTabs() {
    return SizedBox(
      height: 32.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: competencyAreas.length,
        itemBuilder: (context, index) => _buildAreaTab(index),
      ),
    );
  }

  Widget _buildAreaTab(int index) {
    final isSelected = selectedIndex == index;
    final area = competencyAreas[index];

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        margin: EdgeInsets.only(right: 16).w,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16).r,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? TocModuleColors.darkBlue
                : const Color.fromRGBO(0, 0, 0, 1).withAlpha(20),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(18).w,
        ),
        child: Center(
          child: Text(
            area.name ?? '',
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: isSelected
                  ? TocModuleColors.darkBlue
                  : TocModuleColors.greys.withAlpha(153),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompetencyCards() {
    final themes = competencyAreas[selectedIndex].competencyTheme ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: themes.map((theme) {
          return CompetencyCard(
            backgroundColor: TocHelper.getCompetencyAreaColor(
              competencyAreas[selectedIndex].name ?? '',
            ),
            competencyTheme: theme,
          );
        }).toList(),
      ),
    );
  }
}
