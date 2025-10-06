import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/toc/widgets/toc_container_skeleton.dart';

class ReviewCardSkeleton extends StatelessWidget {
  const ReviewCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TocContainerSkeleton(
                height: 16.w,
                width: 0.4.sw,
              ),
              SizedBox(height: 8.h),
              TocContainerSkeleton(
                height: 16.w,
                width: 0.5.sw,
              ),
              SizedBox(height: 8.h),
              TocContainerSkeleton(
                height: 16.w,
                width: 0.65.sw,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  TocContainerSkeleton(
                    height: 35.w,
                    width: 35.w,
                  ),
                  SizedBox(width: 8.w),
                  TocContainerSkeleton(
                    height: 16.w,
                    width: 0.3.sw,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          TocContainerSkeleton(
            height: 35.w,
            width: 35.w,
          ),
        ],
      ),
    );
  }
}
