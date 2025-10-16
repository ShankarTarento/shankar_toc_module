import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/date_time_helper.dart';
import 'package:toc_module/toc/model/batch_model.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';

class SelectBatchBottomSheet extends StatefulWidget {
  final List<Batch> batches;
  final Batch? batch;
  const SelectBatchBottomSheet({Key? key, required this.batches, this.batch})
      : super(key: key);

  @override
  State<SelectBatchBottomSheet> createState() => _SelectBatchBottomSheetState();
}

class _SelectBatchBottomSheetState extends State<SelectBatchBottomSheet> {
  @override
  void initState() {
    if (widget.batch != null) selectedBatch = widget.batch;
    super.initState();
  }

  Batch? selectedBatch;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 24, bottom: 24).r,
            width: 80.w,
            height: 8.w,
            decoration: BoxDecoration(
                color: TocModuleColors.grey40,
                borderRadius: BorderRadius.circular(16).r),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0).r,
          child: Text(
            TocLocalizations.of(context)!.mStaticAvailableBatch,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
        Divider(
          color: TocModuleColors.darkGrey,
          thickness: 1.w,
        ),
        widget.batches.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      widget.batches.length,
                      (index) {
                        DateTime nowWithoutTime = DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day);
                        bool isValidEnrollmentEndDate = DateTime.parse(
                                    widget.batches[index].enrollmentEndDate)
                                .isAfter(nowWithoutTime) ||
                            DateTime.parse(
                                    widget.batches[index].enrollmentEndDate)
                                .isAtSameMomentAs(nowWithoutTime);
                        return isValidEnrollmentEndDate
                            ? GestureDetector(
                                onTap: () {
                                  selectedBatch = widget.batches[index];
                                  setState(() {});
                                  Provider.of<TocRepository>(context,
                                          listen: false)
                                      .setBatchDetails(
                                          selectedBatch: selectedBatch!);
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                          top: 12.0,
                                          bottom: 12,
                                          left: 16,
                                          right: 16)
                                      .r,
                                  child: Text(
                                      "${widget.batches[index].name} - ${DateTimeHelper.getDateTimeInFormat(widget.batches[index].startDate, desiredDateFormat: IntentType.dateFormat2)} to  ${DateTimeHelper.getDateTimeInFormat(widget.batches[index].endDate, desiredDateFormat: IntentType.dateFormat2)}",
                                      style: selectedBatch ==
                                              widget.batches[index]
                                          ? GoogleFonts.lato(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: TocModuleColors.darkBlue,
                                              height: 1.5.w)
                                          : GoogleFonts.lato(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: TocModuleColors.greys,
                                              height: 1.5.w,
                                            )),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                        top: 12.0,
                                        bottom: 12,
                                        left: 16,
                                        right: 16)
                                    .r,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "${widget.batches[index].name} - ${DateTimeHelper.getDateTimeInFormat(widget.batches[index].startDate, desiredDateFormat: IntentType.dateFormat2)} to  ${DateTimeHelper.getDateTimeInFormat(widget.batches[index].endDate, desiredDateFormat: IntentType.dateFormat2)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5.w,
                                            ),
                                      ),
                                      TextSpan(
                                        text: TocLocalizations.of(context)!
                                            .mBlendedProgramExpired,
                                        style: TextStyle(
                                          color: TocModuleColors.mandatoryRed,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              )
            : Text("No batches found")
      ],
    );
  }
}
