import 'dart:convert';

import 'package:http/http.dart';
import 'package:toc_module/toc/constants/api_urls.dart';
import 'package:toc_module/toc/helper/network_headers.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/gust_data_model.dart';
import 'package:toc_module/toc/model/toc_config_model.dart';
import 'package:toc_module/toc/services/toc_module_service.dart';

class AssessmentService {
  TocConfigModel config = TocModuleService.config;

//Advanced Assessment read
  Future<dynamic> getStandaloneAssessmentInfo(String id,
      {required String parentContextId}) async {
    var res;

    res = await get(
        Uri.parse(config.baseUrl + ApiUrls.getStandaloneAssessmentInfo + id)
            .replace(queryParameters: {'parentContextId': parentContextId}),
        headers: NetworkHeaders.getHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
        ));

    return res;
  }

// Advanced assessment retake info
  Future<dynamic> getRetakeStandaloneAssessmentInfo(String assessmentId) async {
    Response res = await get(
        Uri.parse(config.baseUrl +
            ApiUrls.getStandaloneRetakeAssessmentInfo +
            assessmentId),
        headers: NetworkHeaders.getHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
        ));
    return res;
  }

// Advanced assessment question list
  Future<dynamic> getStandaloneAssessmentQuestions(
    String assessmentId,
    List<dynamic> questionIds,
  ) async {
    ;
    Map data = {
      'assessmentId': '$assessmentId',
      'request': {
        'search': {'identifier': questionIds}
      }
    };

    var body = json.encode(data);

    Response res = await post(
        Uri.parse(config.baseUrl + ApiUrls.getStandaloneAssessmentQuestions),
        headers: NetworkHeaders.postHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
          baseUrl: config.baseUrl,
        ),
        body: body);
    return res;
  }

  // Advanced assessment submit
  Future<dynamic> submitStandaloneAssessment(Map data,
      {bool isFTBDropdown = false}) async {
    var body = json.encode(data);
    String url;
    if (isFTBDropdown) {
      url = config.baseUrl + ApiUrls.submitV6StandaloneAssessment;
    } else {
      url = config.baseUrl + ApiUrls.submitStandaloneAssessment;
    }
    Response res = await post(Uri.parse(url),
        headers: NetworkHeaders.postHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
          baseUrl: config.baseUrl,
        ),
        body: body);
    return res;
  }

  // Advanced assessment save answered questions
  Future<dynamic> saveAssessmentQuestion(Map data) async {
    var body = json.encode(data);
    Response res =
        await post(Uri.parse(config.baseUrl + ApiUrls.saveAssessmentQuestion),
            headers: NetworkHeaders.postHeaders(
              token: config.token,
              wid: config.wid,
              rootOrgId: config.orgId,
              apiKey: config.apiKey,
              baseUrl: config.baseUrl,
            ),
            body: body);
    return res;
  }

// Basic assessment read
  Future<dynamic> getAssessmentInfo(String id,
      {required String parentContextId}) async {
    Response res = await get(
        Uri.parse(config.baseUrl + ApiUrls.getAssessmentInfo + id)
            .replace(queryParameters: {'parentContextId': parentContextId}),
        headers: NetworkHeaders.getHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
        ));
    return res;
  }

// Basic assessment retake info
  Future<dynamic> getRetakeAssessmentInfo(String assessmentId) async {
    Response res = await get(
        Uri.parse(
            config.baseUrl + ApiUrls.getRetakeAssessmentInfo + assessmentId),
        headers: NetworkHeaders.getHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
        ));
    return res;
  }

// Basic assessment question list
  Future<dynamic> getAssessmentQuestions(
    String assessmentId,
    List<dynamic> questionIds,
  ) async {
    Map data = {
      'assessmentId': '$assessmentId',
      'request': {
        'search': {'identifier': questionIds}
      }
    };

    var body = json.encode(data);

    Response res =
        await post(Uri.parse(config.baseUrl + ApiUrls.getAssessmentQuestions),
            headers: NetworkHeaders.postHeaders(
              token: config.token,
              wid: config.wid,
              rootOrgId: config.orgId,
              apiKey: config.apiKey,
              baseUrl: config.baseUrl,
            ),
            body: body);
    return res;
  }

