import 'package:toc_module/toc/constants/toc_constants.dart';

class LanguageContent {
  final String id;
  final String name;
  final bool isBaseLanguage;
  bool selectedLanguage;
  final String status;

  LanguageContent({
    required this.id,
    required this.name,
    required this.isBaseLanguage,
    required this.selectedLanguage,
    required this.status,
  });

  factory LanguageContent.fromJson(Map<String, dynamic> json, String key) {
    final bool baseLang = json['isBaseLanguage'] ?? json['isBaseLang'] ?? false;
    return LanguageContent(
      id: json['id'],
      name: key,
      isBaseLanguage: baseLang,
      selectedLanguage: baseLang,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'isBaseLanguage': isBaseLanguage,
        'status': status,
      };

  LanguageContent copy() => LanguageContent(
        id: id,
        name: name,
        isBaseLanguage: isBaseLanguage,
        selectedLanguage: selectedLanguage,
        status: status,
      );
}

class LanguageMapV1 {
  final Map<String, LanguageContent> languages;

  LanguageMapV1({required this.languages});

  static const List<Map<String, String>> masterLanguagesArray = [
    {'name': "English", 'value': "English"},
    {'name': "ಕನ್ನಡ (Kannada)", 'value': "Kannada"},
    {'name': "తెలుగు (Telugu)", 'value': "Telugu"},
    {'name': "தமிழ் (Tamil)", 'value': "Tamil"},
    {'name': "മലയാളം (Malayalam)", 'value': "Malayalam"},
    {'name': "हिंदी (Hindi)", 'value': "Hindi"},
    {'name': "অসমীয়া (Assamese)", 'value': "Assamese"},
    {'name': "বাংলা (Bengali)", 'value': "Bengali"},
    {'name': "ગુજરાતી (Gujarati)", 'value': "Gujarati"},
    {'name': "मराठी (Marathi)", 'value': "Marathi"},
    {'name': "ଓଡିଆ (Odia)", 'value': "Odia"},
    {'name': "ਪੰਜਾਬੀ (Punjabi)", 'value': "Punjabi"},
    {'name': "कोंकणी (Konkani)", 'value': "Konkani"},
    {'name': "बड़ो (Bodo)", 'value': "Bodo"},
    {'name': "डोगरी (Dogri)", 'value': "Dogri"},
    {'name': "كشميري / कश्मीरी (Kashmiri)", 'value': "Kashmiri"},
    {'name': "मैथिली (Maithili)", 'value': "Maithili"},
    {'name': "মৈতৈলোন্ (Manipuri)", 'value': "Manipuri"},
    {'name': "नेपाली (Nepali)", 'value': "Nepali"},
    {'name': "संस्कृतम् (Sanskrit)", 'value': "Sanskrit"},
    {'name': "ᱥᱟᱱᱛᱟᱲᱤ (Santali)", 'value': "Santali"},
    {'name': "سنڌي / सिंधी (Sindhi)", 'value': "Sindhi"},
    {'name': "اُردُو (Urdu)", 'value': "Urdu"},
  ];

  /// Get display name for a language value (e.g., "Hindi" → "हिंदी (Hindi)")
  static String getLanguageDisplayName(String inputValue) {
    final match = masterLanguagesArray.firstWhere(
      (lang) => lang['value']!.toLowerCase() == inputValue.toLowerCase(),
      orElse: () => const {},
    );
    return match.isNotEmpty ? (match['name'] ?? inputValue) : inputValue;
  }

  /// Get language value from its display name (e.g., "हिंदी (Hindi)" → "Hindi")
  static String? getValueFromDisplayName(String displayName) {
    final match = masterLanguagesArray.firstWhere(
      (lang) => lang['name'] == displayName,
      orElse: () => const {},
    );
    return match['value'];
  }

  factory LanguageMapV1.fromJson(Map<String, dynamic>? json) {
    final parsedLanguages = <String, LanguageContent>{};

    json?.forEach((key, value) {
      final status = TocPublishStatus.fromString(value?['status']?.toString());
      if (status == TocPublishStatus.live) {
        final displayName = getLanguageDisplayName(key);
        parsedLanguages[displayName] = LanguageContent.fromJson(value, key);
      }
    });

    return LanguageMapV1(languages: parsedLanguages);
  }

  Map<String, dynamic> toJson() =>
      languages.map((key, value) => MapEntry(key, value.toJson()));

  /// Deep copy of the language map
  static LanguageMapV1 copyLanguageMap(LanguageMapV1 original) {
    final copied = original.languages.map(
      (key, lang) => MapEntry(key, lang.copy()),
    );
    return LanguageMapV1(languages: copied);
  }
}
