import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toc_module/toc/certificate/certidicate_service/certificate_service.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';

class CertificateRepository {
  Future<Uint8List?> downloadCompletionCertificate(
      {required String printUrl, String? outputType}) async {
    try {
      Response res = await CertificateService().downloadCompletionCertificate(
          printUri: printUrl, outputType: outputType);
      if (res.statusCode == 200) {
        final certificateData = res.bodyBytes;
        return certificateData;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error while downloading certificate: $e");
      return null;
    }
  }

  Future<String?> getCourseCompletionDynamicCertificate({
    required String courseId,
    required String batchId,
  }) async {
    try {
      final Response res =
          await CertificateService().getCourseCompletionDynamicCertificate(
        courseId: courseId,
        batchId: batchId,
      );

      if (res.statusCode == 200) {
        final contents = jsonDecode(res.body);
        final String? printUri = contents?['result']?['printUri'];
        return printUri;
      } else {
        debugPrint(
          'Failed to get dynamic certificate. Status: ${res.statusCode}, Body: ${res.body}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('Error in getCourseCompletionDynamicCertificate: $e');
      return null;
    }
  }

  Future<String?> getCourseCompletionCertificate({
    required String certificateId,
  }) async {
    try {
      final Response res =
          await CertificateService().getCourseCompletionCertificate(
        certificateId: certificateId,
      );

      if (res.statusCode == 200) {
        final Map<String, dynamic> data =
            jsonDecode(utf8.decode(res.bodyBytes));

        final String? printUri = data['result']?['printUri'];
        return printUri;
      } else {
        debugPrint(
          'Failed to get course certificate. Status: ${res.statusCode}, Body: ${res.body}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('Error in getCourseCompletionCertificate: $e');
      return null;
    }
  }

  Future<String?> getCertificateDownloadedPath({
    required String courseName,
    required String certificateId,
    required String batchId,
    required String courseCategory,
    required BuildContext context,
    required String courseId,
  }) async {
    try {
      final String sanitizedCourseName = _sanitizeCourseName(courseName);
      final String fileName =
          '$sanitizedCourseName-${DateTime.now().millisecondsSinceEpoch}';
      final String downloadPath = await getDownloadPath();

      await Directory(downloadPath).create(recursive: true);

      final String certificateType = CertificateType.pdf;
      final String? certificatePrintUri = await getCertificatePrintUri(
        courseCategory: courseCategory,
        batchId: batchId,
        courseId: courseId,
        certificateId: certificateId,
      );

      if (certificatePrintUri == null) {
        return null;
      }

      final Permission permission = await _determinePermission();

      final bool isPermissionGranted = await requestPermission(permission);
      if (!isPermissionGranted) return null;

      final Uint8List? certificateBytes = await downloadCompletionCertificate(
        printUrl: certificatePrintUri,
        outputType: certificateType,
      );

      final File file = File('$downloadPath/$fileName.$certificateType');
      if (certificateBytes == null) {
        return null;
      }
      await file.writeAsBytes(certificateBytes);
      return file.path;
    } catch (e) {
      debugPrint("Error while downloading certificate: $e");
      return null;
    }
  }

  String _sanitizeCourseName(String name) {
    name = name.replaceAll(RegExpressions.unicodeSpecialChar, '');
    return (name.length > 150) ? name.substring(0, 100) : name;
  }

  Future<String?> getCertificatePrintUri({
    required String courseCategory,
    required String batchId,
    required String courseId,
    required String certificateId,
  }) async {
    final bool isDynamicCategory = PrimaryCategory
        .dynamicCertProgramCategoriesList
        .contains(courseCategory.toLowerCase());

    return isDynamicCategory
        ? await getCourseCompletionDynamicCertificate(
            batchId: batchId,
            courseId: courseId,
          )
        : await getCourseCompletionCertificate(
            certificateId: certificateId,
          );
  }

  Future<Permission> _determinePermission() async {
    if (!Platform.isAndroid) return Permission.storage;

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return (androidInfo.version.sdkInt >= 33)
        ? Permission.photos
        : Permission.storage;
  }

  static Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory(APP_DOWNLOAD_FOLDER);

        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      throw "Cannot get download folder path";
    }
    return directory?.path;
  }
}
