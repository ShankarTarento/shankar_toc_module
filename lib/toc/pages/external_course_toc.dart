import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/date_time_helper.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/competency_passbook.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/course_status_moedl.dart';
import 'package:toc_module/toc/model/learn_tab_model.dart';
import 'package:toc_module/toc/model/user_action_model.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/tags.dart';
import 'package:toc_module/toc/pages/player/external_course_player.dart';
import 'package:toc_module/toc/pages/toc_skeleton/external_course_toc_skeleton.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';
import 'package:toc_module/toc/util/button_widget_v2.dart';
import 'package:toc_module/toc/view_model/course_toc_view_model.dart';
import 'about_tab/widgets/competency_strip/competency_strip.dart';
import 'course_comments.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class ExternalCourseTOC extends StatefulWidget {
  final String contentId;
  final String? externalId;
  final String? contentType;
  const ExternalCourseTOC({
    Key? key,
    required this.contentId,
    this.externalId = '',
    this.contentType,
  }) : super(key: key);

  @override
  State<ExternalCourseTOC> createState() => _ExternalCourseTOCState();
}

class _ExternalCourseTOCState extends State<ExternalCourseTOC>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  Future<Course>? _tocDataFuture;
  ValueNotifier<bool?> _isEnrolled = ValueNotifier(null);
  Future<void>? _enrollCourseFuture;
  // CourseStatus
  CourseStatus? _courseStatus;
  TabController? learnTabController;
  bool isViewed = false;
  bool isLearningPathContent = false;
  List<dynamic> _filteredTags = [];

  @override
  void initState() {
    super.initState();
    _tocDataFuture = TocRepository().getExternalCourseContents(
      extId: widget.contentId,
    );
    _enrollCourseFuture = _checkEnrolled();
    _generateTelemetryData();
    setIsLearningPathContent();
  }

  List<CompetencyPassbook> getCompetencies(List competenciesData) {
    List<CompetencyPassbook> competencies = [];

    for (var data in competenciesData) {
      competencies.add(
        CompetencyPassbook(
          courseId: "courseId",
          competencyArea: data['competencyAreaName'] ?? data['competencyArea'],
          competencyAreaId:
              data['competencyAreaIdentifier'] ?? data['competencyAreaId'],
          competencyAreaDescription: data['competencyAreaDescription'],
          competencyTheme:
              data['competencyThemeName'] ?? data['competencyTheme'],
          competencyThemeId:
              data['competencyThemeIdentifier'] ?? data['competencyThemeId'],
          competencyThemeDescription: data['competencyThemeDescription'],
          competencyThemeType: data['competencyThemeType'],
          competencySubTheme:
              data['competencySubThemeName'] ?? data['competencySubTheme'],
          competencySubThemeId:
              data['competencySubThemeIdentifier'] ??
              data['competencySubThemeId'],
          competencySubThemeDescription: data['competencySubThemeDescription'],
        ),
      );
    }
    return competencies;
  }

  setIsLearningPathContent() async {
    isLearningPathContent = await CourseTocViewModel()
        .isLearningPathContentHelper(widget.contentId);
  }

  @override
  void didChangeDependencies() {
    learnTabController = TabController(
      length: LearnTab.externalCourseTocTabs(context).length,
      vsync: this,
      initialIndex: 0,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _tocDataFuture,
      builder: (BuildContext context, AsyncSnapshot<Course> tocData) {
        /** SMT track course view **/
        if ((tocData.connectionState == ConnectionState.done &&
                tocData.hasData) &&
            !isViewed) {
          isViewed = true;
          trackCourseView(tocData.data);
        }
        if (tocData.hasData) {
          if (tocData.data?.raw["searchTags"] is List) {
            _filteredTags = (tocData.data!.raw["searchTags"] as List).where((
              tag,
            ) {
              final tagStr = tag.toString().trim().toLowerCase();
              return tagStr.isNotEmpty &&
                  tagStr != (tocData.data!.name).toLowerCase();
            }).toList();
          }
        }
        return tocData.connectionState == ConnectionState.done &&
                tocData.hasData
            ? Scaffold(
                backgroundColor: TocModuleColors.darkBlue,
                body: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: TocModuleColors.darkBlue,
                        automaticallyImplyLeading: false,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 24.sp,
                            color: TocModuleColors.appBarBackground,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          color: TocModuleColors.darkBlue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ).w,
                            child: _getTOCHeaderWidget(
                              courseData: tocData.data!,
                            ),
                          ),
                        ),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: true,
                        toolbarHeight: 28.w,
                        backgroundColor: TocModuleColors.lightBackground,
                        flexibleSpace: Container(
                          color: TocModuleColors.darkBlue,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0).r,
                              topRight: Radius.circular(16.0).r,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(top: 4).r,
                              color: TocModuleColors.appBarBackground,
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                indicator: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: TocModuleColors.darkBlue,
                                      width: 2.0.w,
                                    ),
                                  ),
                                ),
                                indicatorColor:
                                    TocModuleColors.appBarBackground,
                                labelPadding: EdgeInsets.only(top: 0.0).r,
                                unselectedLabelColor: TocModuleColors.greys60,
                                labelColor: TocModuleColors.darkBlue,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                unselectedLabelStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                onTap: (value) {
                                  // _generateInteractTelemetryData(
                                  //     clickId: learnTabController!.index ==
                                  //             0
                                  //         ? TelemetryIdentifier.aboutTab
                                  //         : TelemetryIdentifier.contentTab);
                                },
                                tabs: [
                                  for (var tabItem
                                      in LearnTab.externalCourseTocTabs(
                                        context,
                                      ))
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ).r,
                                      child: Tab(
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0).r,
                                          child: Text(
                                            tabItem.title,
                                            style: GoogleFonts.lato(
                                              color: TocModuleColors.greys87,
                                              fontSize: 14.0.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                                controller: learnTabController,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Container(
                    color: TocModuleColors.lightBackground,
                    child: TabBarView(
                      controller: learnTabController,
                      children: [
                        _aboutTab(tocData),
                        ValueListenableBuilder<bool?>(
                          valueListenable: _isEnrolled,
                          builder:
                              (
                                BuildContext context,
                                bool? isEnrolled,
                                Widget? child,
                              ) {
                                return CourseComments(
                                  courseId: widget.contentId,
                                  isEnrolled: isEnrolled ?? false,
                                );
                              },
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0).w,
                    child: FutureBuilder(
                      future: _enrollCourseFuture,
                      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                        return ValueListenableBuilder<bool?>(
                          valueListenable: _isEnrolled,
                          builder:
                              (
                                BuildContext context,
                                bool? isEnrolled,
                                Widget? child,
                              ) {
                                return IntrinsicHeight(
                                  child: ButtonWidgetV2(
                                    isLoading:
                                        snapshot.connectionState !=
                                        ConnectionState.done,
                                    onTap: isEnrolled != null
                                        ? () async {
                                            if (isEnrolled) {
                                              _navigateToExtCoursePlayer(
                                                redirectUrl:
                                                    tocData.data!.redirectUrl!,
                                              );
                                              // await _generateInteractTelemetryData(
                                              //     clickId:
                                              //         TelemetryIdentifier
                                              //             .redirect);
                                            } else {
                                              await _enroll(
                                                partnerId:
                                                    tocData
                                                        .data
                                                        ?.contentPartner
                                                        ?.id ??
                                                    '',
                                                redirectUrl:
                                                    tocData.data!.redirectUrl!,
                                                course: tocData.data,
                                              );
                                              // await _generateInteractTelemetryData(
                                              //     clickId:
                                              //         TelemetryIdentifier
                                              //             .enroll);
                                            }
                                          }
                                        : null,
                                    text: isEnrolled != null && isEnrolled
                                        ? TocLocalizations.of(
                                            context,
                                          )!.mLearnRedirect
                                        : TocLocalizations.of(context)!.mEnroll,
                                    bgColor: isEnrolled != null
                                        ? TocModuleColors.darkBlue
                                        : TocModuleColors.grey16,
                                    textColor: TocModuleColors.appBarBackground,
                                    icon: isEnrolled != null && isEnrolled
                                        ? Icons.open_in_new
                                        : null,
                                  ),
                                );
                              },
                        );
                      },
                    ),
                  ),
                ),
              )
            : ExternalCourseTocSkeleton(showCourseShareOption: false);
      },
    );
  }

  Widget _getTOCHeaderWidget({required Course courseData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          courseData.name,
          style: GoogleFonts.montserrat(
            color: TocModuleColors.appBarBackground,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.12.sp,
          ),
          softWrap: true,
        ),
        SizedBox(height: 8.w),
        Text(
          (courseData.contentPartner?.contentPartnerName != '')
              ? '${TocLocalizations.of(context)!.mCommonBy.toLowerCase()} ${courseData.contentPartner?.contentPartnerName}'
              : '',
          style: GoogleFonts.lato(
            color: TocModuleColors.white70,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 1.429.w,
            letterSpacing: 0.25.sp,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.w),
        courseData.lastUpdatedOn != null
            ? Text(
                '(${TocLocalizations.of(context)!.mCourseLastUpdatedOn} ${DateTimeHelper.getDateTimeInFormat(courseData.lastUpdatedOn!, desiredDateFormat: IntentType.MMMddyyyy)})',
                style: GoogleFonts.lato(
                  color: TocModuleColors.white70,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.333.w,
                  letterSpacing: 0.25.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : Center(),
        SizedBox(height: 32.w),
      ],
    );
  }

  Future<void> _checkEnrolled() async {
    Response res = await learnService.getUserDataOnExtCourse(
      courseId: widget.contentId,
    );
    if (res.statusCode == 200) {
      var result = jsonDecode(res.body)['result'];
      if (result != null && result['enrolled_date'] != null) {
        _courseStatus = CourseStatus.fromJson(result);
        _isEnrolled.value = true;
      } else {
        _isEnrolled.value = false;
      }
    } else {
      TocHelper.showSnackBarMessage(
        textColor: Colors.white,
        context: context,
        text: TocLocalizations.of(context)!.mStaticSomethingWrongTryLater,
        bgColor: TocModuleColors.negativeLight,
      );
    }
    setState(() {});
  }

  Future<void> _enroll({
    required String partnerId,
    required String redirectUrl,
    Course? course,
  }) async {
    UserActionModel? response = await learnService.enrollExtCourse(
      courseId: widget.contentId,
      partnerId: partnerId,
    );
    if (response != null &&
        (response.responseCode?.toString().toLowerCase() == 'ok')) {
      _isEnrolled.value = true;
      trackCourseEnrolled(course);
      _showSnackBar(
        context,
        TocLocalizations.of(context)!.mStaticEnrolledSuccessMessage,
        TocModuleColors.positiveLight,
      );
      Future.delayed(
        Duration(seconds: 1),
        () => _navigateToExtCoursePlayer(redirectUrl: redirectUrl),
      );
    } else {
      _isEnrolled.value = false;
      _showSnackBar(
        context,
        TocLocalizations.of(context)!.mStaticErrorMessage,
        TocModuleColors.negativeLight,
      );
    }
  }

  void trackCourseEnrolled(Course? course) async {
    // try {
    //   bool _isContentEnrolmentEnabled =
    //       await Provider.of<TocRepository>(context, listen: false)
    //           .isSmartechEventEnabled(
    //               eventName: SMTTrackEvents.contentEnrolment);
    //   if (_isContentEnrolmentEnabled) {
    //     SmartechService.trackCourseEnrolled(
    //       courseCategory: course?.courseCategory ?? '',
    //       courseName: course?.name ?? '',
    //       image: course?.appIcon ?? '',
    //       contentUrl: "${TocConfigModel.baseUrl}/app/toc/ext/${course?.id ?? ''}",
    //       doId: course?.id ?? '',
    //       courseDuration: int.parse(course?.duration?.toString() ?? ''),
    //       learningPathContent: isLearningPathContent ? 1 : 0,
    //       provider: course?.source ?? '',
    //     );
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  void trackCourseView(Course? course) async {
    // try {
    //   bool _isContentViewEnabled =
    //       await Provider.of<TocRepository>(context, listen: false)
    //           .isSmartechEventEnabled(eventName: SMTTrackEvents.contentView);
    //   if (_isContentViewEnabled) {
    //     SmartechService.trackCourseView(
    //       courseCategory: course?.courseCategory ?? '',
    //       courseName: course?.name ?? '',
    //       image: course?.appIcon ?? '',
    //       contentUrl: "${TocConfigModel.baseUrl}/app/toc/ext/${course?.id ?? ''}",
    //       doId: course?.id ?? '',
    //       courseDuration: int.parse(course?.duration?.toString() ?? ''),
    //       learningPathContent: isLearningPathContent ? 1 : 0,
    //       provider: course?.source ?? '',
    //     );
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  _navigateToExtCoursePlayer({required String redirectUrl}) {
    if (_isEnrolled.value!) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ExternalCoursePlayer(url: redirectUrl),
        ),
      );
    }
  }

  void _generateTelemetryData() async {
    // var telemetryRepository = TelemetryRepository();
    // Map eventData = telemetryRepository.getImpressionTelemetryEvent(
    //     pageIdentifier: TelemetryPageIdentifier.courseDetailsPageId,
    //     telemetryType: TelemetryType.page,
    //     pageUri: TelemetryPageIdentifier.courseDetailsPageUri
    //         .replaceAll(':do_ID', widget.contentId),
    //     env: TelemetryEnv.learn,
    //     objectId: widget.contentId,
    //     objectType: widget.contentType!);
    // await telemetryRepository.insertEvent(eventData: eventData);
  }

  Future<void> _generateInteractTelemetryData({required String clickId}) async {
    // var telemetryRepository = TelemetryRepository();
    // Map eventData = telemetryRepository.getInteractTelemetryEvent(
    //     pageIdentifier: TelemetryPageIdentifier.courseDetailsPageId +
    //         '_' +
    //         widget.contentId,
    //     contentId: clickId,
    //     subType: TelemetrySubType.externalCourse,
    //     env: TelemetryEnv.learn);
    // await telemetryRepository.insertEvent(eventData: eventData);
  }

  Widget _aboutTab(AsyncSnapshot<Course> tocData) {
    return SingleChildScrollView(
      child: Container(
        //    height: 1.sh,
        padding: EdgeInsets.fromLTRB(16, 32, 16, 32).w,
        decoration: BoxDecoration(color: TocModuleColors.scaffoldBackground),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //duration
                tocData.data?.duration != null
                    ? Container(
                        height: 60.w,
                        width: 64.w,
                        margin: const EdgeInsets.only(right: 24.0).r,
                        child: Column(
                          children: [
                            Icon(
                              Icons.access_time_sharp,
                              color: TocModuleColors.darkBlue,
                              size: 20.sp,
                            ),
                            SizedBox(height: 2.w),
                            Expanded(
                              child: Text(
                                DateTimeHelper.getTimeFormatInHrs(
                                  int.parse(tocData.data!.duration!),
                                ),
                                style: GoogleFonts.lato(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(),

                /// Certificate
                // (_courseStatus != null &&
                //         _courseStatus!.completionPercentage ==
                //             TocConstants.COURSE_COMPLETION_PERCENTAGE)
                //     ? CourseCompleteCertificate(
                //         courseStatus: _courseStatus,
                //         courseInfo: tocData.data!,
                //         isCertificateProvided:
                //             (_courseStatus!.issuedCertificates != null &&
                //                 _courseStatus!.issuedCertificates!.isNotEmpty))
                //     : Container(
                //         margin: EdgeInsets.only(bottom: 16).r,
                //         padding: EdgeInsets.all(16).r,
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //               color: TocModuleColors.orangeTourText,
                //             ),
                //             color: TocModuleColors.orangeTourText
                //                 .withValues(alpha: 0.24),
                //             borderRadius: BorderRadius.circular(8.r)),
                //         child: Text(
                //           TocLocalizations.of(context)!.mExternalCourseMessage(
                //               tocData.data?.contentPartner
                //                       ?.contentPartnerName ??
                //                   ''),
                //           style: GoogleFonts.lato(
                //             fontSize: 14.sp,
                //             height: 1.3.w,
                //             fontWeight: FontWeight.w500,
                //             color: TocModuleColors.greys,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //       ),

                ///Description
                (tocData.data!.description != null &&
                        tocData.data!.description!.isNotEmpty)
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 32).w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TocLocalizations.of(context)!.mStaticSummary,
                              style: GoogleFonts.lato(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              tocData.data!.description ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 16.sp,
                                height: 1.5.w,
                                fontWeight: FontWeight.w400,
                                color: TocModuleColors.greys60,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),

                ///Objective
                (tocData.data!.objectives?.isNotEmpty ?? false)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TocLocalizations.of(context)!.mLearnObjectives,
                            style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8.w),
                          HtmlWidget(
                            tocData.data!.objectives!.replaceAll(
                              '_x000D_,',
                              '',
                            ),
                            textStyle: GoogleFonts.lato(
                              fontSize: 16.sp,
                              height: 1.5.w,
                              fontWeight: FontWeight.w400,
                              color: TocModuleColors.greys60,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),

            ///Competency strips
            tocData.data?.competencies != null &&
                    tocData.data!.competencies!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      bottom: 8,
                      top: 8,
                    ).r,
                    child: CompetencyStrip(
                      competencies: tocData.data!.competencies!,
                    ),
                  )
                : SizedBox.shrink(),

            ///Tags
            _filteredTags.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(16.0).r,
                    child: TocTags(
                      keywords: _filteredTags,
                      title: TocLocalizations.of(context)!.mStaticTags,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }
}
