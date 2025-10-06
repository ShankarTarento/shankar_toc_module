import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/transcription_response.dart';

class TranscriptDropdown extends StatefulWidget {
  final List<SubtitleUrl> subtitleUrls;
  final void Function(SubtitleUrl selected)? onSelected;
  final SubtitleUrl initialSubtitle;

  const TranscriptDropdown({
    super.key,
    required this.subtitleUrls,
    this.onSelected,
    required this.initialSubtitle,
  });

  @override
  State<TranscriptDropdown> createState() => _TranscriptDropdownState();
}

class _TranscriptDropdownState extends State<TranscriptDropdown> {
  SubtitleUrl? _selectedSubtitle;

  @override
  void initState() {
    super.initState();

    _selectedSubtitle = widget.initialSubtitle;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.subtitleUrls.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        Text(
          "Transcipt Language: ",
          style: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: TocModuleColors.darkBlue),
        ),
        DropdownButtonHideUnderline(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: TocModuleColors.grey40,
                  width: 1,
                ),
              ),
            ),
            child: DropdownButton2<SubtitleUrl>(
              value: _selectedSubtitle,
              hint: const Text("Select Transcript"),
              selectedItemBuilder: (context) => widget.subtitleUrls
                  .map((subtitle) => DropdownMenuItem<SubtitleUrl>(
                        value: subtitle,
                        child: Text(
                          TocHelper.capitalize(subtitle.language),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              items: widget.subtitleUrls.map((SubtitleUrl subtitle) {
                final isSelected = subtitle == _selectedSubtitle;

                return DropdownMenuItem<SubtitleUrl>(
                  value: subtitle,
                  child: Text(
                    subtitle.language,
                    style: GoogleFonts.lato(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? TocModuleColors.darkBlue
                          : Colors.black87,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (SubtitleUrl? newValue) {
                if (newValue == null) return;
                setState(() {
                  _selectedSubtitle = newValue;
                });
                if (widget.onSelected != null) {
                  widget.onSelected!(newValue);
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
