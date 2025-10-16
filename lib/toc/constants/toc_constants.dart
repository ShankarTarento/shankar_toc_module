class PrimaryCategory {
  static const String practiceAssessment = "Practice Question Set";
  static const String finalAssessment = "Course Assessment";
  static const String preEnrolmentAssessment = "Pre Enrolment Assessment";
  static const String program = 'program';
  static const String course = 'course';
  static const String learningResource = 'Learning resource';
  static const String standaloneAssessment = 'standalone assessment';
  static const String blendedProgram = 'Blended Program';
  static const String event = 'event';

  static const String curatedProgram = 'Curated Program';
  static const String moderatedCourses = 'Moderated Course';
  static const String moderatedProgram = 'Moderated Program';
  static const String moderatedAssessment = 'Moderated Assessment';
  static const String inviteOnlyProgram = 'Invite-Only Program';
  static const String offlineSession = 'Offline Session';
  static const String inviteOnlyAssessment = 'Invite-Only Assessment';
  static const String recentlyAdded = 'recentlyAdded';
  static const String trendingAcrossDepartment = 'trendingAcrossDepartment';
  static const String externalCourse = 'External Course';
  static const String caseStudy = 'Case Study';
  static const String teachersResource = 'Teachers Resource';
  static const String referenceResource = "Reference Resource";
  static const String comprehensiveAssessmentProgram =
      "Comprehensive Assessment Program";
  static const String multilingualCourse = 'Multilingual Course';

  static List<String> programCategoriesList = [
    PrimaryCategory.comprehensiveAssessmentProgram.toLowerCase(),
    PrimaryCategory.curatedProgram.toLowerCase(),
    PrimaryCategory.moderatedProgram.toLowerCase(),
    PrimaryCategory.inviteOnlyProgram.toLowerCase(),
    PrimaryCategory.blendedProgram.toLowerCase()
  ];
  static List<String> dynamicCertProgramCategoriesList = [
    PrimaryCategory.curatedProgram.toLowerCase()
  ];
}

class AppConfiguration {
  bool useCompetencyv6 = true;
}

class EMimeTypes {
  static const String collection = 'application/vnd.ekstep.content-collection';
  static const String html = 'application/vnd.ekstep.html-archive';
  static const String ilp_fp = 'application/ilpfp';
  static const String iap = 'application/iap-assessment';
  static const String m4a = 'audio/m4a';
  static const String mp3 = 'audio/mpeg';
  static const String mp4 = 'video/mp4';
  static const String m3u8 = 'application/x-mpegURL';
  static const String interaction = 'video/interactive';
  static const String pdf = 'application/pdf';
  static const String png = 'image/png';
  static const String quiz = 'application/quiz';
  static const String dragDrop = 'application/drag-drop';
  static const String htmlPicker = 'application/htmlpicker';
  static const String webModule = 'application/web-module';
  static const String webModuleExercise = 'application/web-module-exercise';
  static const String youtube = 'video/x-youtube';
  static const String handsOn = 'application/integrated-hands-on';
  static const String rdbmsHandsOn = 'application/rdbms';
  static const String classDiagram = 'application/class-diagram';
  static const String channel = 'application/channel';
  static const String collectionResource = 'resource/collection';
  // Added on UI Onl;
  static const String certification = 'application/certification';
  static const String playlist = 'application/playlist';
  static const String unknown = 'application/unknown';
  static const String externalLink = 'text/x-url';
  static const String youtubeLink = 'video/x-youtube';
  static const String assessment = 'application/json';
  static const String newAssessment = 'application/vnd.sunbird.questionset';
  static const String survey = 'application/survey';
  static const String offlineSession = 'application/offline';
  static const String offline = 'application/offline';
}

