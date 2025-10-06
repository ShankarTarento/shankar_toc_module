import 'package:toc_module/toc/model/course_model.dart';

class CbPlanModel {
  final int? count;
  final List<Content>? content;

  CbPlanModel({
    this.count,
    this.content,
  });

  factory CbPlanModel.fromJson(Map<String, dynamic> json) => CbPlanModel(
        count: json["count"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );
}

class Content {
  final String? endDate;
  final String? id;
  final String? userType;
  final bool? isApar;
  final List<Course>? contentList;

  Content({
    this.endDate,
    this.id,
    this.userType,
    this.isApar,
    this.contentList,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        endDate: json["endDate"],
        id: json["id"],
        userType: json["userType"],
        isApar: json["isApar"],
        contentList: List<Course>.from(json["contentList"]
            .map((x) => Course.fromJson(x, endDate: json["endDate"]))),
      );
}
