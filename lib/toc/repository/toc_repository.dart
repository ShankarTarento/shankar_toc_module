import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toc_module/toc/model/cbp_plan_model.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/resource_details.dart';
import 'package:toc_module/toc/services/toc_services.dart';

class TocRepository extends ChangeNotifier {
  double? _courseProgress = null;
  dynamic _courseRatingAndReview;
  Map<String, dynamic>? _cbplanData;
  Course? _courseRead;
  CourseHierarchyModel? _courseHierarchy;
  Course? _enrolledCourse;
  bool _isLoading = false;

  ///
  ///
  /// Getters
  ///
  bool get isLoading => _isLoading;
  Course? get getCourseRead => _courseRead;
  CourseHierarchyModel? get getCourseHierarchy => _courseHierarchy;
  Course? get getEnrolledCourse => _enrolledCourse;
  Map<String, dynamic>? get cbplanData => _cbplanData;
  double? get courseProgress => _courseProgress;
  dynamic get courseRatingAndReview => _courseRatingAndReview;

  ///
  ///
  ///
  ///fetch toc data
  Future<void> fetchTocData({required String courseId}) async {
    _isLoading = true;
    // notifyListeners();
    await getCourseReadData(courseId: courseId);
    await getCourseHierarchyData(courseId: courseId);
    await getEnrolledCourseById(courseId: courseId);
    await getCbpPlan();
    _isLoading = false;
    notifyListeners();
  }

  Future<Course?> getCourseReadData({required String courseId}) async {
    try {
      final Response response =
          await TocServices().getCourseReadData(courseId: courseId);

      if (response.statusCode != 200) {
        debugPrint(
            'Failed to load course read data. Status code: ${response.statusCode}');
        return null;
      }

      final decodedBody = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> contents = jsonDecode(decodedBody);

      final Map<String, dynamic>? data = contents['result']?['content'];
      if (data == null) {
        debugPrint('No course data found in response');
        return null;
      }

      try {
        _courseRead = Course.fromJson(data);
        return _courseRead;
      } catch (e) {
        debugPrint('Error parsing CourseRead from JSON: $e');
        return null;
      }
    } catch (e) {
      debugPrint("e");
      return null;
    }
  }

  Future<CourseHierarchyModel?> getCourseHierarchyData(
      {required String courseId}) async {
    try {
      final Response response =
          await TocServices().getCourseHierarchyData(courseId: courseId);

      if (response.statusCode != 200) {
        debugPrint(
            'Failed to load course read data. Status code: ${response.statusCode}');
        return null;
      }

      final decodedBody = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> contents = jsonDecode(decodedBody);

      final Map<String, dynamic>? data = contents['result']?['content'];
      if (data == null) {
        debugPrint('No course data found in response');
        return null;
      }

      try {
        _courseHierarchy = CourseHierarchyModel.fromJson(data);
        return _courseHierarchy;
      } catch (e) {
        debugPrint('Error parsing CourseRead from JSON: $e');
        return null;
      }
    } catch (e) {
      debugPrint("e");
      return null;
    }
  }

  Future<Course?> getEnrolledCourseById({
    required String courseId,
  }) async {
    try {
      final response =
          await TocServices().getEnrolledCourseById(courseId: courseId);

      if (response.statusCode != 200) {
        debugPrint(
            'Failed to load courses. Status code: ${response.statusCode}');
        return null;
      }

      final decoded = json.decode(utf8.decode(response.bodyBytes));

      final coursesJson = decoded['result']?['courses'];
      if (coursesJson == null || coursesJson.isEmpty) {
        debugPrint(' No enrolled courses found in response.');
        return null;
      }

      final courses = List<Course>.from(
        coursesJson.map((e) => Course.fromJson(e)),
      );
      _enrolledCourse = courses.isNotEmpty ? courses.first : null;
      return courses.isNotEmpty ? courses.first : null;
    } catch (e) {
      debugPrint(' Exception while fetching enrolled course: $e');
      return null;
    }
  }

  Future<CbPlanModel?> getCbpPlan() async {
    try {
      final response = await TocServices().getCbplan();

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final cbpInfo = data['result'] as Map<String, dynamic>;
        _cbplanData = cbpInfo;

        final content = cbpInfo['content'];
        if (content != null && content is List && content.isNotEmpty) {
          return CbPlanModel.fromJson(cbpInfo);
        }
      }
    } catch (e) {
      debugPrint('Error fetching CB Plan: $e');
    }

    return null;
  }

  Future<dynamic> getKarmaPointCourseRead(String courseId) async {
    var response;
    try {
      response =
          await TocServices().getKarmaPointCourseRead(courseId: courseId);
    } catch (_) {
      return _;
    }
    if (response.statusCode == 200) {
      var contents = jsonDecode(response.body);
      return contents['kpList'];
    } else {
      "";
    }
  }

  void clearCourseProgress() {
    if (_courseProgress != null) {
      _courseProgress = null;
      notifyListeners();
    }
  }

  void setCourseProgress(double progress) {
    if (_courseProgress == null || _courseProgress! < progress) {
      _courseProgress = progress;
      notifyListeners();
    }
  }

  Future<String> claimKarmaPoints(String courseId) async {
    try {
      final response = await TocServices().claimKarmaPoints(courseId);
      if (response.statusCode == 200) {
        return "Success";
      }
    } catch (_) {}
    return "error";
  }

  Future<ResourceDetails?> getResourceDetails(
      {required String courseId}) async {
    try {
      final response =
          await TocServices().getCourseReadData(courseId: courseId);

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return ResourceDetails.fromJson(data);
      }
    } catch (e) {
      debugPrint("Error fetching course read data: $e");
    }
    return null;
  }

  updateContentProgress(
      {required String courseId,
      required String batchId,
      required String contentId,
      required int status,
      required String contentType,
      required List current,
      var maxSize,
      required double completionPercentage,
      bool isAssessment = false,
      bool? isPreRequisite = false,
      int spentTime = 0,
      required String language}) {
    TocServices().updateContentProgress(
      courseId: courseId,
      batchId: batchId,
      contentId: contentId,
      status: status,
      contentType: contentType,
      current: current,
      maxSize: maxSize,
      completionPercentage: completionPercentage,
      isAssessment: isAssessment,
      isPreRequisite: isPreRequisite,
      spentTime: spentTime,
      language: language,
    );
  }
}
