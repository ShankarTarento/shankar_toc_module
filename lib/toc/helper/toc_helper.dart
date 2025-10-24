import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/toc/model/content_state_model.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/navigation_model.dart';
import 'package:toc_module/toc/model/progress_model.dart';
import 'package:toc_module/toc/repository/toc_repository.dart';
import 'package:toc_module/toc/services/toc_module_service.dart';
import 'package:toc_module/toc/view_model/toc_player_view_model.dart';
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

  static Future<NavigationModel?> getResourceInfo(
      {required BuildContext context,
      required String resourceId,
      required bool isFeatured,
      required NavigationModel resourceNavigateItems}) async {
    final courseInfo = {"": ""};
    // await Provider.of<TocRepository>(context,
    //         listen: false)
    //     .getCourseData(resourceId, isFeatured: isFeatured, isResource: true);

    if (courseInfo != null) {
      NavigationModel resource = NavigationModel.fromJson(courseInfo,
          index: 0, language: resourceNavigateItems.language);
      resource = TocHelper.compareAndUpdate(
          resourseFromHierarchy: resourceNavigateItems, resource: resource);
      return resource;
    }
    return null;
  }

  static NavigationModel compareAndUpdate(
      {required NavigationModel resourseFromHierarchy,
      required NavigationModel resource}) {
    resource.parentBatchId = resourseFromHierarchy.parentBatchId;
    resource.parentCourseId = resourseFromHierarchy.parentCourseId;
    if (resource.duration == null || resource.duration == '0') {
      resource.duration = resourseFromHierarchy.duration;
    }
    resource.moduleDuration = resourseFromHierarchy.moduleDuration;
    resource.courseDuration = resourseFromHierarchy.courseDuration;
    if (double.parse(resource.currentProgress) <
        double.parse(resourseFromHierarchy.currentProgress != ''
            ? resourseFromHierarchy.currentProgress
            : '0')) {
      resource.currentProgress = resourseFromHierarchy.currentProgress;
    }
    if (resource.completionPercentage <
        resourseFromHierarchy.completionPercentage) {
      resource.completionPercentage =
          resourseFromHierarchy.completionPercentage;
    }
    if (resource.status < resourseFromHierarchy.status) {
      resource.status = resourseFromHierarchy.status;
    }
    return resource;
  }

  static capitalize(String s) {
    if (s.trim().isNotEmpty && (s[0] != '')) {
      return s[0].toUpperCase() + s.substring(1).toLowerCase();
    } else
      return s;
  }

  static String generateCdnUri(String? artifactUri) {
    if (artifactUri == null) return '';
    try {
      var chunk = artifactUri.split('/');
      String host = Env.cdnHost;
      String bucket = Env.cdnBucket;
      var newChunk = host.split('/');
      var newLink = [];
      for (var i = 0; i < chunk.length; i += 1) {
        if (i == 2 || i == 0) {
          newLink.add(newChunk[i]);
        } else if (i == 3) {
          newLink.add(bucket.substring(1));
        } else {
          newLink.add(chunk[i]);
        }
      }
      String newUrl = newLink.join('/');
      return newUrl;
    } catch (e) {
      return artifactUri;
    }
  }

  static capitalizeFirstLetter(String s) {
    if (s.trim().isNotEmpty && (s[0] != '')) {
      return s[0].toUpperCase() + s.substring(1);
    } else
      return s;
  }

  static String decodeHtmlEntities(String? htmlString) {
    if (htmlString == null || htmlString == '') {
      return '';
    } else {
      return htmlString
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&quot;', '"')
          .replaceAll('&apos;', "'")
          .replaceAll('&amp;', '&')
          .replaceAll('&nbsp;', ' ');
    }
  }

  static dynamic handleNumber(dynamic number) {
    if (number is double && number == number.toInt()) {
      return number.toInt();
    }
    return number;
  }

  static String capitalizeFirstCharacter(String word) {
    if (word.isEmpty) return word;
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  static bool isHtml(String text) {
    return RegExpressions.htmlValidator.hasMatch(text);
  }

  bool checkInviteOnlyProgramIsActive(
      Course courseDetails, Course? enrolledCourse) {
    if (courseDetails.batches != null &&
        courseDetails.batches!.isNotEmpty &&
        courseDetails.batches![0].enrollmentType == "invite-only") {
      DateTime today = DateTime.now();
      if (enrolledCourse != null) {
        if (DateTime.parse(enrolledCourse.batch!.startDate)
            .isAfter(DateTime(today.year, today.month, today.day))) {
          return false;
        } else if ((DateTime.parse(enrolledCourse.batch!.startDate)
                    .isBefore(DateTime(today.year, today.month, today.day)) ||
                DateTime.parse(enrolledCourse.batch!.startDate)
                    .isAtSameMomentAs(
                        DateTime(today.year, today.month, today.day))) &&
            (DateTime.parse(enrolledCourse.batch!.endDate)
                    .isAfter(DateTime(today.year, today.month, today.day)) ||
                DateTime.parse(enrolledCourse.batch!.endDate).isAtSameMomentAs(
                    DateTime(today.year, today.month, today.day)))) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else if (courseDetails.batches != null &&
        courseDetails.batches!.isNotEmpty &&
        courseDetails.batches![0].enrollmentType == 'open' &&
        enrolledCourse != null) {
      return true;
    } else {
      return false;
    }
  }

  static bool isProgramLive(enrolledCourse) {
    var batchStartDate =
        DateTime.parse(enrolledCourse.raw['batch']['startDate']).toLocal();
    var batchEndDate = enrolledCourse.raw['batch']['endDate'] != null
        ? DateTime.parse(enrolledCourse.raw['batch']['endDate']).toLocal()
        : null;

    var now = DateTime.now();

    bool isLive = (batchStartDate.isBefore(now) ||
            batchStartDate
                .isAtSameMomentAs(DateTime(now.year, now.month, now.day))) &&
        (batchEndDate == null ||
            batchEndDate.isAfter(now) ||
            batchEndDate
                .isAtSameMomentAs(DateTime(now.year, now.month, now.day)));

    return isLive;
  }

  static String getMimeTypeIcon(String? mimeType) {
    switch (mimeType) {
      case EMimeTypes.mp4:
      case EMimeTypes.m3u8:
        return 'assets/img/icons-av-play.svg';
      case EMimeTypes.mp3:
        return 'assets/img/audio.svg';
      case EMimeTypes.externalLink:
      case EMimeTypes.youtubeLink:
        return 'assets/img/link.svg';
      case EMimeTypes.pdf:
        return 'assets/img/icons-file-types-pdf-alternate.svg';
      case EMimeTypes.assessment:
      case EMimeTypes.newAssessment:
        return 'assets/img/assessment_icon.svg';
      default:
        return 'assets/img/resource.svg';
    }
  }

  static DateTime trimDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static upgradeGoogleAPI(String uri) {
    String updatedUri = uri.replaceFirst(
        'https://storage.googleapis.com/igotprod',
        '${TocModuleService.config.baseUrl}${Env.cdnBucket}');
    return updatedUri;
  }

  static upgradeToHttps(String uri, {bool replaceFirst = false}) {
    String secureUri = replaceFirst
        ? uri.replaceFirst("http://", "https://")
        : uri.replaceAll("http://", "https://");
    return secureUri;
  }

  static double getCourseOverallProgress(
      double totalProgress, List<NavigationModel> resourceNavigateItems) {
    resourceNavigateItems.forEach((element) {
      if (element is! List) {
        if (element.status == 2) {
          totalProgress += 1;
        } else {
          totalProgress +=
              double.parse((element.completionPercentage).toString());
        }
      }
    });
    return totalProgress;
  }

  bool isResourceLocked(
      {required String courseCategory,
      required String contextLockingType,
      required int compatibilityLevel}) {
    return (TocConstants.contextLockCategories.contains(courseCategory) &&
        contextLockingType == EContextLockingType.courseAssessmentOnly &&
        compatibilityLevel >=
            ContextLockingCompatibility.CuratedPgmFinalAssessmentLock);
  }

  static List<NavigationModel> updateLock(
      List<NavigationModel> resourceNavigateItems, String id) {
    NavigationModel? result = resourceNavigateItems
        .where((resource) =>
            resource.parentCourseId != id &&
            (resource.status != 2 && resource.completionPercentage != 1))
        .firstOrNull;
    for (NavigationModel resource in resourceNavigateItems) {
      if (resource.mimeType == EMimeTypes.newAssessment &&
          resource.parentCourseId == id) {
        if (result != null) {
          resource.isLocked = true;
        } else {
          resource.isLocked = false;
        }
      }
    }
    return resourceNavigateItems;
  }

  static List<String> getContentIdsFromCourse(
      List<CourseHierarchyModelChild?>? courseHierarchyList) {
    if (courseHierarchyList == null) return [];
    return courseHierarchyList
        .whereType<CourseHierarchyModelChild>()
        .map((child) => child.identifier)
        .whereType<String>()
        .toList();
  }

  static Future<dynamic> generatePreEnrollNavigationItem(
      {required CourseHierarchyModel courseHierarchyData,
      required Course course,
      required BuildContext context,
      bool isPlayer = false,
      String? courseCategory,
      bool isFeatured = false}) async {
    int index;
    int k = 0;
    List tempNavItems = [];

    List<NavigationModel> resourceNavigateItems = [];
    bool isCompleted = false;
    List<ContentStateModel> parentContentList = [];

    if (!isFeatured) {
      if ((course.preEnrolmentResources?.children ?? []).isNotEmpty) {
        final contentIds = TocHelper.getContentIdsFromCourse(
            course.preEnrolmentResources?.children ?? []);
        parentContentList.clear();
        parentContentList =
            await TocRepository().readPreRequisiteContentProgress(contentIds);
        getOverallProgress(parentContentList, course, context);
      }
    }
    if (courseHierarchyData.children != null) {
      for (index = 0; index < courseHierarchyData.children!.length; index++) {
        String? parentCourseId = null;
        List<ContentStateModel> contentList = [];

        if (course.cumulativeTracking && !isFeatured) {
          contentList = parentContentList;
        }

        if ((courseHierarchyData.children![index].contentType == 'Collection' ||
            courseHierarchyData.children![index].contentType == 'CourseUnit')) {
          List<NavigationModel> temp = [];
          Map<String, dynamic> childObject =
              courseHierarchyData.children![index].toJson();

          if (courseHierarchyData.children![index].children != null) {
            for (int i = 0;
                i < courseHierarchyData.children![index].children!.length;
                i++) {
              ProgressModel progress = getProgress(isCompleted,
                  childObject['children']![i]['identifier'], contentList);
              NavigationModel content = NavigationModel.fromJson(childObject,
                  index: k++,
                  childIndex: i,
                  hasChildren: true,
                  parentBatchId: course.batches?[0].batchId ?? '',
                  parentCourseId: parentCourseId,
                  progress: progress,
                  isMandatory:
                      courseHierarchyData.children![index].isMandatory);
              temp.add(content);
              resourceNavigateItems.add(content);
            }
          } else {
            ProgressModel progress = getProgress(
                isCompleted, childObject['identifier'], contentList);
            NavigationModel content = NavigationModel.fromJson(childObject,
                index: k++,
                progress: progress,
                isMandatory: courseHierarchyData.children![index].isMandatory);
            temp.add(content);
            resourceNavigateItems.add(content);
          }
          tempNavItems.add(temp);
        } else if (courseHierarchyData.children![index].contentType ==
            'Course') {
          List courseList = [];
          for (var i = 0;
              i < courseHierarchyData.children![index].children!.length;
              i++) {
            List<NavigationModel> temp = [];
            if (courseHierarchyData.children![index].children![i].contentType ==
                    'Collection' ||
                courseHierarchyData.children![index].children![i].contentType ==
                    'CourseUnit') {
              Map<String, dynamic> childObject =
                  courseHierarchyData.children![index].children![i].toJson();

              for (var j = 0;
                  j <
                      courseHierarchyData
                          .children![index].children![i].children!.length;
                  j++) {
                ProgressModel progress = getProgress(isCompleted,
                    childObject['children']![j]['identifier'], contentList);
                NavigationModel content = NavigationModel.fromJson(childObject,
                    index: k++,
                    hasChildren: true,
                    parentBatchId: course.batches?[0].batchId ?? '',
                    parentCourseId: parentCourseId,
                    courseName: courseHierarchyData.children![index].name,
                    childIndex: j,
                    progress: progress,
                    isMandatory:
                        courseHierarchyData.children![index].isMandatory);
                temp.add(content);
                resourceNavigateItems.add(content);
              }
              courseList.add(temp);
            } else {
              Map<String, dynamic> childObject =
                  courseHierarchyData.children![index].toJson();
              ProgressModel progress = getProgress(isCompleted,
                  childObject['children']![i]['identifier'], contentList);
              NavigationModel content = NavigationModel.fromJson(childObject,
                  index: k++,
                  parentBatchId: course.batches?[0].batchId ?? '',
                  parentCourseId: parentCourseId,
                  isCourse: true,
                  hasChildren: true,
                  courseName: courseHierarchyData.children![index].name,
                  childIndex: i,
                  progress: progress,
                  isMandatory:
                      courseHierarchyData.children![index].isMandatory);
              courseList.add(content);
              resourceNavigateItems.add(content);
            }
          }
          tempNavItems.add(courseList);
        } else {
          Map<String, dynamic> childObject =
              courseHierarchyData.children![index].toJson();
          ProgressModel progress =
              getProgress(isCompleted, childObject['identifier'], contentList);
          NavigationModel content = NavigationModel.fromJson(childObject,
              index: k++,
              parentBatchId: course.batches?[0].batchId ?? '',
              parentCourseId: parentCourseId,
              isCourse: true,
              progress: progress,
              isMandatory: courseHierarchyData.children![index].isMandatory);
          tempNavItems.add(content);
          resourceNavigateItems.add(content);
        }
      }
      return {
        'navItems': tempNavItems,
        'resourceNavItems': resourceNavigateItems
      };
    }
  }

  static ProgressModel getProgress(
      isCompleted, identifier, List<ContentStateModel> contentList) {
    if (isCompleted) {
      return ProgressModel.fromJson({'completionPercentage': 1.0, 'status': 2});
    }
    if (contentList.isNotEmpty) {
      for (int i = 0; i < contentList.length; i++) {
        if (contentList[i].contentId == identifier) {
          int spentTime = contentList[i].progressdetails != null &&
                  contentList[i].progressdetails!['spentTime'] != null
              ? contentList[i].progressdetails!['spentTime']
              : 0;
          String currentProgress = contentList[i].progressdetails != null &&
                  contentList[i].progressdetails!['current'] != null
              ? (contentList[i].progressdetails!['current'].length > 0)
                  ? contentList[i].progressdetails!['current'].last.toString()
                  : '0'
              : '0';
          return ProgressModel.fromJson({
            'completionPercentage': contentList[i].completionPercentage / 100,
            'spentTime': spentTime,
            'currentProgress': currentProgress,
            'status': contentList[i].status
          });
        }
      }
    }
    return ProgressModel.fromJson({'completionPercentage': 0.0});
  }

  static int? getTotalNumberOfRatings(dynamic courseRating) {
    try {
      if (courseRating is! Map) return null;
      var totalNumberOfRatings = courseRating['total_number_of_ratings'];
      if (totalNumberOfRatings == null) {
        return null;
      }
      return totalNumberOfRatings.ceil();
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> generateNavigationItem(
      {required CourseHierarchyModel courseHierarchyData,
      required Course course,
      required BuildContext context,
      required List<Course> enrollmentList,
      Course? enrolledCourse,
      bool isPlayer = false,
      String? courseCategory,
      bool isFeatured = false}) async {
    int index;
    int k = 0;
    List tempNavItems = [];

    List<NavigationModel> resourceNavigateItems = [];
    bool isCompleted = false;
    List<ContentStateModel> parentContentList = [];
    double? currentLangProgress;
    late Map<String, dynamic> languageProgress;

    if (!isFeatured) {
      if (enrolledCourse != null) {
        isCompleted = enrolledCourse.completionPercentage ==
            TocConstants.COURSE_COMPLETION_PERCENTAGE;
        if (!isCompleted ||
            enrolledCourse.languageMap.languages.isNotEmpty &&
                enrolledCourse.languageMap.languages.length > 1) {
          parentContentList.clear();
          parentContentList =
              await Provider.of<TocRepository>(context, listen: false)
                  .readContentProgress(
                      enrolledCourse.id, enrolledCourse.batch!.batchId,
                      contentIds: course.leafNodes,
                      language: course.language,
                      forceUpdateOverallProgress: true);
          if (course.languageMap.languages.isNotEmpty &&
              enrolledCourse.completionPercentage ==
                  TocConstants.COURSE_COMPLETION_PERCENTAGE) {
            Provider.of<TocRepository>(context, listen: false)
                .setCourseProgress(1.0);
          } else {
            getOverallProgress(parentContentList, course, context);
          }

          languageProgress = Provider.of<TocRepository>(context, listen: false)
              .languageProgress;
          if (languageProgress.isNotEmpty &&
              languageProgress[course.language.toLowerCase()] != null) {
            currentLangProgress =
                languageProgress[course.language.toLowerCase()];
          }
          isCompleted = enrolledCourse.completionPercentage ==
                  TocConstants.COURSE_COMPLETION_PERCENTAGE &&
              (currentLangProgress ==
                  TocConstants.COURSE_COMPLETION_PERCENTAGE);
        }
      }
    }
    if (courseHierarchyData.children != null) {
      for (index = 0; index < courseHierarchyData.children!.length; index++) {
        String? parentBatchId = null;
        String? parentCourseId = null;
        String? language = null;
        List<ContentStateModel> contentList = [];

        if (course.cumulativeTracking && !isFeatured) {
          isCompleted = false;
          if (enrolledCourse != null &&
              courseHierarchyData.children![index].parent ==
                  courseHierarchyData.identifier &&
              enrolledCourse.id ==
                  TocPlayerViewModel().getEnrolledCourseId(
                      context, courseHierarchyData.identifier)) {
            parentBatchId = enrolledCourse.batchId;
            parentCourseId = enrolledCourse.id;
            language = course.language;
            isCompleted = enrolledCourse.completionPercentage ==
                    TocConstants.COURSE_COMPLETION_PERCENTAGE &&
                (currentLangProgress == null ||
                    currentLangProgress ==
                        TocConstants.COURSE_COMPLETION_PERCENTAGE);
          }
          Course? enrolledSubCourse = enrollmentList.cast<Course?>().firstWhere(
              (course) =>
                  course!.id ==
                  TocPlayerViewModel().getEnrolledCourseId(
                      context, courseHierarchyData.children![index].identifier),
              orElse: () => null);

          if (enrolledSubCourse != null) {
            try {
              parentBatchId = enrolledSubCourse.batch!.batchId;
              parentCourseId = enrolledSubCourse.id;
              Map<String, dynamic>? _course = await TocRepository()
                  .getCourseData(
                      courseHierarchyData.children![index].identifier,
                      isFeatured: isFeatured);
              language =
                  _course != null ? Course.fromJson(_course).language : null;

              double? currentSubCourseLangProgress;
              if (languageProgress.isNotEmpty &&
                  language != null &&
                  languageProgress[language.toLowerCase()] != null) {
                currentSubCourseLangProgress =
                    languageProgress[language.toLowerCase()];
              }
              isCompleted = enrolledSubCourse.completionPercentage ==
                      TocConstants.COURSE_COMPLETION_PERCENTAGE &&
                  (currentSubCourseLangProgress == null ||
                      currentSubCourseLangProgress ==
                          TocConstants.COURSE_COMPLETION_PERCENTAGE);
              if (!isCompleted && language != null) {
                contentList.clear();
                contentList = await TocRepository().readContentProgress(
                    enrolledSubCourse.id, enrolledSubCourse.batch!.batchId,
                    contentIds: course.leafNodes, language: language);
              }
            } catch (e) {}
          } else if (courseHierarchyData.children![index].mimeType !=
                  EMimeTypes.collection &&
              enrolledCourse != null) {
            try {
              contentList.clear();
              contentList = await TocRepository().readContentProgress(
                  enrolledCourse.id, enrolledCourse.batch!.batchId,
                  contentIds: course.leafNodes,
                  language: language ?? course.language);
            } catch (e) {}
          } else {
            contentList = parentContentList;
          }
        } else if (!course.cumulativeTracking) {
          if (!isFeatured) {
            contentList = parentContentList;
          }
          language = course.language;
        }
        if ((courseHierarchyData.children![index].contentType == 'Collection' ||
            courseHierarchyData.children![index].contentType == 'CourseUnit')) {
          List<NavigationModel> temp = [];
          Map<String, dynamic> childObject =
              courseHierarchyData.children![index].toJson();

          if (courseHierarchyData.children![index].children != null) {
            for (int i = 0;
                i < courseHierarchyData.children![index].children!.length;
                i++) {
              ProgressModel progress = getProgress(isCompleted,
                  childObject['children']![i]['identifier'], contentList);
              NavigationModel content = NavigationModel.fromJson(childObject,
                  index: k++,
                  childIndex: i,
                  hasChildren: true,
                  parentBatchId: parentBatchId,
                  parentCourseId: parentCourseId,
                  progress: progress,
                  language: language);
              temp.add(content);
              resourceNavigateItems.add(content);
            }
          } else {
            ProgressModel progress = getProgress(
                isCompleted, childObject['identifier'], contentList);
            NavigationModel content = NavigationModel.fromJson(childObject,
                index: k++, progress: progress, language: language);
            temp.add(content);
            resourceNavigateItems.add(content);
          }
          tempNavItems.add(temp);
        } else if (courseHierarchyData.children![index].contentType ==
            'Course') {
          List courseList = [];
          for (var i = 0;
              i < courseHierarchyData.children![index].children!.length;
              i++) {
            List<NavigationModel> temp = [];
            if (courseHierarchyData.children![index].children![i].contentType ==
                    'Collection' ||
                courseHierarchyData.children![index].children![i].contentType ==
                    'CourseUnit') {
              Map<String, dynamic> childObject =
                  courseHierarchyData.children![index].children![i].toJson();

              for (var j = 0;
                  j <
                      courseHierarchyData
                          .children![index].children![i].children!.length;
                  j++) {
                ProgressModel progress = getProgress(isCompleted,
                    childObject['children']![j]['identifier'], contentList);
                NavigationModel content = NavigationModel.fromJson(childObject,
                    index: k++,
                    hasChildren: true,
                    parentBatchId: parentBatchId,
                    parentCourseId: parentCourseId,
                    courseName: courseHierarchyData.children![index].name,
                    childIndex: j,
                    progress: progress,
                    language: language);
                temp.add(content);
                resourceNavigateItems.add(content);
              }
              courseList.add(temp);
            } else {
              Map<String, dynamic> childObject =
                  courseHierarchyData.children![index].toJson();
              ProgressModel progress = getProgress(isCompleted,
                  childObject['children']![i]['identifier'], contentList);
              NavigationModel content = NavigationModel.fromJson(childObject,
                  index: k++,
                  parentBatchId: parentBatchId,
                  parentCourseId: parentCourseId,
                  isCourse: true,
                  hasChildren: true,
                  courseName: courseHierarchyData.children![index].name,
                  childIndex: i,
                  progress: progress,
                  language: language);
              courseList.add(content);
              resourceNavigateItems.add(content);
            }
          }
          tempNavItems.add(courseList);
        } else {
          Map<String, dynamic> childObject =
              courseHierarchyData.children![index].toJson();
          ProgressModel progress =
              getProgress(isCompleted, childObject['identifier'], contentList);
          NavigationModel content = NavigationModel.fromJson(childObject,
              index: k++,
              parentBatchId: parentBatchId,
              parentCourseId: parentCourseId,
              isCourse: true,
              progress: progress,
              language: language);
          tempNavItems.add(content);
          resourceNavigateItems.add(content);
        }
      }
      if (enrolledCourse != null &&
          isResourceLocked(
              courseCategory: course.courseCategory,
              contextLockingType: course.contextLockingType,
              compatibilityLevel: course.compatibilityLevel)) {
        resourceNavigateItems =
            updateLock(resourceNavigateItems, courseHierarchyData.identifier);
      }
      return {
        'navItems': tempNavItems,
        'resourceNavItems': resourceNavigateItems
      };
    }
  }

  static bool containsLastAccessedContent(
      dynamic content, String? lastAccessContentId) {
    if (content is List) {
      for (var item in content) {
        if (containsLastAccessedContent(item, lastAccessContentId)) {
          return true;
        }
      }
    } else if (content != null && content.contentId == lastAccessContentId) {
      return true;
    }
    return false;
  }
}
