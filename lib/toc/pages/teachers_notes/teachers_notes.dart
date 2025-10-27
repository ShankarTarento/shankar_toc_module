import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/reference_node.dart';
import 'package:toc_module/toc/pages/teachers_notes/widgets/teachers_notes_card.dart';

class TeachersNotes extends StatefulWidget {
  final List<ReferenceNode> referenceNodes;
  const TeachersNotes({super.key, required this.referenceNodes});

  @override
  State<TeachersNotes> createState() => _TeachersNotesState();
}

class _TeachersNotesState extends State<TeachersNotes> {
  bool _isDownloading = false;
  List<String> downloadUrl = [];

  @override
  void initState() {
    downloadUrl = widget.referenceNodes
        .map((e) => e.downloadUrl ?? '')
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16).r,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 0.55.sw,
                  child: Text(
                    TocLocalizations.of(context)!.mTeachersNotesDescription,
                    style: GoogleFonts.lato(
                      fontSize: 14.sp,
                      color: TocModuleColors.greys60,
                    ),
                  ),
                ),
                Spacer(),
                _isDownloading
                    ? CircularProgressIndicator()
                    : TextButton(
                        onPressed: () {
                          _downloadFiles(downloadUrl);
                        },
                        child: SizedBox(
                          width: 90.w,
                          child: Text(
                            TocLocalizations.of(context)!.mDownloadAll,
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: TocModuleColors.darkBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 20.w),
            ListView.separated(
              itemCount: widget.referenceNodes.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TeachersNotesCard(
                  referenceNode: widget.referenceNodes[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8.w);
              },
            ),
            SizedBox(height: 100.w),
          ],
        ),
      ),
    );
  }

  Future<void> _downloadFiles(List<String> urls) async {
    try {
      setState(() {
        _isDownloading = true;
      });
      Permission _permission = Permission.storage;

      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          _permission = Permission.photos;
        }
      }

      if (await TocHelper.requestPermission(_permission)) {
        for (String url in urls) {
          var response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            String path = await TocHelper.getDownloadPath();
            String fileName = url.split('/').last;
            String filePath = '${path}/$fileName';

            File file = File(filePath);
            await file.writeAsBytes(response.bodyBytes);
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              TocLocalizations.of(context)!.mAllFilesDownloadedSuccessfully,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(TocLocalizations.of(context)!.mStaticSomethingWrong),
        ),
      );
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }
}
