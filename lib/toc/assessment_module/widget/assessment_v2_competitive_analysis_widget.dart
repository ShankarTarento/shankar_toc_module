import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class CompetitiveV2Analysis extends StatefulWidget {
  const CompetitiveV2Analysis({Key? key, required this.competitiveAnalysisData})
      : super(key: key);

  final List<Map<String, String>> competitiveAnalysisData;

  @override
  State<CompetitiveV2Analysis> createState() => _CompetitiveV2AnalysisState();
}

class _CompetitiveV2AnalysisState extends State<CompetitiveV2Analysis> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          TocLocalizations.of(context)!.mAssessmentCompetitiveAnalysis,
          style: GoogleFonts.inter(
            color:
                isExpanded ? TocModuleColors.darkBlue : TocModuleColors.greys,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          isExpanded
              ? Icons.keyboard_arrow_up_rounded
              : Icons.keyboard_arrow_down_rounded,
          color: isExpanded ? TocModuleColors.darkBlue : TocModuleColors.greys,
          size: 35.sp,
        ),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        children: [
          Column(
            children: [
              Table(
                columnWidths: {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          color: TocModuleColors.grey04,
                          child: Text(
                            TocLocalizations.of(context)!.mStaticSubject,
                            style: GoogleFonts.lato(
                                color: TocModuleColors.greys60,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: TocModuleColors.grey04,
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            TocLocalizations.of(context)!.mStaticYourScore,
                            style: GoogleFonts.lato(
                                color: TocModuleColors.greys60,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: TocModuleColors.grey04,
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            TocLocalizations.of(context)!
                                .mAssessmentTopperScore,
                            style: GoogleFonts.lato(
                                color: TocModuleColors.greys60,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var row in widget.competitiveAnalysisData)
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: TocModuleColors.grey16),
                        ),
                      ),
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              row['Column 1'] ?? '',
                              style: GoogleFonts.lato(
                                  color: TocModuleColors.blackLegend,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(row['Column 2'] ?? '',
                                style: GoogleFonts.lato(
                                    color: TocModuleColors.blackLegend,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(row['Column 3'] ?? '',
                                style: GoogleFonts.lato(
                                    color: TocModuleColors.blackLegend,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          )
        ]);
  }
}
