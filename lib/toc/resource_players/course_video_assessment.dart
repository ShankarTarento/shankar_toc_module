import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:toc_module/toc/assessment_module/widget/homepage_assessment_completed.dart';
import 'package:toc_module/toc/assessment_module/widget/single_answer_question.dart';
import 'package:toc_module/toc/constants/assessment_questions.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';

class CourseVideoAssessment extends StatefulWidget {
  @override
  _CourseVideoAssessmentState createState() {
    return _CourseVideoAssessmentState();
  }
}

class _CourseVideoAssessmentState extends State<CourseVideoAssessment> {
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(Icons.clear, color: ModuleColors.greys60),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Agile methodology',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  )),
        ),
        body: questionIndex > 2
            ? HomepageAssessmentCompleted()
            : ASSESSMENT_QUESTIONS[questionIndex].questionType ==
                    QuestionTypes.singleAnswer
                ? SingleAnswerQuestion(ASSESSMENT_QUESTIONS[questionIndex])
                : Center(),
        bottomSheet: Container(
          height: questionIndex > 2 ? 0.w : 58.w,
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5).r,
          decoration:
              BoxDecoration(color: ModuleColors.appBarBackground, boxShadow: [
            BoxShadow(
              color: ModuleColors.grey08,
              blurRadius: 6.0.r,
              spreadRadius: 0.r,
              offset: Offset(
                0,
                -3,
              ),
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 1.sw / 2 - 20.w,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      questionIndex++;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ModuleColors.customBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4).r,
                        side: BorderSide(color: ModuleColors.grey16)),
                  ),
                  child: Text(
                    questionIndex < 2 ? 'Next' : 'Finish',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
