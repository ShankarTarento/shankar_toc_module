import 'dart:convert';
import 'package:toc_module/toc/constants/api_urls.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/network_headers.dart';
import 'package:toc_module/toc/model/toc_config_model.dart';
import 'package:http/http.dart';
import 'package:toc_module/toc/services/toc_module_service.dart';

class TocServices {
  TocConfigModel config = TocModuleService.config;

  String get courseReadUrl => config.baseUrl + ApiUrls.getCourse;
  String get courseHierarchyUrl => config.baseUrl + ApiUrls.getCourseDetails;
  String get getKarmapoints => config.baseUrl + ApiUrls.getKarmaPoints;
  String get claimKarmaPointsUrl => config.baseUrl + ApiUrls.claimKarmaPoints;
  String get getCourseReviewUrl => config.baseUrl + ApiUrls.getCourseReview;
  String get getCourseCompletionCertificateForMobile =>
      config.baseUrl + ApiUrls.getCourseCompletionCertificateForMobile;

  String get getCourseCompletionDynamicCertificateUrl =>
      config.baseUrl + ApiUrls.getCourseCompletionDynamicCertificate;
  String get getCourseCompletionCertificateUrl =>
      config.baseUrl + ApiUrls.getCourseCompletionCertificate;
  String get courseReviewSummeryUrl =>
      config.baseUrl + ApiUrls.getCourseReviewSummery;

  String get getCourseEnrollDetailsByIdsUrl =>
      config.baseUrl + ApiUrls.getCourseEnrollDetailsByIds;
  String get getYourRatingUrl => config.baseUrl + ApiUrls.getYourRating;
  String get postReviewUrl => config.baseUrl + ApiUrls.postReview;
  String get updatePreRequisiteContentProgress =>
      config.baseUrl + ApiUrls.updatePreRequisiteContentProgress;
  String get updateContentProgressUrl =>
      config.baseUrl + ApiUrls.updateContentProgress;
  String get readContentProgressUrl =>
      config.baseUrl + ApiUrls.readContentProgress;
  String get autoEnrollBatchUrl => config.baseUrl + ApiUrls.autoEnrollBatch;

