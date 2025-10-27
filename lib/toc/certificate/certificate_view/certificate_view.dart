import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/certificate/certificate_repository/certificate_repository.dart';
import 'package:toc_module/toc/certificate/certificate_view/widgets/certificate_bottom_sheet.dart';
import 'package:toc_module/toc/certificate/certificate_view/widgets/certificate_clipper.dart';
import 'package:toc_module/toc/certificate/certificate_view/widgets/certificate_competency_subtheme_view,dart';
import 'package:toc_module/toc/certificate/certificate_view/widgets/certificate_default_view.dart';
import 'package:toc_module/toc/certificate/certificate_view/widgets/certificate_not_generated_card.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/helper/date_time_helper.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/competency_passbook.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart' as Webview;

class CertificateView extends StatefulWidget {
  final Course courseInfo;
  final List<CompetencyPassbook>? competencies;
  const CertificateView({Key? key, required this.courseInfo, this.competencies})
    : super(key: key);

  @override
  State<CertificateView> createState() => _CourseCompleteCertificateState();
}

class _CourseCompleteCertificateState extends State<CertificateView> {
  ValueNotifier<bool> isDownloading = ValueNotifier<bool>(false);
  late WebViewController _webViewController;

  bool isDownloaded = false;
  String? certificatePrintUri;

  @override
  void initState() {
    _webViewController = Webview.WebViewController()
      ..setJavaScriptMode(Webview.JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        Webview.NavigationDelegate(
          onNavigationRequest: (Webview.NavigationRequest request) {
            return Webview.NavigationDecision.navigate;
          },
          onPageFinished: (String url) async {
            double imageWidth = MediaQuery.of(context).size.width * 2.4;
            _webViewController.runJavaScript('''
            document.querySelector("svg").setAttribute("width", "$imageWidth");
            document.querySelector("svg").setAttribute("height", "500px");
          ''');
          },
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 2.4;
    final double imageHeight = 120;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 16).r,
          width: 1.sw,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/certificate_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 66.0, bottom: 30).w,
                  child: Text(
                    TocLocalizations.of(context)!.mStaticCertificateEarned,
                    style: GoogleFonts.lato(
                      color: TocModuleColors.darkBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: TocBottomCornerClipper(),
                  child: Container(
                    margin: const EdgeInsets.only(left: 35.0, right: 35).r,
                    padding: EdgeInsets.only(
                      top: 1,
                      left: 1,
                      right: 1,
                      bottom: 0,
                    ).r,
                    decoration: BoxDecoration(
                      color: TocModuleColors.grey16,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ).r,
                    ),
                    child: ClipPath(
                      clipper: TocBottomCornerClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9),
                          ).r,
                          color: TocModuleColors.appBarBackground,
                        ),
                        child: ClipPath(
                          clipper: TocBottomCornerClipper(),
                          child: Container(
                            margin: EdgeInsets.only(left: 6, right: 6).r,
                            padding: EdgeInsets.all(16).r,
                            decoration: DottedDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                              ).r,
                              strokeWidth: 2.w,
                              shape: Shape.line,
                              linePosition: LinePosition.bottom,
                              color: TocModuleColors.grey16,
                            ),
                            child: Column(
                              children: [
                                certificateTopSection(),
                                SizedBox(height: 10.w),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 2.4,
                                  height: imageHeight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                      widget.courseInfo.issuedCertificates !=
                                              null &&
                                          widget
                                              .courseInfo
                                              .issuedCertificates!
                                              .isNotEmpty
                                      ? isDownloaded
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: showCertInWebview(
                                                  context,
                                                  imageWidth,
                                                ),
                                              )
                                            : ValueListenableBuilder<bool>(
                                                valueListenable: isDownloading,
                                                builder:
                                                    (context, snapshot, child) {
                                                      return CertificateDefaultView(
                                                        downloadClicked: () {
                                                          downloadClicked();
                                                        },
                                                        imageHeight:
                                                            imageHeight,
                                                        imageWidth: imageWidth,
                                                        isDownloadingToSave:
                                                            snapshot,
                                                      );
                                                    },
                                              )
                                      : CertificateNotGeneratedCard(
                                          imageHeight: imageHeight,
                                          imageWidth: imageWidth,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                widget.competencies != null && widget.competencies!.isNotEmpty
                    ? competencySection()
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget certificateTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 1.sw / 1.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.courseInfo.name,
                maxLines: 2,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
              widget.courseInfo.completedOn != null
                  ? SizedBox(height: 4.w)
                  : SizedBox.shrink(),
              widget.courseInfo.completedOn != null
                  ? Text(
                      '${TocLocalizations.of(context)!.mStaticYouCompletedThisCourseOn(widget.courseInfo.courseCategory)} ${DateTimeHelper.getDateTimeInFormat("${DateTime.fromMillisecondsSinceEpoch(widget.courseInfo.completedOn!)}", desiredDateFormat: IntentType.dateFormat2)}',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        isDownloaded
            ? ValueListenableBuilder(
                valueListenable: isDownloading,
                builder: (context, snapshot, child) => snapshot
                    ? SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : Visibility(
                        visible: isDownloaded,
                        child: IconButton(
                          padding: EdgeInsets.only(right: 0),
                          alignment: Alignment.centerRight,
                          onPressed: downloadAsPdf,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: TocModuleColors.darkBlue,
                            size: 24.sp,
                          ),
                        ),
                      ),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  Widget competencySection() {
    return ClipPath(
      clipper: TocTopCornerClipper(),
      child: Container(
        margin: const EdgeInsets.only(left: 35.0, right: 35).r,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(9),
            bottomRight: Radius.circular(9),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ).r,
          color: TocModuleColors.grey16,
        ),
        padding: EdgeInsets.only(top: 0, left: 1, right: 1, bottom: 1).r,
        child: ClipPath(
          clipper: TocTopCornerClipper(),
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.all(12).r,
            decoration: BoxDecoration(
              color: TocModuleColors.appBarBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ).r,
            ),
            child: CertificateCompetencySubtheme(
              competencySubthemes: widget.competencies!,
            ),
          ),
        ),
      ),
    );
  }

