import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/services/toc_module_service.dart';

class RelevanceChoiceButtons extends StatelessWidget {
  final VoidCallback onReleventBtnPressed;
  final VoidCallback onNonReleventBtnPressed;

  const RelevanceChoiceButtons(
      {super.key,
      required this.onReleventBtnPressed,
      required this.onNonReleventBtnPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: InkWell(
            onTap: () => onReleventBtnPressed(),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: SvgPicture.network(
                  TocModuleService.config.baseUrl +
                      '/assets/images/sakshamAI/ai-icon.svg',
                  placeholderBuilder: (context) => Container(),
                  height: 20.sp,
                  width: 20.sp,
                ),
              ),
              Flexible(
                child: Text(
                  TocLocalizations.of(context)!.mCommonRelevant,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )
            ]),
          ),
        ),
        InkWell(
          onTap: () => onNonReleventBtnPressed(),
          child: Row(children: [
            Icon(
              Icons.thumb_down,
              color: ModuleColors.primaryBlue,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              TocLocalizations.of(context)!.mStaticNo,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ]),
        )
      ],
    );
  }
}