class IntentType {
  static const String direct = 'direct';
  static const String discussions = 'discussions';
  static const String competencyList = 'competencylist';
  static const String contact = 'contact';
  static const String course = 'course';
  static const String tags = 'tags';
  static const String learners = 'learners';
  static const String visualisation = 'visualisations';
  static const String coursesCompetency = 'courses_with_competency';
  static const String competencyCourses = 'competency_courses';
  static const String images = 'images';
  static const String links = 'links';
  static const String youtubeVideo = 'youtubeVideo';
  static const String dateFormat = 'dd-MM-yyyy';
  static const String dateFormat2 = 'd MMM, y';
  static const String dateFormat3 = 'd MMM, y  – HH:mm ';
  static const String dateFormat4 = "yyyy-MM-dd";
  static const String dateFormat5 = "yyyy-MM-dd HH:mm:ss";
  static const String dateFormat6 = "E, d MMM, yy";
  static const String dateFormat7 = 'EEE, MMM d h:mm a';

  static const String dateFormat8 = "MMMddyyyy";
  static const String dateFormat9 = 'MMM dd, yyyy';

  static const String dateFormatYearOnly = 'y';
  static const String timeFormat = 'HH:mm:ss';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ssZ';
  static const String achievementDateFormat = 'MMM yyyy';
  static const String MMMddyyyy = 'MMM dd, yyyy';
}

class CompetencyAreas {
  static const String behavioural = 'behavioural';
  static const String functional = 'functional';
  static const String domain = 'domain';
}

class RegExpConstants {
  static RegExp unicodeSpecialChar = RegExp(r'[^\p{L}\p{N}_]+', unicode: true);
}

class CertificateType {
  static const String png = "png";
  static const String pdf = "pdf";
}

//Karma point
const int KARMAPOINT_DISPLAY_LIMIT = 3;
const int KARMAPOINT_READ_LIMIT = 6;
const int COURSE_RATING_POINT = 2;
const int COURSE_COMPLETION_POINT = 5;
const int ACBP_COURSE_COMPLETION_POINT = 15;
const int FIRST_ENROLMENT_POINT = 5;
const int KARMPOINT_AWARD_LIMIT_TO_COURSE = 4;
const String APP_DOWNLOAD_FOLDER = '/storage/emulated/0/Download';
const String supportEmail = "mission[dot]karmayogi[at]gov[dot]in";

class EContextLockingType {
  static const courseAssessmentOnly = 'Course Assessment Only';
}

class ContextLockingCompatibility {
  static const CuratedPgmFinalAssessmentLock = 5;
}

class ContentCompletionPercentage {
  static const video = 99;
  static const youtube = 99;
  static const scorm = 80;
  static const audio = 99;
}

enum TocPublishStatus {
  draft,
  live;

  // Add a helper to convert from string
  static TocPublishStatus? fromString(String? status) {
    if (status == null) return null;
    return TocPublishStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == status.toLowerCase(),
      orElse: () => TocPublishStatus.draft,
    );
  }
}

class TocConstants {
  static const contextLockCategories = {
    PrimaryCategory.curatedProgram,
    PrimaryCategory.comprehensiveAssessmentProgram
  };
  static const int RATING_DEFAULT_PERCENTAGE = 50;
  static const int COURSE_COMPLETION_PERCENTAGE = 100;
}

