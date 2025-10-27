import 'package:flutter/material.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class LearnTab {
  final String title;
  static String overview = 'Overview';
  static String discussion = 'Discussion';
  static String content = 'Content';
  static String session = 'Session';
  static String about = 'About';
  LearnTab({required this.title});

  static List<LearnTab> items({required BuildContext context}) => [
    LearnTab(title: TocLocalizations.of(context)!.mLearnTabOverview),
    LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
    LearnTab(title: TocLocalizations.of(context)!.mLearnCourseDiscussion),
  ];

  static List<LearnTab> majorItems({required BuildContext context}) => [
    LearnTab(title: TocLocalizations.of(context)!.mLearnTabOverview),
    LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
  ];
  static List<LearnTab> standaloneAssessmentItems({
    required BuildContext context,
  }) => [
    LearnTab(title: TocLocalizations.of(context)!.mLearnTabOverview),
    LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
    LearnTab(title: TocLocalizations.of(context)!.mLearnCourseDiscussion),
  ];
  static List<LearnTab> blendedProgramItems({required BuildContext context}) =>
      [
        LearnTab(title: TocLocalizations.of(context)!.mLearnTabOverview),
        LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
        LearnTab(title: TocLocalizations.of(context)!.mLearnCourseSessions),
        LearnTab(title: TocLocalizations.of(context)!.mLearnCourseDiscussion),
      ];
  static List<LearnTab> tocTabs(
    BuildContext context, {
    bool isFeatured = false,
  }) => isFeatured
      ? [
          LearnTab(title: TocLocalizations.of(context)!.mStaticAbout),
          LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
        ]
      : [
          LearnTab(title: TocLocalizations.of(context)!.mStaticAbout),
          LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
          LearnTab(title: TocLocalizations.of(context)!.mStaticComments),
        ];

  static List<LearnTab> tocPlayerTabs(
    BuildContext context, {
    bool isFeatured = false,
  }) => isFeatured
      ? [
          LearnTab(title: TocLocalizations.of(context)!.mTranscript),
          LearnTab(title: TocLocalizations.of(context)!.mStaticAbout),
          LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
        ]
      : [
          LearnTab(title: TocLocalizations.of(context)!.mTranscript),
          LearnTab(title: TocLocalizations.of(context)!.mStaticAbout),
          LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
          //LearnTab(title: TocLocalizations.of(context)!.migotAiTutor),
          LearnTab(title: TocLocalizations.of(context)!.mStaticComments),
        ];

  static List<LearnTab> preTocPlayerTabs(BuildContext context) => [
    LearnTab(title: TocLocalizations.of(context)!.mStaticAbout),
    LearnTab(title: TocLocalizations.of(context)!.mLearnCourseContent),
  ];

  static List<LearnTab> externalCourseTocTabs(BuildContext context) => [
    LearnTab(title: TocLocalizations.of(context)!.mStaticAbout),
    LearnTab(title: TocLocalizations.of(context)!.mStaticComments),
  ];
}
