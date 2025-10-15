import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class TocAppbarWidget extends StatelessWidget {
  final bool isOverview;
  final bool? showCourseShareOption;
  final Function? courseShareOptionCallback;
  final bool isPlayer;
  final String? courseId;
  TocAppbarWidget(
      {Key? key,
      required this.isOverview,
      this.showCourseShareOption,
      this.courseShareOptionCallback,
      this.isPlayer = false,
      this.courseId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return SliverAppBar(
      pinned: true,
      shadowColor: Colors.transparent,
      backgroundColor: TocModuleColors.darkBlue,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 24.sp,
          color: TocModuleColors.appBarBackground,
        ),
        onPressed: () {
          if (!isPressed) {
            isPressed = true;
            if (isPlayer) {
              Future.delayed(Duration(milliseconds: 500), () {
                if (isOverview) {
                  clearCourse(context);
                }
                Navigator.pop(context);
              });
            } else {
              if (isOverview) {
                clearCourse(context);
              }
              Navigator.pop(context);
            }
          }
        },
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16.0).r,
            child: NotificationIcon(
              iconColor: TocModuleColors.appBarBackground,
            ),
          ),
          showCourseShareOption!
              ? GestureDetector(
                  child: Icon(
                    Icons.share,
                    size: 24.sp,
                    color: TocModuleColors.appBarBackground,
                  ),
                  onTap: () {
                    if (courseShareOptionCallback != null) {
                      courseShareOptionCallback!();
                    }
                  },
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  void clearCourse(BuildContext context) {
    //Clear content read, hierarchy, rating and review
    Provider.of<TocRepository>(context, listen: false).clearCourseDetails();
    //Clear course progress
    Provider.of<TocRepository>(context, listen: false).clearCourseProgress();
  }
}
