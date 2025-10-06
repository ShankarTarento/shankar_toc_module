import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_constants.dart';
import '../constants/toc_constants.dart';

class TocHelper {
  static String convertImageUrl(String? url, {bool pointToProd = false}) {
    return '';
  }

  static String getInitials(String name) {
    final _whitespaceRE = RegExp(r"\s+");
    String cleanupWhitespace(String input) =>
        input.replaceAll(_whitespaceRE, " ");
    name = cleanupWhitespace(name);
    if (name.trim().isNotEmpty) {
      return name
          .trim()
          .split(' ')
          .map((l) => l[0])
          .take(2)
          .join()
          .toUpperCase();
    } else {
      return '';
    }
  }

  static Color getCompetencyAreaColor(String competencyName) {
    switch (competencyName.toLowerCase()) {
      case CompetencyAreas.behavioural:
        return TocModuleColors.orangeShade1;
      case CompetencyAreas.domain:
        return TocModuleColors.purpleShade1;
      default:
        return TocModuleColors.pinkShade1;
    }
  }

  static getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory(APP_DOWNLOAD_FOLDER);
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists())
          directory = await getExternalStorageDirectory();
      }
    } catch (err) {
      throw "Cannot get download folder path";
    }
    return directory?.path;
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

  static showSnackBarMessage(
      {required BuildContext context,
      required String text,
      int? durationInSec,
      required Color textColor,
      required Color bgColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: durationInSec ?? 2),
        content: Text(text,
            style: GoogleFonts.lato(
              color: textColor,
            )),
        backgroundColor: bgColor,
      ),
    );
  }

  ///
  ///
  ///
  ///
  ///
  static convertToPortalUrl(String s) {
    String cleaned = s.replaceAll("http://", "https://");
    return cleaned.replaceAll("", "");
  }

  static Future<void> doLaunchUrl(
      {required String url,
      LaunchMode mode = LaunchMode.platformDefault}) async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: mode);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      await launchUrl(
        Uri.parse(url),
        mode: mode,
      );
    }
  }
}
