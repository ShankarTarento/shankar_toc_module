class ReferenceNode {
  String? lastStatusChangedOn;
  List<String>? organisation;
  String? mediaType;
  String name;
  String? createdOn;
  List<String>? createdFor;
  String? channel;
  String? lastUpdatedOn;
  int? size;
  String identifier;
  String? resourceCategory;
  List<String>? ownershipType;
  int? compatibilityLevel;
  List<String>? audience;
  List<String>? os;
  String? cloudStorageKey;
  String? primaryCategory;
  List<String>? languageCode;
  String? downloadUrl;
  String? framework;
  String? creator;
  String? versionKey;
  String? mimeType;
  String? code;
  bool? isExternal;
  String? license;
  int? version;
  String? contentType;
  List<String>? language;
  String? cqfVersion;
  String? objectType;
  String? status;
  int? maxUserInBatch;
  String? createdBy;
  String? dialcodeRequired;
  Map<String, dynamic>? interceptionPoints;
  String? idealScreenSize;
  String? contentEncoding;
  String? osId;
  String? s3Key;
  String? contentDisposition;
  String artifactUrl;

  ReferenceNode({
    this.lastStatusChangedOn,
    this.organisation,
    this.mediaType,
    required this.name,
    this.createdOn,
    this.createdFor,
    this.channel,
    this.lastUpdatedOn,
    this.size,
    required this.identifier,
    this.resourceCategory,
    this.ownershipType,
    this.compatibilityLevel,
    this.audience,
    this.os,
    this.cloudStorageKey,
    this.primaryCategory,
    this.languageCode,
    this.downloadUrl,
    this.framework,
    this.creator,
    this.versionKey,
    this.mimeType,
    this.code,
    this.isExternal,
    this.license,
    this.version,
    this.contentType,
    this.language,
    this.cqfVersion,
    this.objectType,
    this.status,
    this.maxUserInBatch,
    this.createdBy,
    this.dialcodeRequired,
    this.interceptionPoints,
    this.idealScreenSize,
    this.contentEncoding,
    this.osId,
    this.s3Key,
    this.contentDisposition,
    required this.artifactUrl,
  });

  // Factory constructor to handle JSON parsing
  factory ReferenceNode.fromJson(Map<String, dynamic> json) {
    return ReferenceNode(
      lastStatusChangedOn: json['lastStatusChangedOn'],
      organisation: json['organisation'] != null
          ? List<String>.from(json['organisation'])
          : null,
      mediaType: json['mediaType'],
      name: json['name'],
      createdOn: json['createdOn'],
      createdFor: json['createdFor'] != null
          ? List<String>.from(json['createdFor'])
          : null,
      channel: json['channel'],
      lastUpdatedOn: json['lastUpdatedOn'],
      size: json['size'],
      identifier: json['identifier'],
      resourceCategory: json['resourceCategory'],
      ownershipType: json['ownershipType'] != null
          ? List<String>.from(json['ownershipType'])
          : null,
      compatibilityLevel: json['compatibilityLevel'],
      audience:
          json['audience'] != null ? List<String>.from(json['audience']) : null,
      os: json['os'] != null ? List<String>.from(json['os']) : null,
      cloudStorageKey: json['cloudStorageKey'],
      primaryCategory: json['primaryCategory'],
      languageCode: json['languageCode'] != null
          ? List<String>.from(json['languageCode'])
          : null,
      downloadUrl: json['downloadUrl'],
      framework: json['framework'],
      creator: json['creator'],
      versionKey: json['versionKey'],
      mimeType: json['mimeType'],
      code: json['code'],
      isExternal: json['isExternal'],
      license: json['license'],
      version: json['version'],
      contentType: json['contentType'],
      language:
          json['language'] != null ? List<String>.from(json['language']) : null,
      cqfVersion: json['cqfVersion'],
      objectType: json['objectType'],
      status: json['status'],
      maxUserInBatch: json['maxUserInBatch'],
      createdBy: json['createdBy'],
      dialcodeRequired: json['dialcodeRequired'],
      interceptionPoints: json['interceptionPoints'] ?? {},
      idealScreenSize: json['idealScreenSize'],
      contentEncoding: json['contentEncoding'],
      osId: json['osId'],
      s3Key: json['s3Key'],
      contentDisposition: json['contentDisposition'],
      artifactUrl: json['artifactUrl'],
    );
  }
}