class RegExpressions {
  static RegExp specialChar = RegExp(r'[^\w\s]');
  static RegExp validEmail = RegExp(
      r"[a-zA-Z0-9_-]+(?:\.[a-zA-Z0-9_-]+)*@((?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?){2,}\.){1,3}(?:\w){2,}");
  static RegExp validPhone = RegExp(
      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
  static RegExp htmlValidator = RegExp(r'<[^>]+>');
  static RegExp inputTagRegExp =
      RegExp(r'<input\b[^>]*>', caseSensitive: false);
  static RegExp unicodeSpecialChar = RegExp(r'[^\p{L}\p{N}_]+', unicode: true);
  static RegExp registrationLink = RegExp(r"\/crp\/\d+\/\d+$");
  static RegExp extractOrgIdFromRegisterLink = RegExp(r"\/crp\/\d+\/(\d+)$");
  static RegExp alphabetsWithDot = RegExp(r"^[a-zA-Z\s.]+$");
  static RegExp alphabetsAndSpaces = RegExp(r'^[A-Za-z ]+$');
  static RegExp mulipleSpace = RegExp(r'^[^\s]+( [^\s]+)*( *)$');
  static RegExp alphaNumeric = RegExp(r'^[A-Za-z0-9 ]+$');
  static RegExp alphabets = RegExp(r"^[a-zA-Z]+$");
  static RegExp numeric = RegExp(r'\d');
  static RegExp alphabetWithAmbresandDotCommaSlashBracket =
      RegExp(r'^[a-zA-Z\s(),.&/]+$');
  static RegExp alphaNumWithDotCommaBracketHyphen =
      RegExp(r'^[a-zA-Z0-9\s(),.-]+$');
  static RegExp alphabetWithDotCommaBracket = RegExp(r'^[a-zA-Z\s(),.]+$');
  static RegExp startAndEndWithSpace = RegExp(r"^\s|\s$");
  static RegExp multipleConsecutiveSpace = RegExp(r'\s{2,}');
  static RegExp alphabetsWithAmbresandHyphenSlashParentheses =
      RegExp(r'^[a-zA-Z\s()&\-/]+$');
  static RegExp alphabetsWithAmbresandParentheses = RegExp(r'^[a-zA-Z\s()&]+$');
  static RegExp alphabetWithAmbresandDotCommaSlashBracketHyphen =
      RegExp(r'^[a-zA-Z\s(),.&/\-]+$');
}

class AssessmentQuestionStatus {
  static const String markForReviewAndNext = "Mark for review & next";
  static const String clearResponse = "Clear Response";
  static const String saveAndNext = "Save & Next";
  static const String nextSection = "Next Section";
  static const String notAnswered = "Not answered";
  static const String correct = "Correct";
  static const String wrong = "Wrong";
  static const String incorrect = "Incorrect";
  static const String all = "All";
  static const String unattempted = "Unattempted";
  static const String retakeNotAllowed = "Retake Not Allowed";
  static const String previous = "Previous";
}

class AssessmentQuestionType {
  static const String radioType = 'mcq-sca';
  static const String radioWeightageType = 'mcq-sca-tf';
  static const String checkBoxType = 'mcq-mca';
  static const String checkBoxWeightageType = 'mcq-mca-w';
  static const String matchCase = 'mtf';
  static const String fitb = 'fitb';
  static const String ftb = 'ftb';
}

class AssessmentType {
  static const questionWeightage = 'questionWeightage';
  static const optionalWeightage = 'optionalWeightage';
}

class AssessmentSectionType {
  static const String paragraph = 'paragraph';
  static const String section = 'section';
}

const String ASSESSMENT_FITB_QUESTION_INPUT =
    '<input style=\"border-style:none none solid none\" />';

class EventType {
  static const karmayogiTalks = "Karmayogi Talks";
  static const webinar = "Webinar";
  static const karmayogiSaptah = "Karmayogi Saptah";
  static const rajyaKarmayogiSaptha = "Rajya Karmayogi Saptah";
}

class QuestionTypes {
  static const String singleAnswer = 'singleAnswer';
  static const String multipleAnswer = 'multipleAnswer';
}

enum WFBlendedProgramStatus {
  INITIATE,
  SEND_FOR_MDO_APPROVAL,
  SEND_FOR_PC_APPROVAL,
  APPROVED,
  REJECTED,
  WITHDRAWN,
  WITHDRAW,
  REMOVED
}

class QuestionType {
  static const String radio = 'radio';
  static const String checkbox = 'checkbox';
  static const String rating = 'rating';
  static const String text = 'text';
  static const String email = 'email';
  static const String textarea = 'textarea';
  static const String numeric = 'numeric';
  static const String date = 'date';
  static const String boolean = 'boolean';
  static const String heading = 'heading';
  static const String separator = 'separator';
  static const String dropdown = 'dropdown';
  static const String phoneNumber = 'phonenumber';
}
