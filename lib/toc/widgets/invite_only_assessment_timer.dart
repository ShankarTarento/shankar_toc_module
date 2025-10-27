import 'dart:async';
import 'package:flutter/material.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/helper/toc_helper.dart';

class InviteOnlyAssessmentTimer extends StatefulWidget {
  final String startdate;
  const InviteOnlyAssessmentTimer({Key? key, required this.startdate})
    : super(key: key);

  @override
  State<InviteOnlyAssessmentTimer> createState() =>
      _InviteOnlyAssessmentTimerState();
}

class _InviteOnlyAssessmentTimerState extends State<InviteOnlyAssessmentTimer> {
  Duration? _remainingTime;
  Timer? _timer;
  @override
  void initState() {
    debugPrint(widget.startdate);
    super.initState();
    _remainingTime = DateTime.parse(
      widget.startdate.replaceAll('Z', ''),
    ).difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = DateTime.parse(
          widget.startdate.replaceAll('Z', ''),
        ).difference(DateTime.now());

        if (_remainingTime!.inSeconds <= 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = _remainingTime!.inDays;
    int hours = _remainingTime!.inHours.remainder(24);
    int minutes = _remainingTime!.inMinutes.remainder(60);
    return Text(
      "${TocLocalizations.of(context)!.mHomeBlendedProgramBatchStart} $days ${TocHelper.capitalizeFirstLetter(TocLocalizations.of(context)!.mStaticDays)}:$hours ${TocHelper.capitalizeFirstLetter(TocLocalizations.of(context)!.mStaticHours)}:$minutes ${TocHelper.capitalizeFirstLetter(TocLocalizations.of(context)!.mStaticMins)}",
    );
  }
}