// Basic assessment submit
  Future<dynamic> submitAssessmentNew(Map data) async {
    var body = json.encode(data);
    Response res =
        await post(Uri.parse(config.baseUrl + ApiUrls.saveAssessmentNew),
            headers: NetworkHeaders.postHeaders(
              token: config.token,
              wid: config.wid,
              rootOrgId: config.orgId,
              apiKey: config.apiKey,
              baseUrl: config.baseUrl,
            ),
            body: body);

    return res;
  }

// Basic assessment result
  Future<dynamic> getAssessmentCompletionStatus(Map data) async {
    var body = json.encode(data);
    Response res = await post(
        Uri.parse(config.baseUrl + ApiUrls.getAssessmentCompletionStatus),
        headers: NetworkHeaders.postHeaders(
          token: config.token,
          wid: config.wid,
          rootOrgId: config.orgId,
          apiKey: config.apiKey,
          baseUrl: config.baseUrl,
        ),
        body: body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      var contents = jsonDecode(res.body);
      return contents['result'];
    } else {
      return jsonDecode(res.body)['params']['errmsg'];
    }
  }

// Assessment read for assessment with artifact URL
  Future<dynamic> getAssessmentData(
    String fileUrl,
  ) async {
    Response res = await get(Uri.parse(TocHelper.convertToPortalUrl(fileUrl)),
        headers: {});
    return res;
  }

// Assessment with artifact URL submit
  Future<dynamic> submitAssessment(Map data) async {
    var body = json.encode(data);
    Response res =
        await post(Uri.parse(config.baseUrl + ApiUrls.saveAssessment),
            headers: NetworkHeaders.postHeaders(
              token: config.token,
              wid: config.wid,
              rootOrgId: config.orgId,
              apiKey: config.apiKey,
              baseUrl: config.baseUrl,
            ),
            body: body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      var contents = jsonDecode(res.body);
      return contents;
    } else {
      throw 'Can\'t submit survey data';
    }
  }

  /// Public assessment read
  Future<dynamic> getPublicAssessmentInfo(
      {required String assessmentId,
      required String contextId,
      GuestDataModel? guestUserData}) async {
    Map<String, dynamic> data = {
      "assessmentIdentifier": assessmentId,
      "contextId": contextId,
      "name": guestUserData?.name ?? '',
      "email": guestUserData?.email ?? ''
    };

    var body = json.encode(data);
    Response res = await post(
        Uri.parse(config.baseUrl + ApiUrls.publicAssessmentV5Read),
        headers: NetworkHeaders.publicHeaders(apiKey: config.apiKey),
        body: body);

    return res;
  }

  /// public assessment question list
  Future<dynamic> getPublicAssessmentQuestions(
      String assessmentId,
      String contextId,
      List<dynamic> questionIds,
      GuestDataModel? guestUserData) async {
    Map data = {
      'assessmentIdentifier': '$assessmentId',
      'contextId': '$contextId',
      'request': {
        'search': {'identifier': questionIds}
      },
      "name": guestUserData?.name ?? '',
      "email": guestUserData?.email ?? ''
    };
    var body = json.encode(data);

    Response res = await post(
        Uri.parse(config.baseUrl + ApiUrls.publicAssessmentQuestionList),
        headers: NetworkHeaders.publicHeaders(apiKey: config.apiKey),
        body: body);

    return res;
  }

  /// public assessment submit
  Future<dynamic> submitPublicAssessment(Map data,
      {bool isAdvanceAssessment = true}) async {
    var body = json.encode(data);
    String url = isAdvanceAssessment
        ? config.baseUrl + ApiUrls.publicAdvanceAssessmentSubmit
        : config.baseUrl + ApiUrls.publicBasicAssessmentSubmit;
    Response res = await post(Uri.parse(url),
        headers: NetworkHeaders.publicHeaders(apiKey: config.apiKey),
        body: body);
    return res;
  }

  /// Public Basic assessment result
  Future<dynamic> getPublicAssessmentCompletionStatus(Map data) async {
    var body = json.encode(data);
    Response res = await post(
        Uri.parse(config.baseUrl + ApiUrls.getPublicAssessmentCompletionStatus),
        headers: NetworkHeaders.publicHeaders(apiKey: config.apiKey),
        body: body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      var contents = jsonDecode(res.body);
      return contents['result'];
    } else {
      return jsonDecode(res.body)['params']['errmsg'];
    }
  }
}
