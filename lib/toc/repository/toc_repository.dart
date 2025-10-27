import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/model/batch_model.dart';
import 'package:toc_module/toc/model/cbp_plan_model.dart';
import 'package:toc_module/toc/model/content_state_model.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/resource_details.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/services/toc_services.dart';

class TocRepository extends ChangeNotifier {
  dynamic _courseRatingAndReview;
  Map<String, dynamic>? _cbplanData;
  Course? _courseRead;
  CourseHierarchyModel? _courseHierarchy;
  Course? _enrolledCourse;
  bool _isLoading = false;
  Batch? _batch;
  final TocServices tocService = TocServices();
  OverallRating? _overallRating;
  double? _courseProgress;
  bool _isWebWiewPersist = true;
  Map<String, dynamic> _languageProgress = {};

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
  Batch? get batch => _batch;
  OverallRating? get overallRating => _overallRating;
  bool get isWebWiewPersist => _isWebWiewPersist;
  Map<String, dynamic> get languageProgress => _languageProgress;

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
      final Response response = await TocServices().getCourseReadData(
        courseId: courseId,
      );

      if (response.statusCode != 200) {
        debugPrint(
          'Failed to load course read data. Status code: ${response.statusCode}',
        );
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

  Future<CourseHierarchyModel?> getCourseHierarchyData({
    required String courseId,
  }) async {
    try {
      final Response response = await TocServices().getCourseHierarchyData(
        courseId: courseId,
      );

      if (response.statusCode != 200) {
        debugPrint(
          'Failed to load course read data. Status code: ${response.statusCode}',
        );
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

  Future<Course?> getEnrolledCourseById({required String courseId}) async {
    try {
      final response = await TocServices().getEnrolledCourseById(
        courseId: courseId,
      );

      if (response.statusCode != 200) {
        debugPrint(
          'Failed to load courses. Status code: ${response.statusCode}',
        );
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
      response = await TocServices().getKarmaPointCourseRead(
        courseId: courseId,
      );
    } catch (e) {
      return e;
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

  Future<ResourceDetails?> getResourceDetails({
    required String courseId,
  }) async {
    try {
      final response = await TocServices().getCourseReadData(
        courseId: courseId,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return ResourceDetails.fromJson(data);
      }
    } catch (e) {
      debugPrint("Error fetching course read data: $e");
    }
    return null;
  }

  updateContentProgress({
    required String courseId,
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
    required String language,
  }) {
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

  void setInitialBatch({
    List<Batch>? batches,
    Course? enrolledCourse,
    String? courseId,
  }) {
    if (enrolledCourse != null) {
      Batch approvedBatch = batches!.firstWhere(
        (element) => element.id == enrolledCourse.batch!.batchId,
      );
      _batch = approvedBatch;
      setBatchDetails(selectedBatch: _batch!);
    } else {
      try {
        DateTime now = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );
        _batch = batches!.fold(null, (closest, current) {
          if (current.enrollmentEndDate.isEmpty) {
            return closest ?? current;
          }
          DateTime enrollmentEndDate = DateTime.parse(
            current.enrollmentEndDate,
          );
          if (((enrollmentEndDate.isAfter(now)) ||
                  enrollmentEndDate.isAtSameMomentAs(now)) &&
              (closest == null ||
                  enrollmentEndDate.isBefore(
                    DateTime.parse(closest.enrollmentEndDate),
                  ))) {
            return current;
          }
          return closest;
        });
        if (_batch != null) {
          setBatchDetails(selectedBatch: _batch!);
        }
      } catch (e) {
        if (_batch != null) {
          _batch = null;
          notifyListeners();
        }
      }
    }
  }

  setBatchDetails({required Batch selectedBatch}) async {
    if (_batch == null ||
        (_batch != null && selectedBatch.batchId != _batch!.batchId)) {
      _batch = selectedBatch;
      notifyListeners();
    }
  }

  DateTime? getBatchStartTime() {
    if (batch != null) {
      return DateTime.parse(batch!.startDate);
    } else
      return null;
  }

  String getButtonTitle({
    required List<Course> enrollmentData,
    required String courseId,
  }) {
    Course? course = enrollmentData.cast<Course?>().firstWhere(
      (element) => element!.id == courseId,
      orElse: () => null,
    );

    if (course != null) {
      if (course.completionPercentage == COURSE_COMPLETION_PERCENTAGE) {
        return 'Start again';
      } else if (course.completionPercentage == 0) {
        return 'Start';
      } else if (course.completionPercentage! > 0 &&
          course.completionPercentage! < COURSE_COMPLETION_PERCENTAGE) {
        return 'Resume';
      }
    } else {
      return 'Enroll';
    }
    return 'Enroll';
  }

  Future<List<ContentStateModel>?> readContentProgress({
    required String courseId,
    required String batchId,
    List contentIds = const [],
    required String language,
    bool forceUpdateOverallProgress = false,
  }) async {
    _languageProgress = {};

    try {
      final response = await tocService.readContentProgress(
        courseId: courseId,
        batchId: batchId,
        contentIds: contentIds,
        language: language,
      );
      if (response.statusCode == 200) {
        var contents = jsonDecode(response.body);

        if (contents['result']['languageProgress'] != null &&
            contents['result']['languageProgress'].isNotEmpty &&
            forceUpdateOverallProgress) {
          _languageProgress = contents['result']['languageProgress'];
          notifyListeners();
        }
        List<ContentStateModel> content = contents['result']['contentList']
            .map((dynamic item) => ContentStateModel.fromJson(item))
            .toList()
            .cast<ContentStateModel>();
        return content;
      }
    } catch (_) {
      throw 'Unable to fetch content progress';
    }
    return null;
  }

  void resetLanguageProgress() {
    _languageProgress = {};
    notifyListeners();
  }

  Future<dynamic> autoEnrollBatch({
    required String courseId,
    String? language,
  }) async {
    try {
      Response res = await tocService.autoEnrollBatch(
        courseId: courseId,
        language: language,
      );
      if (res.statusCode == 200) {
        var contents = jsonDecode(res.body);
        return contents['result']['response']['content'][0];
      } else {
        return jsonDecode(res.body)['params']['errmsg'];
      }
    } catch (e) {
      return 'Unable to auto enroll a batch';
    }
  }
}
