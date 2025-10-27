import 'dart:io';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/util/page_loader.dart';
import 'package:toc_module/toc/widgets/module_item/widgets/linear_progress_indicator_widget.dart';

class TocDownloadCertificateWidget extends StatefulWidget {
  TocDownloadCertificateWidget({
    Key? key,
    required this.courseId,
    this.isPlayer = false,
    this.isExpanded = false,
    this.enrolledCourse,
  }) : super(key: key);
  final String courseId;
  final bool isPlayer, isExpanded;
  final Course? enrolledCourse;

  @override
  State<TocDownloadCertificateWidget> createState() =>
      _TocDownloadCertificateWidgetState();
}

class _TocDownloadCertificateWidgetState
    extends State<TocDownloadCertificateWidget> {
  bool isDownloadingToSave = false;
  String? certificateId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getCertificateId(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null && snapshot.data != '') {
            return TextButton(
              onPressed: () async {
                await saveAsPdf();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0).r,
                  color: widget.isExpanded
                      ? TocModuleColors.appBarBackground
                      : TocModuleColors.darkBlue,
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
                child: isDownloadingToSave
                    ? SizedBox(
                        height: 20,
                        width: 80,
                        child: PageLoader(isLightTheme: widget.isExpanded),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            TocLocalizations.of(context)!.mStaticCertificates,
                            style: GoogleFonts.lato(
                              height: 1.333.w,
                              decoration: TextDecoration.none,
                              color: widget.isExpanded
                                  ? TocModuleColors.darkBlue
                                  : TocModuleColors.appBarBackground,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.25,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_downward,
                            size: 16.sp,
                            color: widget.isExpanded
                                ? TocModuleColors.darkBlue
                                : TocModuleColors.appBarBackground,
                          ),
                        ],
                      ),
              ),
            );
          } else {
            return LinearProgressIndicatorWidget(
              value: 1,
              isExpnaded: widget.isExpanded,
              isCourse: true,
            );
          }
        } else {
          return Center();
        }
      },
    );
  }

  Future<bool?> displayDialog(
    bool isSuccess,
    String filePath,
    String message,
  ) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      // useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ).r,
        side: BorderSide(color: TocModuleColors.grey08),
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
                      ? TocLocalizations.of(
                          context,
                        )!.mStaticFileDownloadingCompleted
                      : message,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.none,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                ),
              ),
              filePath != ''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10).r,
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
                    TocModuleColors.customBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future saveAsPdf() async {
    String cname = widget.enrolledCourse!.name.replaceAll(
      RegExpressions.specialChar,
      '',
    );
    String fileName =
        '$cname-' + DateTime.now().millisecondsSinceEpoch.toString();

    String path = await TocHelper.getDownloadPath();
    await Directory('$path').create(recursive: true);

    try {
      Permission _permision = Permission.storage;
      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          _permision = Permission.photos;
        }
      }

      if (await TocHelper.requestPermission(_permision)) {
        setState(() {
          isDownloadingToSave = true;
        });

        final isInDynamicCertProgramCategoriesList = PrimaryCategory
            .dynamicCertProgramCategoriesList
            .contains(
              (widget.enrolledCourse?.courseCategory ?? '').toLowerCase(),
            );

        var base64CertificateImage;

        if (isInDynamicCertProgramCategoriesList) {
          base64CertificateImage = await LearnService()
              .getCourseCompletionDynamicCertificate(
                widget.enrolledCourse?.contentId ?? '',
                widget.enrolledCourse?.batchId ?? '',
              );
        } else {
          if ((certificateId ?? '').isNotEmpty) {
            base64CertificateImage = await LearnService()
                .getCourseCompletionCertificate(certificateId!);
          }
        }

        if (base64CertificateImage != null) {
          final certificate = await LearnService()
              .downloadCompletionCertificate(base64CertificateImage);

          await File('$path/$fileName.pdf').writeAsBytes(certificate);

          setState(() {
            isDownloadingToSave = false;
          });
          displayDialog(true, '$path/$fileName.pdf', 'Success');
        } else {
          TocHelper.showSnackBarMessage(
            textColor: Colors.white,
            context: context,
            text:
                "${TocLocalizations.of(context)?.mStaticCertificateDownloadError}",
            bgColor: TocModuleColors.negativeLight,
          );
        }
      } else {
        return false;
      }
    } catch (e) {
    } finally {
      setState(() {
        isDownloadingToSave = false;
      });
    }
  }

  Future<String> getCertificateId() async {
    if (widget.enrolledCourse != null) {
      List issuedCertificate = widget.enrolledCourse!.issuedCertificates ?? [];
      if (mounted) {
        if (widget.enrolledCourse!.batchId != null) {
          certificateId = issuedCertificate.length > 0
              ? (issuedCertificate.length > 1
                    ? issuedCertificate[1]['identifier']
                    : issuedCertificate[0]['identifier'])
              : null;
        }
      }
    }
    return certificateId ?? '';
  }

  Future<dynamic> openFile(filePath) async {
    await OpenFile.open(filePath);
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
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
          decoration: TextDecoration.none,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
    );
    return loginBtn;
  }
}
