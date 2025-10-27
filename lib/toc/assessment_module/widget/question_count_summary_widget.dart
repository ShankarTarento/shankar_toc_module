import 'package:flutter/material.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/assessment_module/widget/assessment_v2_answered_widget.dart';
import 'package:toc_module/toc/assessment_module/widget/assessment_v2_info_tooltip.dart';
import 'package:toc_module/toc/assessment_module/widget/assessment_v2_question_summary.dart';
import 'package:toc_module/toc/assessment_module/widget/assessment_v2_section_selection_widget.dart';
import 'package:toc_module/toc/assessment_module/widget/assessment_v2_timer_widget.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class QuestionCountSummaryWidget extends StatelessWidget {
  final List microSurvey;
  final int? start;
  final int assessmentSectionLength;
  final int? selectedSection;
  final int answeredQuestions;
  final String primaryCategory;
  final int questionIndex;
  final List flaggedQuestions;
  final List savedQuestions;
  final List notAnsweredQuestions;
  final submitSurvey;
  final generateInteractTelemetryData;
  final String? sectionInstruction;
  final IntCallback changeQuestion;
  final sectionalDuration;

  QuestionCountSummaryWidget({
    required this.microSurvey,
    this.start,
    required this.assessmentSectionLength,
    this.selectedSection,
    this.answeredQuestions = 0,
    required this.primaryCategory,
    required this.questionIndex,
    required this.flaggedQuestions,
    required this.savedQuestions,
    required this.notAnsweredQuestions,
    this.submitSurvey,
    this.generateInteractTelemetryData,
    this.sectionInstruction,
    required this.changeQuestion,
    this.sectionalDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Container(
            color: TocModuleColors.whiteGradientOne,
            padding: EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AssessmentV2InfoToolTip(
                        sectionInstruction: sectionInstruction,
                      ),
                      start != null
                          ? AssessmentV2TimerWidget(
                              microSurvey: microSurvey,
                              start: start!,
                              assessmentSectionLength: assessmentSectionLength,
                              selectedSection: selectedSection ?? 0,
                              submitSurvey: submitSurvey,
                              sectionalDuration: sectionalDuration,
                            )
                          : Center(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AssessmentV2AnsweredStatusWidget(
                        value:
                            '${microSurvey.length - (flaggedQuestions.length + savedQuestions.length)}',
                        label: TocLocalizations.of(context)!.mStaticNotAnswered,
                      ),
                      SizedBox(width: 32.0),
                      AssessmentV2AnsweredStatusWidget(
                        value:
                            '${flaggedQuestions.length + savedQuestions.length}',
                        label: TocLocalizations.of(context)!.mStaticAnswered,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: TocModuleColors.grey16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          TocLocalizations.of(context)!.mStaticQuestions,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: TocModuleColors.grey16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AssessmentV2QuestionSummary(
            questionIndex: questionIndex,
            microSurvey: microSurvey,
            generateInteractTelemetryData: generateInteractTelemetryData,
            flaggedQuestions: flaggedQuestions,
            savedQuestions: savedQuestions,
            notAnsweredQuestions: notAnsweredQuestions,
            changeQuestion: changeQuestion,
          ),
        ],
      ),
    );
  }
}
