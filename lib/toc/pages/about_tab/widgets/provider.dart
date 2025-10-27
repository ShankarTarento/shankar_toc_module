import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class CourseProvider extends StatelessWidget {
  final Course courseRead;
  CourseProvider({Key? key, required this.courseRead}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return courseRead.source != null && courseRead.source != ''
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TocLocalizations.of(context)!.mStaticProviders,
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 48.w,
                    width: 48.w,
                    margin: EdgeInsets.only(right: 16).r,
                    padding: EdgeInsets.all(9).r,
                    decoration: BoxDecoration(
                      color: TocModuleColors.appBarBackground,
                      border: Border.all(
                        color: TocModuleColors.grey16,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.all(
                        const Radius.circular(4.0).r,
                      ),
                    ),
                    child:
                        courseRead.creatorLogo != null &&
                            courseRead.creatorLogo != ''
                        ? Image.network(
                            TocHelper.convertImageUrl(courseRead.creatorLogo),
                          )
                        : Image.asset('assets/img/igot_creator_icon.png'),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // _generateInteractTelemetryData(
                        //     contentId: TelemetryIdentifier.cardContent,
                        //     clickId: courseRead.organisation != null &&
                        //             courseRead.organisation!.isNotEmpty
                        //         ? courseRead.organisation![0]
                        //         : '',
                        //     objectType: courseRead.source);
                        // Navigator.push(
                        //   context,
                        //   FadeRoute(
                        //       page: AtiCtiMicroSitesScreen(
                        //     providerName: courseRead.source,
                        //     orgId: courseRead.organisation != null &&
                        //             courseRead.organisation!.isNotEmpty
                        //         ? courseRead.organisation![0]
                        //         : '',
                        //   )),
                        // );
                      },
                      child: Text(
                        'By ' + courseRead.source!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : SizedBox();
  }

  // void _generateInteractTelemetryData(
  //     {String? contentId,
  //     String? subType,
  //     String? clickId,
  //     String? objectType}) async {
  //   var telemetryRepository = TelemetryRepository();
  //   Map eventData = telemetryRepository.getInteractTelemetryEvent(
  //       pageIdentifier: TelemetryPageIdentifier.learnPageId,
  //       contentId: contentId ?? "",
  //       subType: subType ?? "",
  //       clickId: clickId ?? "",
  //       objectType: objectType,
  //       env: TelemetryEnv.learn);
  //   await telemetryRepository.insertEvent(eventData: eventData);
  // }
}
