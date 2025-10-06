import 'dart:convert';

import 'package:toc_module/toc/constants/toc_constants.dart';
import 'package:toc_module/toc/model/batch_model.dart';
import 'package:toc_module/toc/model/competency_passbook.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/reference_node.dart';
import 'package:toc_module/toc/model/sector_details.dart';

import '../helper/toc_helper.dart';
import 'language_map_model.dart';

class Course {
  final String id;
  final String appIcon;
  final String name;
  final String? description;
  final String? duration;
  final String? programDuration;
  final double rating;
  final String? creatorIcon;
  final String? creatorLogo;
  final String? source;
  final int? completedOn;
  final List additionalTags;
  final List<CompetencyPassbook>? competencies;
  String? endDate;
  String? startDate;
  final List<dynamic>? createdFor;
  final String? isVerifiedKarmayogi;
  AssesmentBatch? assesmentBatch;
  final raw;
  int? completionPercentage;
  final String courseCategory;
  final String primaryCategory;
  final bool cumulativeTracking;
  final List leafNodes;
  final String? learningMode;
  final String? instructions;
  late List<Batch>? batches;
  final String? wfSurveyLink;
  final String? lastUpdatedOn;
  final String? createdOn;
  List? issuedCertificates;
  String? batchId;
  final String contentId;
  final Batch? batch;
  final String? lastReadContentId;
  final String? redirectUrl;
  final bool isExternalCourse;
  final String? objectives;
  final String? externalId;
  final String? recentLanguage;
  ContentPartner? contentPartner;
  final String status;
  bool? isRelevant;
  final String licence;
  final String language;
  final int compatibilityLevel;
  final List<SectorDetails> sectorDetails;
  final LanguageMapV1 languageMap;
  CourseHierarchyModel? preEnrolmentResources;
  List<ReferenceNode>? referenceNodes;
  bool isApar = false;
  final String contextLockingType;

  Course(
      {required this.id,
      required this.appIcon,
      required this.name,
      this.description,
      required this.duration,
      required this.programDuration,
      this.completionPercentage,
      required this.creatorIcon,
      required this.rating,
      this.creatorLogo,
      this.source,
      required this.additionalTags,
      this.competencies,
      this.endDate,
      this.startDate,
      this.createdFor,
      this.raw,
      this.completedOn,
      this.assesmentBatch,
      this.isVerifiedKarmayogi,
      required this.courseCategory,
      required this.primaryCategory,
      required this.cumulativeTracking,
      required this.leafNodes,
      this.learningMode,
      required this.instructions,
      this.batches,
      required this.wfSurveyLink,
      this.lastUpdatedOn,
      this.createdOn,
      this.issuedCertificates,
      this.batchId,
      required this.contentId,
      this.batch,
      this.lastReadContentId,
      this.redirectUrl,
      required this.isExternalCourse,
      this.objectives,
      this.externalId,
      this.recentLanguage,
      this.contentPartner,
      required this.status,
      this.isRelevant,
      required this.licence,
      required this.language,
      required this.compatibilityLevel,
      required this.sectorDetails,
      required this.languageMap,
      this.preEnrolmentResources,
      this.referenceNodes,
      // required this.isApar,
      required this.contextLockingType});

