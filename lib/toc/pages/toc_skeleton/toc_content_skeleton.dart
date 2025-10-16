import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igot_ui_components/ui/widgets/container_skeleton/container_skeleton.dart';

class TocContentSkeletonPage extends StatefulWidget {
  const TocContentSkeletonPage({Key? key}) : super(key: key);
  TocContentSkeletonPageState createState() => TocContentSkeletonPageState();
}

class TocContentSkeletonPageState extends State<TocContentSkeletonPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
          SizedBox(height: 8.w),
          ContainerSkeleton(
            height: 80.w,
            width: 1.sw,
          ),
        ],
      ),
    );
  }
}
