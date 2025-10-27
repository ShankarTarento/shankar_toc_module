import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/constants/color_constants.dart';

class ReplayWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const ReplayWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ReplayWidget> createState() => _ReplayWidgetState();
}

class _ReplayWidgetState extends State<ReplayWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6).r,
            child: Text(
              TocLocalizations.of(context) != null
                  ? TocLocalizations.of(context)!.mReplay
                  : '',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 16.sp,
                letterSpacing: 0.12,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
          Container(
            height: 50.w,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(63).r,
              color: TocModuleColors.greys87,
            ),
            child: Center(
              child: Icon(
                Icons.replay,
                size: 24.sp,
                color: TocModuleColors.appBarBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