  factory Course.fromJson(Map<String, dynamic> json, {String? endDate}) {
    final String id = _parseId(json);
    final String appIcon = _parseAppIcon(json);
    final String name =
        json['name'] ?? json['courseName'] ?? json['content']?['name'] ?? '';
    final String description = json['description'];
    final String? duration = json['duration']?.toString() ??
        json['content']?['duration']?.toString();
    final String? programDuration = json['programDuration']?.toString();
    final double rating = (json['avgRating'] as num?)?.toDouble() ?? 0.0;

    final String creatorLogo = _parseCreatorLogo(json);
    final String source = _parseSource(json);

    final List<CompetencyPassbook> competencies = _parseCompetencies(json);
    final List<Batch>? batches = _parseBatches(json);

    final String courseType = getCourseCategory(json);

    return Course(
      id: id,
      appIcon: appIcon,
      name: name,
      description: description,
      duration: duration,
      programDuration: programDuration,
      rating: rating,
      creatorIcon: json['creatorIcon'],
      creatorLogo: creatorLogo,
      source: source,
      additionalTags: json['additionalTags'] ?? [],
      competencies: competencies,
      endDate: endDate ?? json['endDate'],
      startDate: json['startDate'],
      createdFor: json['createdFor'],
      completedOn: json['completedOn'],
      completionPercentage: json['completionPercentage'],
      isVerifiedKarmayogi: json['secureSettings']?['isVerifiedKarmayogi'],
      courseCategory: courseType,
      primaryCategory:
          json['primaryCategory'] ?? json['content']?['primaryCategory'] ?? '',
      cumulativeTracking: PrimaryCategory.programCategoriesList
          .contains(courseType.toLowerCase()),
      leafNodes: json['leafNodes'] ?? [],
      learningMode: json['learningMode'],
      instructions: json['instructions'],
      batches: batches,
      wfSurveyLink: json['wfSurveyLink'],
      lastUpdatedOn: json['lastUpdatedOn'],
      createdOn: json['createdOn'],
      issuedCertificates: json['issuedCertificates'] ?? [],
      batchId: json['batchId'],
      contentId: json['contentId'] ?? '',
      batch: json['batch'] != null ? Batch.fromJson(json['batch']) : null,
      lastReadContentId: json['lastReadContentId'],
      redirectUrl: json['redirectUrl'],
      isExternalCourse: json['redirectUrl'] != null,
      objectives: json['objectives'],
      externalId: json['externalId'],
      recentLanguage: json['recent_language'],
      raw: json,
      contentPartner: json['contentPartner'] != null
          ? ContentPartner.fromJson(json['contentPartner'])
          : null,
      status: json['status']?.toString() ?? '',
      licence: json['content']?['license'] ?? '',
      language: (json['language'] is List && json['language'].isNotEmpty)
          ? json['language'].first
          : '',
      compatibilityLevel: json['compatibilityLevel'] ?? 0,
      sectorDetails: (json['sectorDetails_v1'] as List?)
              ?.map((x) => SectorDetails.fromJson(x))
              .toList() ??
          [],
      languageMap: json['content']?['languageMapV1'] != null
          ? LanguageMapV1.fromJson(json['content']['languageMapV1'])
          : LanguageMapV1.fromJson(json['languageMapV1']),
      preEnrolmentResources: json['preEnrolmentResources'] != null
          ? CourseHierarchyModel.fromJson(
              {'children': json['preEnrolmentResources']})
          : null,
      referenceNodes: _parseReferenceNodes(json),
      contextLockingType: json['contextLockingType'] ?? '',
    );
  }

  static String _parseId(Map<String, dynamic> json) {
    return json['identifier'] ??
        json['content']?['identifier'] ??
        json['courseId'] ??
        '';
  }

  static String _parseAppIcon(Map<String, dynamic> json) {
    return (json['posterImage'] != null)
        ? TocHelper.convertToPortalUrl(json['posterImage'])
        : (json['content']?['posterImage'] != null)
            ? TocHelper.convertToPortalUrl(json['content']['posterImage'])
            : (json['appIcon'] ?? '');
  }

  static String _parseCreatorLogo(Map<String, dynamic> json) {
    return (json['creatorLogo'] != null)
        ? TocHelper.convertToPortalUrl(json['creatorLogo'])
        : (json['content']?['creatorLogo'] != null)
            ? TocHelper.convertImageUrl(json['content']['creatorLogo'])
            : (json['contentPartner']?['link'] ?? '');
  }

  static String _parseSource(Map<String, dynamic> json) {
    if (json['source'] != null) return json['source'].toString();
    if (json['content']?['organisation'] != null) {
      return json['content']['organisation'].first;
    }
    if (json['organisation'] != null && json['organisation'].isNotEmpty) {
      return json['organisation'].first;
    }
    return json['contentPartner']?['contentPartnerName'] ?? 'Karmayogi Bharat';
  }

