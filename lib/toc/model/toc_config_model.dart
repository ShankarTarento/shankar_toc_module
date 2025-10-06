import 'package:flutter/material.dart';

class TocConfigModel {
  final String baseUrl;
  final String token;
  final String wid;
  final String orgId;
  final String apiKey;
  final Widget tipsForLearners;

  TocConfigModel({
    required this.baseUrl,
    required this.token,
    required this.wid,
    required this.orgId,
    required this.apiKey,
    required this.tipsForLearners,
  });
}
