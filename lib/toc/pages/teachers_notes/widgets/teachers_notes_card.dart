import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/reference_node.dart';

class TeachersNotesCard extends StatefulWidget {
  final ReferenceNode referenceNode;

  const TeachersNotesCard({
    super.key,
    required this.referenceNode,
  });

  @override
  State<TeachersNotesCard> createState() => _TeachersNotesCardState();
}

class _TeachersNotesCardState extends State<TeachersNotesCard> {
  bool _isDownloading = false;

  // Download the PDF file
  Future<void> _downloadFile() async {
    try {
      Permission _permision = Permission.storage;
      Permission _videoPermission = Permission.videos;
      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          _permision = Permission.photos;
        }
      }
      if (await TocHelper.requestPermission(_permision) &&
          await TocHelper.requestPermission(_videoPermission)) {
        setState(() {
          _isDownloading = true;
        });
        var response =
            await http.get(Uri.parse(widget.referenceNode.downloadUrl!));

        if (response.statusCode == 200) {
          String path = await TocHelper.getDownloadPath();
          String fileName = widget.referenceNode.name +
              widget.referenceNode.downloadUrl!.split('/').last;
          String filePath = '${path}/$fileName';

          File file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);

          displayDialog(true, '$filePath', 'Success');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(TocLocalizations.of(context)!.mStaticSomethingWrong),
          ));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(TocLocalizations.of(context)!.mStaticSomethingWrong),
      ));
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 80.w,
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: TocModuleColors.appBarBackground,
        borderRadius: BorderRadius.circular(4).r,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.52.sw,
                    child: Text(
                      widget.referenceNode.name,
                      maxLines: 1,
                      style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: TocModuleColors.darkBlue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResourceDetailsScreenV2(
                            resourceId: widget.referenceNode.identifier,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility,
                            size: 18.sp,
                            color: TocModuleColors.greys60,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            TocLocalizations.of(context)!.mLearnView,
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: TocModuleColors.greys60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              _isDownloading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      height: 30.w,
                      child: ElevatedButton(
                        onPressed: _isDownloading ? null : _downloadFile,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: TocModuleColors.appBarBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                                color: TocModuleColors.darkBlue, width: 1),
                          ),
                        ),
                        child: Text(
                          TocLocalizations.of(context)!.mDownload,
                          style: GoogleFonts.lato(
                            fontSize: 12.sp,
                            color: TocModuleColors.darkBlue,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool?> displayDialog(
      bool isSuccess, String filePath, String message) async {
    return showModalBottomSheet(
        isScrollControlled: true,
        // useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))
              .r,
          side: BorderSide(
            color: TocModuleColors.grey08,
          ),
        ),
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20).r,
                        height: 6.w,
                        width: 0.25.sw,
                        decoration: BoxDecoration(
                          color: TocModuleColors.grey16,
                          borderRadius: BorderRadius.all(Radius.circular(16).r),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                        child: Text(
                          isSuccess
                              ? TocLocalizations.of(context)!
                                  .mStaticFileDownloadingCompleted
                              : message,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                        )),
                    filePath != ''
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 5, bottom: 10).r,
                            child: GestureDetector(
                              onTap: () => openFile(filePath),
                              child: roundedButton(
                                TocLocalizations.of(context)!.mStaticOpen,
                                TocModuleColors.darkBlue,
                                TocModuleColors.appBarBackground,
                              ),
                            ),
                          )
                        : Center(),
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15).r,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(false),
                        child: roundedButton(
                            TocLocalizations.of(context)!.mCommonClose,
                            TocModuleColors.appBarBackground,
                            TocModuleColors.darkBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = Container(
      width: 1.sw - 50.w,
      padding: EdgeInsets.all(10).r,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(const Radius.circular(4.0).r),
        border: bgColor == TocModuleColors.appBarBackground
            ? Border.all(color: TocModuleColors.grey40)
            : Border.all(color: bgColor),
      ),
      child: Text(
        buttonLabel,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
              decoration: TextDecoration.none,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
      ),
    );
    return loginBtn;
  }

  Future<void> openFile(String filePath) async {
    final result = await OpenFile.open(filePath);
    debugPrint("OpenFile result: ${result.message}");
  }
}
