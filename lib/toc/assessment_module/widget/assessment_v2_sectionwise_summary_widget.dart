import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/constants/color_constants.dart';

class SectionWiseSummaryV2 extends StatefulWidget {
  const SectionWiseSummaryV2({Key? key, required this.sectionSummary})
    : super(key: key);

  final List<Map<String, String>> sectionSummary;

  @override
  State<SectionWiseSummaryV2> createState() => _SectionWiseSummaryV2State();
}

class _SectionWiseSummaryV2State extends State<SectionWiseSummaryV2> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        TocLocalizations.of(context)!.mAssessmentMySectionWiseSummary,
        style: GoogleFonts.inter(
          color: isExpanded ? TocModuleColors.darkBlue : TocModuleColors.greys,
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
              columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
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
                            fontWeight: FontWeight.w400,
                          ),
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (var row in widget.sectionSummary)
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
                            row['sectionName'] ?? '',
                            style: GoogleFonts.lato(
                              color: TocModuleColors.blackLegend,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            row['score'] ?? '',
                            style: GoogleFonts.lato(
                              color: TocModuleColors.blackLegend,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
