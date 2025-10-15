import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:toc_module/toc/certificate/certificate_view/certificate_view.dart';

import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/pages/about_tab/claim_karmapoint.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/authors_curators.dart';

import 'package:toc_module/toc/pages/about_tab/widgets/competency_strip/competency_strip.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/expandable_text.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/message_card.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/overview_icons.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/provider.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/review_rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/sector.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/tags.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';

class AboutTab extends StatefulWidget {
  final Course courseRead;
  final Course? enrolledCourse;
  final CourseHierarchyModel courseHierarchy;
  final bool isBlendedProgram;
  final bool highlightRating;
  final bool showCertificate;
  final bool isFeaturedCourse;
  final Widget? aiTutorStrip;

  AboutTab(
      {Key? key,
      required this.courseRead,
      required this.isBlendedProgram,
      this.enrolledCourse,
      this.aiTutorStrip,
      required this.courseHierarchy,
      this.highlightRating = false,
      this.isFeaturedCourse = false,
      this.showCertificate = false})
      : super(key: key);

  final dataKey = new GlobalKey();
  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<bool> showKarmaPointClaimButton = ValueNotifier(false);
  ValueNotifier<bool> showKarmaPointCongratsMessageCard = ValueNotifier(true);
  late Future<String> cbpFuture;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.highlightRating) {
      Future.delayed(Duration.zero, () {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          Scrollable.ensureVisible(widget.dataKey.currentContext!,
              curve: Curves.easeInOutBack);
        });
      });
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.aiTutorStrip ?? SizedBox(),
          CertificateView(
            competencies: widget.courseRead.competencies,
            courseInfo: widget.enrolledCourse ?? widget.courseRead,
          ),
          // widget.isBlendedProgram
          //     ? Consumer<TocRepository>(
          //         builder: (context, tocServices, _) {
          //           return tocServices.batch != null
          //               ? Column(
          //                   children: [
          //                     BlendedProgramLocation(
          //                       selectedBatch: tocServices.batch!,
          //                     ),
          //                     BlendedProgramDetails(
          //                       batch: tocServices.batch!,
          //                     ),
          //                     Countdown(
          //                       batch: tocServices.batch!,
          //                     ),
          //                   ],
          //                 )
          //               : SizedBox();
          //         },
          //       )
          //     : SizedBox(),
          //  widget.isBlendedProgram ?  : SizedBox(),

          ValueListenableBuilder(
              valueListenable: showKarmaPointClaimButton,
              builder: (BuildContext context, bool value, Widget? child) {
                return value
                    ? TocClaimKarmaPoints(
                        courseId: widget.courseRead.id,
                        claimedKarmaPoint: (bool value) {
                          showKarmaPointCongratsMessageCard.value = true;
                          showKarmaPointClaimButton.value = false;
                        },
                      )
                    : Center();
              }),
          SizedBox(
            height: 10.w,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: TocOverviewIcons(
              courseHierarchy: widget.courseHierarchy,
              courseRead: widget.courseRead,
            ),
          ),

          widget.courseRead.description != null
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16)
                          .r,
                  child: ExpandableTextWidget(
                    title: TocLocalizations.of(context)!.mStaticSummary,
                    content: widget.courseRead.description!,
                    maxLength: 150,
                  ),
                )
              : SizedBox.shrink(),
          widget.courseRead.instructions != null
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16)
                          .r,
                  child: ExpandableTextWidget(
                    content: widget.courseRead.instructions!,
                    maxLength: 150,
                    title: TocLocalizations.of(context)!.mStaticDescription,
                    isHtml: true,
                  ),
                )
              : SizedBox.shrink(),
          widget.courseRead.competencies != null &&
                  widget.courseRead.competencies!.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 8, top: 8).r,
                  child: CompetencyStrip(
                    competencies: widget.courseRead.competencies ?? [],
                  ),
                )
              : SizedBox.shrink(),
          widget.courseHierarchy.keywords.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0).r,
                  child: TocTags(
                    keywords: widget.courseHierarchy.keywords,
                    title: TocLocalizations.of(context)!.mStaticTags,
                  ),
                )
              : SizedBox(),
          widget.courseRead.sectorDetails.isNotEmpty
              ? TocSectorSubsectorView(
                  sectorDetails: widget.courseRead.sectorDetails)
              : SizedBox(),
          ValueListenableBuilder(
              valueListenable: showKarmaPointCongratsMessageCard,
              builder: (BuildContext context, bool value, Widget? child) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 8, top: 8).r,
                  child: MessageCard(
                      course: widget.courseRead,
                      showCourseCongratsMessage:
                          showKarmaPointCongratsMessageCard.value,
                      showKarmaPointClaimButton: (bool value) {
                        showKarmaPointClaimButton.value = value;
                        showKarmaPointCongratsMessageCard.value = false;
                      },
                      isEnrolled: widget.enrolledCourse != null ? true : false),
                );
              }),
          Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: AuthorCreator(
              curators: widget.courseHierarchy.curators,
              authors: widget.courseHierarchy.authors,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 16,
          //     right: 8,
          //   ),
          //   child: Row(
          //     children: [
          //       Text(
          //         TocLocalizations.of(context)!.mTipsForLearners,
          //         style: GoogleFonts.montserrat(
          //             fontSize: 16.sp, fontWeight: FontWeight.w600),
          //       ),
          //       Spacer(),
          //       TextButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               FadeRoute(
          //                 page: ViewAllTips(
          //                   tips: TipsRepository.getTips(),
          //                 ),
          //               ),
          //             );
          //           },
          //           child: Row(
          //             children: [
          //               Text(
          //                 TocLocalizations.of(context)!.mCommonReadMore,
          //                 style: GoogleFonts.lato(
          //                     fontSize: 14.sp,
          //                     color: TocModuleColors.darkBlue,
          //                     fontWeight: FontWeight.w400),
          //               ),
          //               Icon(
          //                 Icons.chevron_right,
          //                 color: TocModuleColors.darkBlue,
          //                 size: 20,
          //               )
          //             ],
          //           ))
          //     ],
          //   ),
          // ),
          // TipsDisplayCard(
          //   tips: TipsRepository.getTips(),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: CourseProvider(
              courseRead: widget.courseRead,
            ),
          ),
          ReviewRating(
            courseRead: widget.courseRead,
          ),
          SizedBox(
            key: widget.dataKey,
            height: 280.w,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
