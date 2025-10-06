import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/toc/constants/color_constants.dart';

class CertificateDefaultView extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final bool isDownloadingToSave;
  final Function() downloadClicked;
  const CertificateDefaultView(
      {super.key,
      required this.imageHeight,
      required this.imageWidth,
      required this.isDownloadingToSave,
      required this.downloadClicked});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: imageHeight,
          width: imageWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/img/default_certificate.png',
                  ),
                  fit: BoxFit.fill,
                  opacity: 0.3)),
        ),
        isDownloadingToSave
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.w,
                ),
              )
            : InkWell(
                onTap: downloadClicked,
                child: Center(
                  child: CircleAvatar(
                      backgroundColor: TocModuleColors.black,
                      child: Icon(
                        Icons.download,
                        color: TocModuleColors.appBarBackground,
                      )),
                ),
              )
      ],
    );
  }
}
