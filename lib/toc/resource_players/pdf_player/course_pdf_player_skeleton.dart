import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igot_ui_components/ui/widgets/container_skeleton/container_skeleton.dart';
import 'package:igot_ui_components/utils/module_colors.dart';

class PdfPlayerSkeletonPage extends StatelessWidget {
  const PdfPlayerSkeletonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Center(
          child: ContainerSkeleton(
            width: double.infinity,
            height: 0.7.sh,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: ModuleColors.appBarBackground,
            height: 60.w,
            padding: EdgeInsets.only(left: 16, right: 16).r,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ContainerSkeleton(
                  height: 30.w,
                  width: 70.r,
                ),
                ContainerSkeleton(
                  height: 30.w,
                  width: 100.r,
                ),
                ContainerSkeleton(
                  height: 30.w,
                  width: 70.r,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.all(16).r,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)).r,
            ),
            child: ContainerSkeleton(
              height: 20.w,
              width: 40.w,
              radius: 4.r,
            ),
          ),
        ),
      ],
    );
    // return SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: ContainerSkeleton(
    //       width: 100,
    //       height: 20,
    //       color: AppColors.grey08,
    //     ),
    //   ),
    // );
  }
}
