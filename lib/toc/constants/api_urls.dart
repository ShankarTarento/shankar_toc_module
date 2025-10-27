class ApiUrls {
  static const String getCbplan = '/api/user/v1/cbplan';
  static const String getCourse = '/api/content/v2/read/';
  static const String getCourseDetails = '/api/course/v1/hierarchy/';
  static const String getKarmaPoints = '/api/karmapoints/user/course/read';
  static const String claimKarmaPoints = '/api/claimkarmapoints';
  static const String getCourseReviewSummery = '/api/ratings/v1/summary/';
  static const String getCourseReview = '/api/ratings/v1/ratingLookUp';
  static const String getCourseCompletionCertificateForMobile =
      '/apis/public/v8/course/batch/cert/download/mobile';
  static const String getCourseCompletionDynamicCertificate =
      '/api/certificate/dynamic/v1/generate';
  static const String getCourseCompletionCertificate =
      '/api/certreg/v2/certs/download/';
  static const String getCourseEnrollDetailsByIds =
      '/api/course/v4/user/enrollment/details/';
  static const String getYourRating = '/api/ratings/v2/read';
  static const String postReview = '/api/ratings/v1/upsert';
  static const String getStandaloneAssessmentQuestions =
      '/api/player/question/v5/list';
  static const String submitV6StandaloneAssessment =
      '/api/v6/user/assessment/submit';
  static const String submitStandaloneAssessment =
      '/api/v5/user/assessment/submit';
  static const String saveAssessmentQuestion = '/api/assessment/save';
  static const String getAssessmentInfo =
      '/api/player/questionset/v4/hierarchy/';
  static const String getRetakeAssessmentInfo = '/api/user/assessment/retake/';
  static const String getAssessmentQuestions = '/api/player/question/v4/list';
  static const String saveAssessmentNew = '/api/v4/user/assessment/submit';
  static const String getAssessmentCompletionStatus =
      '/api/user/assessment/v4/result';
  static const String saveAssessment = '/api/v2/user/assessment/submit';
  static const String publicAssessmentV5Read = '/api/public/assessment/v5/read';
  static const String getPublicAssessmentCompletionStatus =
      '/api/public/assessment/v5/result';
  static const String publicAdvanceAssessmentSubmit =
      '/api/public/assessment/v5/assessment/submit';
  static const String publicBasicAssessmentSubmit =
      '/api/public/assessment/v4/assessment/submit';
  static const String publicAssessmentQuestionList =
      '/api/public/assessment/v5/question/list';
  static const String getStandaloneRetakeAssessmentInfo =
      '/api/user/assessment/v5/retake/';
  static const String getStandaloneAssessmentInfo =
      '/api/player/questionset/v5/hierarchy/';
  static const String updatePreRequisiteContentProgress =
      '/api/content/v2/state/update';
  static const String readPreRequisiteContentProgress =
      '/api/content/v2/state/read';
  static const String updateContentProgress =
      '/api/course/v1/content/state/update';
  static const String readContentProgress = '/api/course/v1/content/state/read';
  static const String autoEnrollBatch = '/api/v1/autoenrollment';

  static const androidUrl =
      'https://play.google.com/store/apps/details?id=com.igot.karmayogibharat';
  static const iOSUrl =
      'https://apps.apple.com/in/app/igot-karmayogi/id6443949491';
}
