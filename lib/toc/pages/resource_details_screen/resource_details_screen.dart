import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/model/resource_details.dart';
import 'package:toc_module/toc/pages/resource_details_screen/widgets/resource_details_header.dart';
import 'package:toc_module/toc/pages/resource_details_screen/widgets/resource_details_skeleton.dart';
import 'package:toc_module/toc/pages/resource_details_screen/widgets/resource_players.dart';
import 'package:toc_module/toc/pages/resource_details_screen/widgets/sector_subsector_view.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';
import 'package:toc_module/toc/widgets/course_sharing_page/course_sharing_page.dart';

class ResourceDetailsScreen extends StatefulWidget {
  final String resourceId;
  final int? startAt;

  const ResourceDetailsScreen({
    super.key,
    this.startAt,
    required this.resourceId,
  });

  @override
  State<ResourceDetailsScreen> createState() => _ResourceDetailsScreenState();
}

class _ResourceDetailsScreenState extends State<ResourceDetailsScreen> {
  @override
  void initState() {
    getResourceDetails();
    super.initState();
  }

  void receiveShareResponse(String data) {
    _showSuccessDialogBox();
  }

  _showSuccessDialogBox() => {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext contxt) => FutureBuilder(
                future:
                    Future.delayed(Duration(seconds: 3)).then((value) => true),
                builder: (BuildContext futureContext, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    Navigator.of(contxt).pop();
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AlertDialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 16).r,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12).r),
                          actionsPadding: EdgeInsets.zero,
                          actions: [
                            Container(
                              padding: EdgeInsets.all(16).r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12).r,
                                  color: TocModuleColors.positiveLight),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                        child: Text(
                                      TocLocalizations.of(context)!
                                          .mContentSharePageSuccessMessage,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.lato(
                                        color: TocModuleColors.appBarBackground,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        letterSpacing: 0.25,
                                        height: 1.3.w,
                                      ),
                                    )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 4, 4, 0)
                                            .r,
                                    child: Icon(
                                      Icons.check,
                                      color: TocModuleColors.appBarBackground,
                                      size: 24.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  );
                }))
      };

  late Future<ResourceDetails?> resourceDetailsFuture;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResourceDetails?>(
        future: resourceDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return DetailsScreenSkeleton();
          }
          if (snapshot.data != null) {
            ResourceDetails resourceDetails = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                titleSpacing: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24.sp,
                    color: ModuleColors.greys60,
                    weight: 700,
                  ),
                ),
                title: Row(children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: false,
                        enableDrag: false,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                              child: CourseSharingPage(
                            courseId: resourceDetails.identifier!,
                            courseName: resourceDetails.name!,
                            coursePosterImageUrl: resourceDetails.posterImage!,
                            courseProvider: resourceDetails.source!,
                            primaryCategory: resourceDetails.primaryCategory!,
                            callback: receiveShareResponse,
                          ));
                        },
                      );
                    },
                    icon: Icon(
                      Icons.share,
                      size: 24.sp,
                      color: ModuleColors.greys60,
                      weight: 700,
                    ),
                  )
                ]),
              ),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResourceDetailsScreenHeader(
                          resourceDetails: resourceDetails),
                      Padding(
                        padding: const EdgeInsets.all(16).r,
                        child: ResourcePlayer(
                          resourceDetails: resourceDetails,
                          startAt: widget.startAt,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                                left: 16.0, right: 16, bottom: 16)
                            .r,
                        child: Text(
                          resourceDetails.description ?? '',
                          style: GoogleFonts.lato(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SectorSubsectorView(
                        sectorDetails: resourceDetails.sectors ?? [],
                      ),
                      SizedBox(height: 150.w),
                    ]),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                SizedBox(height: 150.w),
                Center(
                  child: Text(
                    TocLocalizations.of(context)!.mNoResourcesFound,
                    style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  getResourceDetails() async {
    resourceDetailsFuture =
        TocRepository().getResourceDetails(courseId: widget.resourceId);
  }
}
