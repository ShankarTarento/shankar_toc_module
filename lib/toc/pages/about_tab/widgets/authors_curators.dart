import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/creator_model.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class AuthorCreator extends StatelessWidget {
  final List<CreatorModel> curators;
  final List<CreatorModel> authors;
  const AuthorCreator({Key? key, required this.curators, required this.authors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authors.isEmpty && curators.isEmpty
        ? SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TocLocalizations.of(context)!.mStaticAuthorsAndCurators,
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              if (authors.isNotEmpty)
                ...List.generate(authors.length, (index) {
                  return displayCard(
                    initial: TocHelper.getInitials(authors[index].name!),
                    title: authors[index].name!,
                    subtitle: TocLocalizations.of(context)!.mLearnCourseAuthor,
                    context: context,
                  );
                }),
              if (curators.isNotEmpty)
                ...List.generate(curators.length, (index) {
                  return displayCard(
                    initial: TocHelper.getInitials(curators[index].name!),
                    title: curators[index].name!,
                    subtitle: TocLocalizations.of(context)!.mLearnCourseCurator,
                    context: context,
                  );
                })
            ],
          );
  }

  Widget displayCard(
      {required String initial,
      required String title,
      required String subtitle,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16).r,
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: TocModuleColors.greys,
            child: Text(
              initial,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 16.sp,
                    color: TocModuleColors.appBarBackground,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.75.sw,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: TocModuleColors.greys,
                  ),
                ),
              ),
              Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
