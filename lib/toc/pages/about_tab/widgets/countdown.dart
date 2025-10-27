import 'dart:async';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/batch_model.dart';

class Countdown extends StatefulWidget {
  final Batch batch;
  const Countdown({Key? key, required this.batch}) : super(key: key);

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Duration? _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    print(DateTime.parse(widget.batch.startDate).difference(DateTime.now()));
    super.initState();
    _remainingTime = DateTime.parse(
      widget.batch.startDate.replaceAll('Z', ''),
    ).difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = DateTime.parse(
          widget.batch.startDate.replaceAll('Z', ''),
        ).difference(DateTime.now());
        //  Provider.of<TocRepository>(context, listen: false)
        //     .getBatchStartTime()
        //     .difference(DateTime.now());
        if (_remainingTime!.inSeconds <= 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = _remainingTime!.inDays;
    int hours = _remainingTime!.inHours.remainder(24);
    int minutes = _remainingTime!.inMinutes.remainder(60);

    return _remainingTime!.inSeconds <= 0
        ? SizedBox(height: 37.w)
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  top: 28,
                  bottom: 20,
                ).r,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.w,
                        color: TocModuleColors.grey16,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16).r,
                        border: Border.all(color: TocModuleColors.grey16),
                      ),
                      child: Text(
                        TocLocalizations.of(
                          context,
                        )!.mHomeBlendedProgramBatchStart,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.w,
                        color: TocModuleColors.grey16,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCountdownPart(
                    days,
                    TocLocalizations.of(context)!.mStaticDays.toUpperCase(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16).r,
                    child: Text(":"),
                  ),
                  _buildCountdownPart(
                    hours,
                    TocLocalizations.of(context)!.mStaticHours.toUpperCase(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16).r,
                    child: Text(":"),
                  ),
                  _buildCountdownPart(
                    minutes,
                    TocLocalizations.of(context)!.mStaticMinutes.toUpperCase(),
                  ),
                ],
              ),
              SizedBox(height: 17.w),
            ],
          );
  }

  Widget _buildCountdownPart(int value, String unit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedFlipCounter(
          duration: Duration(milliseconds: 500),
          value: value,
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w300,
            fontSize: 36.sp,
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          unit,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
