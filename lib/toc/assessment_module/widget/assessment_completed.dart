import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class AssessmentCompleted extends StatefulWidget {
  final String timeSpent;
  final Map apiResponse;
  final Function? parentAction;
  AssessmentCompleted(this.timeSpent, this.apiResponse, this.parentAction);
  @override
  _AssessmentCompletedState createState() => _AssessmentCompletedState();
}

class _AssessmentCompletedState extends State<AssessmentCompleted> {
  get boxDecoration => BoxDecoration(
    border: Border(
      top: BorderSide(color: TocModuleColors.grey04),
      bottom: BorderSide(color: TocModuleColors.grey04),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildLayout()),
      bottomSheet: _actionButton(),
    );
  }

  Widget _buildLayout() {
    return Container(
      color: TocModuleColors.primaryBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getAppbar(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32).r,
            child: Text(
              TocLocalizations.of(context)!.mAssessmentAssessmentResults,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
          _containerBody(),
        ],
      ),
    );
  }

  Widget _getAppbar() {
    return AppBar(
      backgroundColor: TocModuleColors.primaryBlue,
      titleSpacing: 0,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          size: 20.sp,
          color: TocModuleColors.appBarBackground,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _containerBody() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ).r,
        child: Container(
          padding: EdgeInsets.only(top: 8).r,
          color: TocModuleColors.appBarBackground,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 4).r,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 92.w,
                        width: 92.w,
                        child: CircularProgressIndicator.adaptive(
                          value: (widget.apiResponse['result'] != null)
                              ? (widget.apiResponse['result']) / 100
                              : 0,
                          backgroundColor: TocModuleColors.grey08,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            widget.apiResponse['result'] >=
                                    widget.apiResponse['passPercent']
                                ? TocModuleColors.positiveLight
                                : TocModuleColors.negativeLight,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              widget.apiResponse['result'] >=
                                      widget.apiResponse['passPercent']
                                  ? widget.apiResponse['result']
                                            .toStringAsFixed(0)
                                            .toString() +
                                        ' %'
                                  : widget.apiResponse['result']
                                            .toStringAsFixed(0)
                                            .toString() +
                                        ' %',
                              style: GoogleFonts.lato(
                                color:
                                    (widget.apiResponse['result'] >=
                                        widget.apiResponse['passPercent'])
                                    ? TocModuleColors.positiveLight
                                    : TocModuleColors.negativeLight,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0.sp,
                                letterSpacing: 0.25.r,
                              ),
                            ),
                            SizedBox(height: 4.w),
                            Text(
                              widget.apiResponse['result'] >=
                                      widget.apiResponse['passPercent']
                                  ? TocLocalizations.of(
                                      context,
                                    )!.mPass.toUpperCase()
                                  : TocLocalizations.of(
                                      context,
                                    )!.mFail.toUpperCase(),
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.25.r,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(86, 4, 86, 16).r,
                  child: Text(
                    widget.apiResponse['result'] >=
                            widget.apiResponse['passPercent']
                        ? widget.apiResponse['result'] == 100
                              ? TocLocalizations.of(
                                  context,
                                )!.mStaticAcedAssessment
                              : TocLocalizations.of(
                                  context,
                                )!.mStaticPassedSuccessfully
                        : TocLocalizations.of(context)!.mStaticTryAgainMsg,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0.sp,
                      letterSpacing: 0.25.r,
                    ),
                  ),
                ),
                _overallSummary(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _overallSummary() {
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8.0, bottom: 8).r,
              padding: EdgeInsets.only(bottom: 16).r,
              decoration: BoxDecoration(
                color: TocModuleColors.appBarBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16).r,
                    padding: EdgeInsets.all(16.0).r,
                    decoration: boxDecoration,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/assessment_icon.svg',
                              colorFilter: ColorFilter.mode(
                                TocModuleColors.primaryBlue,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 8.0.w),
                            Text(
                              TocLocalizations.of(context)!.mTotalQuestion,
                              style: Theme.of(context).textTheme.displayLarge!
                                  .copyWith(
                                    letterSpacing: 0.25.r,
                                    decoration: TextDecoration.none,
                                  ),
                            ),
                          ],
                        ),
                        Spacer(), // Add space between text and icon
                        Text(
                          widget.apiResponse['total'] == 1
                              ? '${widget.apiResponse['total']} ${TocLocalizations.of(context)!.mCommonQuestion}'
                              : '${widget.apiResponse['total']} ${TocLocalizations.of(context)!.mCommonQuestions}',
                          style: Theme.of(context).textTheme.displayLarge!
                              .copyWith(
                                letterSpacing: 0.25.r,
                                decoration: TextDecoration.none,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 16, bottom: 16).r,
                    child: Text(
                      TocLocalizations.of(context)!.mYourPerformanceSummary,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        letterSpacing: 0.25.r,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  _summaryItems(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 100.w),
      ],
    );
  }

  Widget _summaryItems() {
    return Column(
      children: [
        widget.apiResponse['correct'] > 0
            ? _summaryItem(
                'correct',
                widget.apiResponse['correct'] == 1
                    ? widget.apiResponse['correct'].toString() +
                          '  ' +
                          TocLocalizations.of(context)!.mStaticOneCorrect
                    : widget.apiResponse['correct'].toString() +
                          '  ' +
                          TocLocalizations.of(context)!.mStaticCorrect,
              )
            : Center(),
        widget.apiResponse['inCorrect'] > 0
            ? _summaryItem(
                'inCorrect',
                widget.apiResponse['inCorrect'] == 1
                    ? widget.apiResponse['inCorrect'].toString() +
                          '  ' +
                          TocLocalizations.of(context)!.mStaticOneIncorrect
                    : widget.apiResponse['inCorrect'].toString() +
                          '  ' +
                          TocLocalizations.of(context)!.mStaticIncorrect,
              )
            : Center(),
        widget.apiResponse['blank'] > 0
            ? _summaryItem(
                'blank',
                widget.apiResponse['blank'].toString() +
                    '  ' +
                    TocLocalizations.of(context)!.mStaticNotAttempted,
              )
            : Center(),
      ],
    );
  }

  Widget _summaryItem(String type, String title) {
    return Container(
      padding: EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: TocModuleColors.appBarBackground,
        border: Border(
          top: BorderSide(color: TocModuleColors.grey04),
          bottom: BorderSide(color: TocModuleColors.grey04),
          left: BorderSide(color: TocModuleColors.appBarBackground, width: 0),
        ),
      ),
      child: Row(
        children: [
          if (type.toString() == 'correct')
            Icon(Icons.done, size: 24.sp, color: TocModuleColors.primaryBlue),
          if (type.toString() == 'inCorrect')
            SvgPicture.asset(
              'assets/img/close_black.svg',
              colorFilter: ColorFilter.mode(
                TocModuleColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
          if (type.toString() == 'blank')
            SvgPicture.asset(
              'assets/img/unanswered.svg',
              colorFilter: ColorFilter.mode(
                TocModuleColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 8).r,
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _actionButton() {
    return Container(
      height: 90.w,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 32).r,
      decoration: BoxDecoration(color: TocModuleColors.appBarBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 58.w,
            width: 1.sw - 32.w,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.parentAction != null) {
                  widget.parentAction!();
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: TocModuleColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50).r,
                  side: BorderSide(color: TocModuleColors.primaryBlue),
                ),
              ),
              child: Text(
                TocLocalizations.of(context)!.mFinish,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
