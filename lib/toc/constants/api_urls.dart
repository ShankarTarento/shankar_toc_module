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
}