  Future<Response> getCbplan() async {
    Response response = await get(
      Uri.parse(config.baseUrl + ApiUrls.getCbplan),
      headers: NetworkHeaders.getHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
      ),
    );
    return response;
  }

  Future<Response> getCourseReadData({required String courseId}) async {
    Response response = await get(
      Uri.parse(courseReadUrl + courseId),
      headers: NetworkHeaders.getHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
      ),
    );
    return response;
  }

  Future<Response> getCourseHierarchyData({required String courseId}) async {
    return await get(
      Uri.parse(courseHierarchyUrl + courseId + '?hierarchyType=detail'),
      headers: NetworkHeaders.getHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
      ),
    );
  }

  Future<Response> getKarmaPointCourseRead({required String courseId}) async {
    var body = json.encode({
      "request": {
        "filters": {"contextType": "Course", "contextId": courseId},
      },
    });
    final response = await post(
      Uri.parse(getKarmapoints),
      headers: NetworkHeaders.profilePostHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
      ),
      body: body,
    );
    return response;
  }

  Future<Response> claimKarmaPoints(String courseId) async {
    var body = json.encode({"userId": config.wid, "courseId": courseId});
    final response = await post(
      Uri.parse(claimKarmaPointsUrl),
      headers: NetworkHeaders.profilePostHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
      ),
      body: body,
    );
    return response;
  }

  Future<Response> getCourseReviewSummery({
    required String id,
    required String primaryCategory,
  }) async {
    Response res = await get(
      Uri.parse(courseReviewSummeryUrl + '$id/$primaryCategory'),
      headers: NetworkHeaders.getHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
      ),
    );
    return res;
  }

  Future<Response> getCourseReview({
    required String courseId,
    required String primaryCategory,
    required int limit,
  }) async {
    Map data = {
      "activityId": courseId,
      "activityType": primaryCategory,
      "limit": limit,
      "updateOn": "",
    };

    var body = json.encode(data);
    Response res = await post(
      Uri.parse(getCourseReviewUrl),
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
      body: body,
    );

    return res;
  }

  Future<Response> getYourReviewRating({
    required String id,
    required String primaryCategory,
  }) async {
    Map data = {
      "request": {
        "activityId": id,
        "activityType": primaryCategory,
        "userId": [config.wid],
      },
    };

    var body = json.encode(data);
    Response res = await post(
      Uri.parse(getYourRatingUrl),
      body: body,
      headers: NetworkHeaders.getHeaders(
        apiKey: config.apiKey,
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
      ),
    );

    return res;
  }

  Future<Response> postCourseReview({
    required String courseId,
    required String primaryCategory,
    required double rating,
    required String comment,
  }) async {
    Map data;
    if (comment.trim().length > 0) {
      data = {
        "activityId": courseId,
        "userId": config.wid,
        "activityType": primaryCategory,
        "rating": rating.toInt(),
        "review": comment,
      };
    } else {
      data = {
        "activityId": courseId,
        "userId": config.wid,
        "activityType": primaryCategory,
        "rating": rating.toInt(),
      };
    }

    var body = json.encode(data);
    Response response = await post(
      Uri.parse(postReviewUrl),
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
      body: body,
    );
    return response;
  }

  Future<Response> downloadCompletionCertificate({
    String? outputType,
    required String printUri,
  }) async {
    Map data = {
      "printUri": printUri,
      "inputFormat": "svg",
      "outputFormat": outputType ?? CertificateType.pdf,
    };

    var body = json.encode(data);
    Response certRes = await post(
      Uri.parse(getCourseCompletionCertificateForMobile),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    return certRes;
  }

  Future<Response> getCourseCompletionDynamicCertificate({
    required String courseId,
    required String batchId,
  }) async {
    Map data = {
      "request": {
        "userId": config.wid,
        "courseId": courseId,
        "batchId": batchId,
      },
    };

    var body = json.encode(data);

    Response res = await post(
      Uri.parse(getCourseCompletionDynamicCertificateUrl),
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
      body: body,
    );

    return res;
  }

  Future<dynamic> getCourseCompletionCertificate({
    required String certificateId,
  }) async {
    Response res = await get(
      Uri.parse(getCourseCompletionCertificateUrl + certificateId),
      headers: {'Authorization': 'bearer ${config.apiKey}'},
    );

    return res;
  }

  Future<Response> getEnrolledCourseById({required String courseId}) async {
    Map data = {
      "request": {
        "retiredCoursesEnabled": true,
        "courseId": [courseId],
      },
    };

    var body = json.encode(data);

    Response res = await post(
      Uri.parse(getCourseEnrollDetailsByIdsUrl + config.wid),
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
      body: body,
    );

    return res;
  }

  Future<Response> updateContentProgress({
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
  }) async {
    List dateTime = DateTime.now().toUtc().toString().split('.');

    Map data;

    if (isPreRequisite ?? false) {
      if (isAssessment) {
        data = {
          "request": {
            "contents": [
              {
                "contentId": contentId,
                "status": status,
                "lastAccessTime": '${dateTime[0]}:00+0000',
                "progressdetails": {"mimeType": contentType},
                "completionPercentage": completionPercentage,
                "language": language.toLowerCase(),
              },
            ],
          },
        };
      } else {
        data = {
          "request": {
            "contents": [
              {
                "contentId": contentId,
                "status": status,
                "lastAccessTime": '${dateTime[0]}:00+0000',
                "progressdetails": {
                  "max_size": maxSize,
                  "current": current,
                  "mimeType": contentType,
                },
                "completionPercentage": completionPercentage,
                "language": language.toLowerCase(),
              },
            ],
          },
        };
      }
    } else {
      if (isAssessment) {
        data = {
          "request": {
            "userId": config.wid,
            "contents": [
              {
                "contentId": contentId,
                "batchId": batchId,
                "status": status,
                "courseId": courseId,
                "lastAccessTime": '${dateTime[0]}:00+0000',
                "language": language.toLowerCase(),
              },
            ],
          },
        };
      } else {
        data = {
          "request": {
            "userId": config.wid,
            "contents": [
              {
                "contentId": contentId,
                "batchId": batchId,
                "status": status,
                "courseId": courseId,
                "lastAccessTime": '${dateTime[0]}:00+0000',
                "progressdetails": {
                  "max_size": maxSize,
                  "current": current,
                  "mimeType": contentType,
                  "spentTime": spentTime,
                },
                "completionPercentage": completionPercentage,
                "language": language.toLowerCase(),
              },
            ],
          },
        };
      }
    }

    var body = json.encode(data);
    String url = (isPreRequisite ?? false)
        ? updatePreRequisiteContentProgress
        : updateContentProgressUrl;
    Response res = await patch(
      Uri.parse(url),
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
      body: body,
    );
    return res;
  }

  Future<Response> readContentProgress({
    required String courseId,
    required String batchId,
    List contentIds = const [],
    required String language,
  }) async {
    Map data = {
      "request": {
        "batchId": batchId,
        "userId": config.wid,
        "courseId": courseId,
        "contentIds": contentIds,
        "fields": ["progressdetails"],
        "language": language.toLowerCase(),
      },
    };
    var body = jsonEncode(data);
    Response res = await post(
      Uri.parse(readContentProgressUrl),
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
      body: body,
    );
    return res;
  }

  Future<dynamic> autoEnrollBatch({
    required String courseId,
    String? language,
  }) async {
    Uri uri = Uri.parse(
      autoEnrollBatchUrl,
    ).replace(queryParameters: {'language': language});

    Response res = await get(
      uri,
      headers: NetworkHeaders.postHeaders(
        token: config.token,
        wid: config.wid,
        rootOrgId: config.orgId,
        apiKey: config.apiKey,
        baseUrl: config.baseUrl,
      ),
    );
    return res;
  }
}