  Widget showCertInWebview(BuildContext context, double imageWidth) {
    String resizeCertJS =
        'document.querySelector("svg").setAttribute("width", "$imageWidth");'
        'document.querySelector("svg").setAttribute("height", "500px");';
    return Webview.WebViewWidget(
      controller: Webview.WebViewController()
        ..setJavaScriptMode(Webview.JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          Webview.NavigationDelegate(
            onNavigationRequest: (Webview.NavigationRequest request) {
              return Webview.NavigationDecision.navigate;
            },
            onPageFinished: (String url) async {
              _webViewController.runJavaScript(resizeCertJS);
            },
          ),
        )
        ..loadRequest(Uri.parse(certificatePrintUri ?? '')),
    );
  }

  void downloadClicked() async {
    if (isDownloading.value) return;
    isDownloading.value = true;
    try {
      certificatePrintUri = await CertificateRepository()
          .getCertificatePrintUri(
            batchId:
                widget.courseInfo.batches != null &&
                    widget.courseInfo.batches!.isNotEmpty &&
                    widget.courseInfo.batches!.first.batchId != ""
                ? widget.courseInfo.batches!.first.batchId
                : "",
            certificateId:
                widget.courseInfo.issuedCertificates != null &&
                    widget.courseInfo.issuedCertificates!.isNotEmpty
                ? widget.courseInfo.issuedCertificates!.first['identifier']
                : "",
            courseCategory: widget.courseInfo.courseCategory,
            courseId: widget.courseInfo.id,
          );
    } catch (e) {
      TocHelper.showSnackBarMessage(
        context: context,
        text: TocLocalizations.of(context)!.mStaticSomethingWrongTryLater,
        textColor: Colors.white,
        bgColor: Colors.red,
      );
      debugPrint('Error saving certificate as PDF: $e');
    } finally {
      isDownloading.value = false;
      if (certificatePrintUri != null) {
        isDownloaded = true;
        downloadAsPdf();
      } else {
        TocHelper.showSnackBarMessage(
          context: context,
          text: TocLocalizations.of(context)!.mStaticSomethingWrongTryLater,
          textColor: Colors.white,
          bgColor: Colors.red,
        );
      }
      setState(() {});
    }
  }

  Future downloadAsPdf() async {
    if (isDownloading.value) return;
    isDownloading.value = true;
    try {
      String? downloadedPath = await CertificateRepository()
          .getCertificateDownloadedPath(
            batchId:
                widget.courseInfo.batches != null &&
                    widget.courseInfo.batches!.isNotEmpty
                ? widget.courseInfo.batches!.first.batchId
                : "",
            certificateId:
                widget.courseInfo.issuedCertificates != null &&
                    widget.courseInfo.issuedCertificates!.isNotEmpty
                ? widget.courseInfo.issuedCertificates!.first['identifier']
                : "",
            courseCategory: widget.courseInfo.courseCategory,
            courseId: widget.courseInfo.id,
            courseName: widget.courseInfo.name,
            context: context,
          );
      if (downloadedPath != null) {
        displayDialog(filePath: downloadedPath);
      } else {
        TocHelper.showSnackBarMessage(
          context: context,
          text: TocLocalizations.of(context)!.mStaticSomethingWrongTryLater,
          textColor: Colors.white,
          bgColor: Colors.red,
        );
      }
    } catch (e) {
      TocHelper.showSnackBarMessage(
        context: context,
        text: TocLocalizations.of(context)!.mStaticSomethingWrongTryLater,
        textColor: Colors.white,
        bgColor: Colors.red,
      );
      debugPrint("Error downloading certificate as PDF: $e");
    } finally {
      isDownloading.value = false;
    }
  }

  Future displayDialog({required String filePath}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ).r,
        side: BorderSide(color: TocModuleColors.grey08),
      ),
      context: context,
      builder: (context) => CertificateBottomSheet(filePath: filePath),
    );
  }
}
