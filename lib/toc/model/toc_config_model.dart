import 'package:flutter/material.dart';

class TocConfigModel {
  final String baseUrl;
  final String token;
  final String wid;
  final String orgId;
  final String apiKey;
  final Widget Function(BuildContext) tipsForLearners;
  final Widget Function(BuildContext) notificationIcon;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget Function({
    required BuildContext context,
    required String courseId,
    required bool isEnrolled,
    double bottomMargin,
  })
  courseComments;

  TocConfigModel({
    required this.baseUrl,
    required this.token,
    required this.wid,
    required this.orgId,
    required this.apiKey,
    required this.tipsForLearners,
    required this.notificationIcon,
    required this.navigatorKey,
    required this.courseComments,
  });
}
