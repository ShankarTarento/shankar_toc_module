import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class TocContainerSkeleton extends StatefulWidget {
  final double height;
  final double width;
  final double padding;
  final double radius;
  final Widget? child;

  const TocContainerSkeleton(
      {super.key,
      this.height = 10,
      this.width = 10,
      this.padding = 0,
      this.radius = 8,
      this.child});

  @override
  TocContainerSkeletonState createState() => TocContainerSkeletonState();
}

class TocContainerSkeletonState extends State<TocContainerSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<Color?> animation;
  @override
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    animation = TweenSequence<Color?>([
      TweenSequenceItem<Color?>(
        weight: 1.0,
        tween: ColorTween(
          begin: TocModuleColors.grey04,
          end: TocModuleColors.grey08,
        ),
      ),
      TweenSequenceItem<Color?>(
        weight: 1.0,
        tween: ColorTween(
          begin: TocModuleColors.grey04,
          end: TocModuleColors.grey08,
        ),
      ),
    ]).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.repeat(reverse: true);
  }

  @override
  dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width.w,
        height: widget.height.w,
        padding: EdgeInsets.all(widget.padding).r,
        decoration: BoxDecoration(
          color: animation.value,
          borderRadius: BorderRadius.circular(widget.radius).r,
        ),
        child: widget.child ?? const Center());
  }
}
