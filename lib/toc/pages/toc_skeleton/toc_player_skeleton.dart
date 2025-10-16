import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igot_ui_components/ui/widgets/container_skeleton/container_skeleton.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:toc_module/toc/model/learn_tab_model.dart';
import 'package:toc_module/toc/pages/toc_skeleton/toc_about_skeleton.dart';
import 'package:toc_module/toc/pages/toc_skeleton/toc_comment_view_skeleton.dart';
import 'package:toc_module/toc/pages/toc_skeleton/toc_content_skeleton.dart';
import 'package:toc_module/toc/widgets/toc_appbar_widget.dart';

class TocPlayerSkeleton extends StatefulWidget {
  final bool? showCourseShareOption;
  final bool isFeatured;
  final Function? courseShareOptionCallback;
  TocPlayerSkeleton(
      {Key? key,
      this.showCourseShareOption,
      this.courseShareOptionCallback,
      this.isFeatured = false})
      : super(key: key);
  TocPlayerSkeletonState createState() => TocPlayerSkeletonState();
}

class TocPlayerSkeletonState extends State<TocPlayerSkeleton>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Color?> animation;
  TabController? learnTabController;

  @override
  void didChangeDependencies() {
    tabItems = LearnTab.tocTabs(context, isFeatured: widget.isFeatured);
    learnTabController =
        TabController(length: tabItems.length, vsync: this, initialIndex: 1);
    super.didChangeDependencies();
  }

  List<LearnTab> tabItems = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    animation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: ModuleColors.grey04,
            end: ModuleColors.grey08,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: ModuleColors.grey04,
            end: ModuleColors.grey08,
          ),
        ),
      ],
    ).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.repeat();
  }

  @override
  dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabItems.length,
        child: Stack(children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SafeArea(
              child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, innerBoxIsScrolled) {
                    return <Widget>[
                      TocAppbarWidget(
                        isOverview: true,
                        showCourseShareOption: true,
                        courseShareOptionCallback:
                            widget.courseShareOptionCallback,
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 0.3.sh,
                          width: 1.sw,
                          color: ModuleColors.grey08,
                        ),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: true,
                        flexibleSpace: Container(
                          color: ModuleColors.darkBlue,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ).r,
                            child: Container(
                              padding: EdgeInsets.only(top: 4).r,
                              color: ModuleColors.appBarBackground,
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                indicator: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ModuleColors.darkBlue,
                                      width: 2.0.w,
                                    ),
                                  ),
                                ),
                                indicatorColor: ModuleColors.appBarBackground,
                                labelPadding: EdgeInsets.only(top: 0.0).r,
                                unselectedLabelColor: ModuleColors.greys60,
                                labelColor: ModuleColors.darkBlue,
                                labelStyle: GoogleFonts.lato(
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                unselectedLabelStyle: GoogleFonts.lato(
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                                tabs: [
                                  for (var tabItem in tabItems)
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16)
                                              .r,
                                      child: Tab(
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0).r,
                                          child: Text(
                                            tabItem.title,
                                            style: GoogleFonts.lato(
                                              color: ModuleColors.greys87,
                                              fontSize: 14.0.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                                controller: learnTabController,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(controller: learnTabController, children: [
                    TocAboutSkeletonPage(),
                    TocContentSkeletonPage(),
                    if (!widget.isFeatured)
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16).w,
                        child: CommentViewSkeleton(itemCount: 10),
                      ),
                  ])),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 32).r,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ModuleColors.lightGrey.withValues(alpha: 0),
                      ModuleColors.appBarBackground.withValues(alpha: 1)
                    ],
                  ),
                ),
                child: ContainerSkeleton(
                  height: 40.w,
                  width: 1.sw,
                ),
              )),
        ]));
  }
}
