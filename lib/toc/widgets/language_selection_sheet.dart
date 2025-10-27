import 'package:flutter/material.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/util/button_with_border.dart';
import '../model/language_map_model.dart';

class LanguageSelectionSheet extends StatefulWidget {
  final LanguageMapV1 languageList;
  final ValueChanged<String> changeSelectionCallback;

  const LanguageSelectionSheet({
    super.key,
    required this.languageList,
    required this.changeSelectionCallback,
  });
  @override
  State<LanguageSelectionSheet> createState() => LanguageSelectionSheetState();
}

class LanguageSelectionSheetState extends State<LanguageSelectionSheet> {
  String? selectedOption;
  @override
  void initState() {
    super.initState();
    getSelectedOption();
  }

  void getSelectedOption() {
    try {
      selectedOption = widget.languageList.languages.entries
          .firstWhere((item) => item.value.selectedLanguage)
          .key;
    } catch (e) {
      selectedOption = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 0.7.sh),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TocLocalizations.of(context)!.mTocSelectContentLanguage,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: TocModuleColors.deepBlue,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: TocModuleColors.greys60,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
              child: const Divider(height: 1, color: TocModuleColors.grey24),
            ),

            // Scrollable List
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8).r,
                itemCount: widget.languageList.languages.entries.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final entry = widget.languageList.languages.entries.elementAt(
                    index,
                  );
                  final String option = entry.key;
                  return RadioListTile<String>(
                    dense: true,
                    title: Text(
                      option,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TocModuleColors.deepBlue,
                      ),
                    ),
                    value: option,
                    groupValue: selectedOption,
                    activeColor: TocModuleColors.darkBlue,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  );
                },
              ),
            ),

            // Sticky Apply Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ).r,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: TocModuleColors.grey24)),
              ),
              child: ButtonWithBorder(
                onPressCallback: () {
                  if (selectedOption != null) {
                    widget.changeSelectionCallback(selectedOption!);
                  }
                },
                text: TocLocalizations.of(context)!.mStaticApply,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
