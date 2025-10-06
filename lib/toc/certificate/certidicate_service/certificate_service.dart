import 'dart:convert';
import 'package:http/http.dart';
import 'package:toc_module/toc/constants/api_urls.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/network_headers.dart';
import 'package:toc_module/toc/model/toc_config_model.dart';
import 'package:toc_module/toc/services/toc_module_service.dart';

class CertificateService {
  TocConfigModel config = TocModuleService.config;

  String get getCourseCompletionCertificateForMobile =>
      config.baseUrl + ApiUrls.getCourseCompletionCertificateForMobile;
  String get getCourseCompletionDynamicCertificateUrl =>
      config.baseUrl + ApiUrls.getCourseCompletionDynamicCertificate;
  String get getCourseCompletionCertificateUrl =>
      config.baseUrl + ApiUrls.getCourseCompletionCertificate;

  ///
  ///
  ///
  Future<Response> downloadCompletionCertificate({
    String? outputType,
    required String printUri,
  }) async {
    Map data = {
      "printUri": printUri,
      "inputFormat": "svg",
      "outputFormat": outputType ?? CertificateType.pdf
    };

    var body = json.encode(data);
    Response certRes =
        await post(Uri.parse(getCourseCompletionCertificateForMobile),
            headers: {
              'Content-Type': 'application/json',
            },
            body: body);

    return certRes;
  }

  Future<Response> getCourseCompletionDynamicCertificate(
      {required String courseId, required String batchId}) async {
    String? wid = config.wid;
    Map data = {
      "request": {
        "userId": wid,
        "courseId": courseId,
        "batchId": batchId,
      }
    };

    var body = json.encode(data);

    Response res =
        await post(Uri.parse(getCourseCompletionDynamicCertificateUrl),
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

  Future<dynamic> getCourseCompletionCertificate(
      {required String certificateId}) async {
    Response res = await get(
      Uri.parse(getCourseCompletionCertificateUrl + certificateId),
      headers: {'Authorization': 'bearer ${config.apiKey}'},
    );

    return res;
  }
}