  static List<CompetencyPassbook> _parseCompetencies(
      Map<String, dynamic> json) {
    final List<CompetencyPassbook> list = [];
    final id = json['identifier'];

    if (id == null) return list;

    if (AppConfiguration().useCompetencyv6 && json['competencies_v6'] != null) {
      final data = json['competencies_v6'] is String
          ? jsonDecode(json['competencies_v6'])
          : json['competencies_v6'];

      for (var x in data) {
        list.add(CompetencyPassbook.fromJson(
            json: x, courseId: id, useCompetencyv6: true));
      }
    } else if (json['competencies_v5'] != null) {
      for (var x in json['competencies_v5']) {
        list.add(CompetencyPassbook.fromJson(
            json: x, courseId: id, useCompetencyv6: false));
      }
    }
    return list;
  }

  static List<Batch>? _parseBatches(Map<String, dynamic> json) {
    if (json['batches'] != null) {
      return List<Batch>.from(json['batches'].map((x) => Batch.fromJson(x)));
    }
    if (json['content']?['batches'] != null) {
      return List<Batch>.from(
          json['content']['batches'].map((x) => Batch.fromJson(x)));
    }
    return null;
  }

  static List<ReferenceNode>? _parseReferenceNodes(Map<String, dynamic> json) {
    if (json['referenceNodes'] == null) return null;

    final data = json['referenceNodes'];
    if (data is String) {
      return (jsonDecode(data) as List)
          .map((x) => ReferenceNode.fromJson(x))
          .toList();
    }
    if (data is List) {
      return data.map((x) => ReferenceNode.fromJson(x)).toList();
    }
    return null;
  }

  static String getCourseCategory(Map<String, dynamic> json) {
    return json['redirectUrl'] != null
        ? 'External Course'
        : json['courseCategory'] ??
            json['content']?['courseCategory'] ??
            json['primaryCategory'] ??
            json['content']?['primaryCategory'] ??
            '';
  }

  List<AssesmentBatch> getBatches() {
    List data = raw['batches'];
    List<AssesmentBatch> batches = [];

    for (var i in data) {
      batches.add(AssesmentBatch.fromJson(i));
    }

    return batches;
  }

  bool get isNotEmpty => id != '';
}

class AssesmentBatch {
  String? identifier;
  dynamic batchAttributes;
  String? endDate;
  String? createdBy;
  String? name;
  String? batchId;
  String? enrollmentType;
  String? startDate;
  int? status;
  List createdFor;
  String? startTime;
  String? endTime;

  AssesmentBatch(
      {this.identifier,
      this.batchAttributes,
      this.endDate,
      this.createdBy,
      this.name,
      this.batchId,
      this.enrollmentType,
      this.startDate,
      this.status,
      this.startTime,
      this.endTime,
      required this.createdFor});

  factory AssesmentBatch.fromJson(Map<String, dynamic> json) {
    return AssesmentBatch(
        identifier: json['identifier'],
        batchAttributes: json['batchAttributes'],
        endDate: json['endDate'] != null
            ? DateTime.parse(json['endDate']).toLocal().toString()
            : null,
        createdBy: json['createdBy'],
        name: json['name'],
        batchId: json['batchId'],
        enrollmentType: json['enrollmentType'],
        createdFor: json['createdFor'] ?? [],
        startDate: json['startDate'] != null
            ? DateTime.parse(json['startDate']).toLocal().toString()
            : null,
        status: json['status'],
        startTime: json['startTime'] ?? '',
        endTime: json['endTime'] ?? '');
  }
}

class ContentPartner {
  String? id;
  String? link;
  String? partnerCode;
  String? contentPartnerName;

  ContentPartner({
    this.id,
    this.link,
    this.partnerCode,
    this.contentPartnerName,
  });

  factory ContentPartner.fromJson(Map<String, dynamic> json) {
    return ContentPartner(
      id: json['id'],
      link: json['link'],
      partnerCode: json['partnerCode'],
      contentPartnerName: json['contentPartnerName'] ?? '',
    );
  }
}
