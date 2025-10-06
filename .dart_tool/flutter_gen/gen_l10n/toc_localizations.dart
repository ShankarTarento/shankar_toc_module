import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'toc_localizations_en.dart';
import 'toc_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of TocLocalizations
/// returned by `TocLocalizations.of(context)`.
///
/// Applications need to include `TocLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/toc_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TocLocalizations.localizationsDelegates,
///   supportedLocales: TocLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the TocLocalizations.supportedLocales
/// property.
abstract class TocLocalizations {
  TocLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TocLocalizations? of(BuildContext context) {
    return Localizations.of<TocLocalizations>(context, TocLocalizations);
  }

  static const LocalizationsDelegate<TocLocalizations> delegate = _TocLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @mWeAreAvailable.
  ///
  /// In en, this message translates to:
  /// **'We are now available on'**
  String get mWeAreAvailable;

  /// No description provided for @mBtnFeaturedCourses.
  ///
  /// In en, this message translates to:
  /// **'Featured Courses'**
  String get mBtnFeaturedCourses;

  /// No description provided for @mBtnSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get mBtnSignIn;

  /// No description provided for @mLearnAndNetwork.
  ///
  /// In en, this message translates to:
  /// **'Learn and network with civil servants and subject matter experts India'**
  String get mLearnAndNetwork;

  /// No description provided for @noOfUsersMdo.
  ///
  /// In en, this message translates to:
  /// **'Number of Users/MDO\'s'**
  String get noOfUsersMdo;

  /// No description provided for @mKarmyogiOnboarded.
  ///
  /// In en, this message translates to:
  /// **'Karmyogi Onboarded'**
  String get mKarmyogiOnboarded;

  /// No description provided for @mAvailableContent.
  ///
  /// In en, this message translates to:
  /// **'Available Content(hours)'**
  String get mAvailableContent;

  /// No description provided for @mCourses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get mCourses;

  /// No description provided for @mSolutioningSpace.
  ///
  /// In en, this message translates to:
  /// **'Solutioning space for all of Government'**
  String get mSolutioningSpace;

  /// No description provided for @mLearningHub.
  ///
  /// In en, this message translates to:
  /// **'Learning hub'**
  String get mLearningHub;

  /// No description provided for @mLearnhubPara.
  ///
  /// In en, this message translates to:
  /// **'Learn anywhere, anytime.'**
  String get mLearnhubPara;

  /// No description provided for @mDiscussionHub.
  ///
  /// In en, this message translates to:
  /// **'Discussion hub'**
  String get mDiscussionHub;

  /// No description provided for @mDiscussionHubSubHeading.
  ///
  /// In en, this message translates to:
  /// **'Discuss and learn with peers.'**
  String get mDiscussionHubSubHeading;

  /// No description provided for @mNetworkHub.
  ///
  /// In en, this message translates to:
  /// **'Network hub'**
  String get mNetworkHub;

  /// No description provided for @mNetworkHubParagraph.
  ///
  /// In en, this message translates to:
  /// **'Connect with civil servants across the country.'**
  String get mNetworkHubParagraph;

  /// No description provided for @mCompetencyHub.
  ///
  /// In en, this message translates to:
  /// **'Competency hub'**
  String get mCompetencyHub;

  /// No description provided for @mCompetencyHubPara.
  ///
  /// In en, this message translates to:
  /// **'Identify your competency requirements.'**
  String get mCompetencyHubPara;

  /// No description provided for @mCareerHub.
  ///
  /// In en, this message translates to:
  /// **'Career hub'**
  String get mCareerHub;

  /// No description provided for @mCareerHubPara.
  ///
  /// In en, this message translates to:
  /// **'Explore career opportunities across the country.'**
  String get mCareerHubPara;

  /// No description provided for @mEventHub.
  ///
  /// In en, this message translates to:
  /// **'Events hub'**
  String get mEventHub;

  /// No description provided for @mEventHubPara.
  ///
  /// In en, this message translates to:
  /// **'Join online and in-person events.'**
  String get mEventHubPara;

  /// No description provided for @mCardCourse.
  ///
  /// In en, this message translates to:
  /// **'COURSE'**
  String get mCardCourse;

  /// No description provided for @mCardLearningHours.
  ///
  /// In en, this message translates to:
  /// **'LEARNING HOURS:'**
  String get mCardLearningHours;

  /// No description provided for @mInputEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get mInputEmail;

  /// No description provided for @mLinkRegisterHere.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get mLinkRegisterHere;

  /// No description provided for @mHomeLearnHub.
  ///
  /// In en, this message translates to:
  /// **'Go to learn hub'**
  String get mHomeLearnHub;

  /// No description provided for @mHomeUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update your mobile number'**
  String get mHomeUpdateTitle;

  /// No description provided for @mHomeUpdateMobile.
  ///
  /// In en, this message translates to:
  /// **'Update your mobile number. This will enable you to login with your mobile number easily and receive important alerts on your mobile.'**
  String get mHomeUpdateMobile;

  /// No description provided for @mHomeWhyItIsImp.
  ///
  /// In en, this message translates to:
  /// **'Why it is important ?'**
  String get mHomeWhyItIsImp;

  /// No description provided for @mHomeSuggestedForYou.
  ///
  /// In en, this message translates to:
  /// **'Suggested for you'**
  String get mHomeSuggestedForYou;

  /// No description provided for @mHomeConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get mHomeConnect;

  /// No description provided for @mHomeConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get mHomeConnecting;

  /// No description provided for @mHomeNewRecommendation.
  ///
  /// In en, this message translates to:
  /// **'As of now there are no recommendations found for you.'**
  String get mHomeNewRecommendation;

  /// No description provided for @mHomeGotToDiscussHubs.
  ///
  /// In en, this message translates to:
  /// **'Go to discuss hub'**
  String get mHomeGotToDiscussHubs;

  /// No description provided for @mHomeBtnDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Discuss'**
  String get mHomeBtnDiscuss;

  /// No description provided for @mHomeSubDiscussTrendingDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Trending discussions'**
  String get mHomeSubDiscussTrendingDiscuss;

  /// No description provided for @mHomeNetworkConnectwith.
  ///
  /// In en, this message translates to:
  /// **'Connect with people you may know'**
  String get mHomeNetworkConnectwith;

  /// No description provided for @mHomeBtnView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get mHomeBtnView;

  /// No description provided for @mHomeCardNewlyAddedCourses.
  ///
  /// In en, this message translates to:
  /// **'Newly added courses'**
  String get mHomeCardNewlyAddedCourses;

  /// No description provided for @mHomeLearnContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue learning'**
  String get mHomeLearnContinue;

  /// No description provided for @mHomeProfileCardInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get mHomeProfileCardInProgress;

  /// No description provided for @mHomeLabelMyLearning.
  ///
  /// In en, this message translates to:
  /// **'My Learning'**
  String get mHomeLabelMyLearning;

  /// No description provided for @mHomeProfileCardCertificate.
  ///
  /// In en, this message translates to:
  /// **'Certificate'**
  String get mHomeProfileCardCertificate;

  /// No description provided for @mHomeProfileCardLearning.
  ///
  /// In en, this message translates to:
  /// **'Learning hours'**
  String get mHomeProfileCardLearning;

  /// No description provided for @mHomeProfileCardWeeklyclaps.
  ///
  /// In en, this message translates to:
  /// **'Weekly claps'**
  String get mHomeProfileCardWeeklyclaps;

  /// No description provided for @mHomePprofileCardWeeks.
  ///
  /// In en, this message translates to:
  /// **'weeks'**
  String get mHomePprofileCardWeeks;

  /// No description provided for @mHomeTabCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get mHomeTabCompleted;

  /// No description provided for @mHomeBtnResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get mHomeBtnResume;

  /// No description provided for @mHomeBlendedProgramBanner.
  ///
  /// In en, this message translates to:
  /// **'Blended Program'**
  String get mHomeBlendedProgramBanner;

  /// No description provided for @mHomeNavigationDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get mHomeNavigationDetails;

  /// No description provided for @mHomeBlendedProgramBatchStart.
  ///
  /// In en, this message translates to:
  /// **'This batch starts in'**
  String get mHomeBlendedProgramBatchStart;

  /// No description provided for @mHomeBlendedProgramWithdrawReq.
  ///
  /// In en, this message translates to:
  /// **' Withdraw your request '**
  String get mHomeBlendedProgramWithdrawReq;

  /// No description provided for @mHomeBlendedProgramEnrollReq.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment request is being reviewed. You will be notified when it is approved.'**
  String get mHomeBlendedProgramEnrollReq;

  /// No description provided for @mHomeBlendedProgramCheckLiveLoc.
  ///
  /// In en, this message translates to:
  /// **'Kindly check the location details and plan in advance.'**
  String get mHomeBlendedProgramCheckLiveLoc;

  /// No description provided for @mHomeBlendedProgramBatchLoc.
  ///
  /// In en, this message translates to:
  /// **'Batch location'**
  String get mHomeBlendedProgramBatchLoc;

  /// No description provided for @mHomeBlendedProgramOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get mHomeBlendedProgramOverview;

  /// No description provided for @mHomeBlendedProgramContent.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get mHomeBlendedProgramContent;

  /// No description provided for @mHomeBlendedProgramSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get mHomeBlendedProgramSessions;

  /// No description provided for @mHomeBlendedProgramDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Discussion'**
  String get mHomeBlendedProgramDiscussion;

  /// No description provided for @mHomeBlendedProgramSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get mHomeBlendedProgramSummary;

  /// No description provided for @mHomeBlendedProgramDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mHomeBlendedProgramDescription;

  /// No description provided for @mHomeBlendedProgramAuthorsCurators.
  ///
  /// In en, this message translates to:
  /// **'Authors and curators'**
  String get mHomeBlendedProgramAuthorsCurators;

  /// No description provided for @mHomeCompetencyType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get mHomeCompetencyType;

  /// No description provided for @mHomeCompetencyRatingReview.
  ///
  /// In en, this message translates to:
  /// **'Ratings and reviews'**
  String get mHomeCompetencyRatingReview;

  /// No description provided for @mHomeBlendedProgramNoReviewFound.
  ///
  /// In en, this message translates to:
  /// **'No reviews found!'**
  String get mHomeBlendedProgramNoReviewFound;

  /// No description provided for @mHomeBlendedProgramTopReviews.
  ///
  /// In en, this message translates to:
  /// **'Top reviews'**
  String get mHomeBlendedProgramTopReviews;

  /// No description provided for @mHomePlaceholderSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mHomePlaceholderSearch;

  /// No description provided for @mHomeCardTrendingDepartment.
  ///
  /// In en, this message translates to:
  /// **'Trending across department'**
  String get mHomeCardTrendingDepartment;

  /// No description provided for @mHomeCardPrograms.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get mHomeCardPrograms;

  /// No description provided for @mHomeCardCourses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get mHomeCardCourses;

  /// No description provided for @mHomeLabelLearning30Min.
  ///
  /// In en, this message translates to:
  /// **'Learning under 30 min'**
  String get mHomeLabelLearning30Min;

  /// No description provided for @mHomeLabelMostTrending.
  ///
  /// In en, this message translates to:
  /// **'Most trending'**
  String get mHomeLabelMostTrending;

  /// No description provided for @mHomeDiscussUpdateOnPost.
  ///
  /// In en, this message translates to:
  /// **'Updates on your posts'**
  String get mHomeDiscussUpdateOnPost;

  /// No description provided for @mHomeDiscussionMonthsAgo.
  ///
  /// In en, this message translates to:
  /// **'months ago'**
  String get mHomeDiscussionMonthsAgo;

  /// No description provided for @mHomeNetworkRecentReq.
  ///
  /// In en, this message translates to:
  /// **'Recent requests'**
  String get mHomeNetworkRecentReq;

  /// No description provided for @mHomeNetworkBuildConn.
  ///
  /// In en, this message translates to:
  /// **'Built your connections within your department and other departments.'**
  String get mHomeNetworkBuildConn;

  /// No description provided for @mHomeNetworkFindConn.
  ///
  /// In en, this message translates to:
  /// **'Find COnnections'**
  String get mHomeNetworkFindConn;

  /// No description provided for @mHomeTopProviderSliders.
  ///
  /// In en, this message translates to:
  /// **'Top providers powering your learning'**
  String get mHomeTopProviderSliders;

  /// No description provided for @mHomeScannerDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get mHomeScannerDownload;

  /// No description provided for @mHomeScannerIgotKarmyogiApp.
  ///
  /// In en, this message translates to:
  /// **'iGOT Karmayogi mobile app'**
  String get mHomeScannerIgotKarmyogiApp;

  /// No description provided for @mHomeScannerSubtext.
  ///
  /// In en, this message translates to:
  /// **'Continue your lifelong learning experience anywhere anytime.'**
  String get mHomeScannerSubtext;

  /// No description provided for @mHomeScanToDownload.
  ///
  /// In en, this message translates to:
  /// **'Scan to Download'**
  String get mHomeScanToDownload;

  /// No description provided for @mHomeNudgesText.
  ///
  /// In en, this message translates to:
  /// **'Update your mobile number'**
  String get mHomeNudgesText;

  /// No description provided for @mHomeNudgesButton.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get mHomeNudgesButton;

  /// No description provided for @mHomeStripMyLearning.
  ///
  /// In en, this message translates to:
  /// **'My Learning'**
  String get mHomeStripMyLearning;

  /// No description provided for @mHomeStripBlendedProgram.
  ///
  /// In en, this message translates to:
  /// **'Blended Program'**
  String get mHomeStripBlendedProgram;

  /// No description provided for @mHomeStripTrendingAcrossDepartment.
  ///
  /// In en, this message translates to:
  /// **'Trending across department'**
  String get mHomeStripTrendingAcrossDepartment;

  /// No description provided for @mHomeStripLearningUnder.
  ///
  /// In en, this message translates to:
  /// **'Learning under 30 min'**
  String get mHomeStripLearningUnder;

  /// No description provided for @mHomeStripCertificationsOfWeek.
  ///
  /// In en, this message translates to:
  /// **'Certifications of the week'**
  String get mHomeStripCertificationsOfWeek;

  /// No description provided for @mTabsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mTabsSearch;

  /// No description provided for @mTabMyLearnings.
  ///
  /// In en, this message translates to:
  /// **'My Learnings'**
  String get mTabMyLearnings;

  /// No description provided for @mLearnTabOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get mLearnTabOverview;

  /// No description provided for @mLearnTabYourLearning.
  ///
  /// In en, this message translates to:
  /// **'Your Learning'**
  String get mLearnTabYourLearning;

  /// No description provided for @mTabExploreBy.
  ///
  /// In en, this message translates to:
  /// **'Explore By'**
  String get mTabExploreBy;

  /// No description provided for @mExploreBtnExplorebyCompetency.
  ///
  /// In en, this message translates to:
  /// **'Explore by competency'**
  String get mExploreBtnExplorebyCompetency;

  /// No description provided for @mExploreBtnExplorebyProvider.
  ///
  /// In en, this message translates to:
  /// **'Explore by provider'**
  String get mExploreBtnExplorebyProvider;

  /// No description provided for @mExploreBtnCuratedCollections.
  ///
  /// In en, this message translates to:
  /// **'Curated collections'**
  String get mExploreBtnCuratedCollections;

  /// No description provided for @mExploreBtnModeratedCourses.
  ///
  /// In en, this message translates to:
  /// **'Moderated courses'**
  String get mExploreBtnModeratedCourses;

  /// No description provided for @mLearnContinueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning'**
  String get mLearnContinueLearning;

  /// No description provided for @mLearnBlendedPrograms.
  ///
  /// In en, this message translates to:
  /// **'Blended Programs'**
  String get mLearnBlendedPrograms;

  /// No description provided for @mLearnCuratedPrograms.
  ///
  /// In en, this message translates to:
  /// **'Curated Programs'**
  String get mLearnCuratedPrograms;

  /// No description provided for @mLearnFeaturedCourses.
  ///
  /// In en, this message translates to:
  /// **'Featured courses'**
  String get mLearnFeaturedCourses;

  /// No description provided for @mLearnModeratedCourses.
  ///
  /// In en, this message translates to:
  /// **'Moderated Courses'**
  String get mLearnModeratedCourses;

  /// No description provided for @mLearnStandaloneAssessment.
  ///
  /// In en, this message translates to:
  /// **'Standalone Assessment'**
  String get mLearnStandaloneAssessment;

  /// No description provided for @mLearnRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently added'**
  String get mLearnRecentlyAdded;

  /// No description provided for @mLearnExploreAll.
  ///
  /// In en, this message translates to:
  /// **'Explore all'**
  String get mLearnExploreAll;

  /// No description provided for @mLearnSeeall.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get mLearnSeeall;

  /// No description provided for @mLearnContentNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Content not available'**
  String get mLearnContentNotAvailable;

  /// No description provided for @mLearnTryDifferentKeywords.
  ///
  /// In en, this message translates to:
  /// **'Please try different keywords or change the search query.'**
  String get mLearnTryDifferentKeywords;

  /// No description provided for @mLearnInfo.
  ///
  /// In en, this message translates to:
  /// **'info'**
  String get mLearnInfo;

  /// No description provided for @mLearnShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get mLearnShowAll;

  /// No description provided for @mLearnBlendedProgramsHtml.
  ///
  /// In en, this message translates to:
  /// **'Blended programs for you.'**
  String get mLearnBlendedProgramsHtml;

  /// No description provided for @mLearnRecentlyAddedHtml.
  ///
  /// In en, this message translates to:
  /// **'Recently added for you.'**
  String get mLearnRecentlyAddedHtml;

  /// No description provided for @mLearnMandatoryCourses.
  ///
  /// In en, this message translates to:
  /// **'Mandatory courses'**
  String get mLearnMandatoryCourses;

  /// No description provided for @mLearnMandatoryCoursesHtml.
  ///
  /// In en, this message translates to:
  /// **'Mandatory courses for you'**
  String get mLearnMandatoryCoursesHtml;

  /// No description provided for @mLearnRecommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get mLearnRecommendedForYou;

  /// No description provided for @mLearnPrograms.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get mLearnPrograms;

  /// No description provided for @mLearnProgramsForYou.
  ///
  /// In en, this message translates to:
  /// **'Programs for you.'**
  String get mLearnProgramsForYou;

  /// No description provided for @mLearnBasedOnYourInterests.
  ///
  /// In en, this message translates to:
  /// **'Based on your interests'**
  String get mLearnBasedOnYourInterests;

  /// No description provided for @mLearnCourseoOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get mLearnCourseoOverview;

  /// No description provided for @mLearnCourseContent.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get mLearnCourseContent;

  /// No description provided for @mLearnCourseSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get mLearnCourseSessions;

  /// No description provided for @mLearnCourseDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Discussion'**
  String get mLearnCourseDiscussion;

  /// No description provided for @mLearnCourseSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get mLearnCourseSummary;

  /// No description provided for @mLearnCourseDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mLearnCourseDescription;

  /// No description provided for @mLearnCourseAuthorsAndCurators.
  ///
  /// In en, this message translates to:
  /// **'Authors and curators'**
  String get mLearnCourseAuthorsAndCurators;

  /// No description provided for @mLearnCourseAuthor.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get mLearnCourseAuthor;

  /// No description provided for @mLearnCourseCurator.
  ///
  /// In en, this message translates to:
  /// **'Curator'**
  String get mLearnCourseCurator;

  /// No description provided for @mLearnCourseProgramDirectorFacilitators.
  ///
  /// In en, this message translates to:
  /// **'Program director & facilitators'**
  String get mLearnCourseProgramDirectorFacilitators;

  /// No description provided for @mLearnCourseFacilitator.
  ///
  /// In en, this message translates to:
  /// **'Facilitator'**
  String get mLearnCourseFacilitator;

  /// No description provided for @mLearnCourseCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Competencies'**
  String get mLearnCourseCompetencies;

  /// No description provided for @mLearnCourseCompetency.
  ///
  /// In en, this message translates to:
  /// **'Competency'**
  String get mLearnCourseCompetency;

  /// No description provided for @mLearnCourseType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get mLearnCourseType;

  /// No description provided for @mLearnCourseRatingsReviews.
  ///
  /// In en, this message translates to:
  /// **'Ratings and reviews'**
  String get mLearnCourseRatingsReviews;

  /// No description provided for @mLearnCourseTopReviews.
  ///
  /// In en, this message translates to:
  /// **'Top reviews'**
  String get mLearnCourseTopReviews;

  /// No description provided for @mLearnCourselatestReviews.
  ///
  /// In en, this message translates to:
  /// **'Latest reviews'**
  String get mLearnCourselatestReviews;

  /// No description provided for @mLearnCourseNoReviewsFound.
  ///
  /// In en, this message translates to:
  /// **'No reviews found!'**
  String get mLearnCourseNoReviewsFound;

  /// No description provided for @mLearnCourseSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mLearnCourseSearch;

  /// No description provided for @mLearnCourseLearningObjective.
  ///
  /// In en, this message translates to:
  /// **'Learning objective'**
  String get mLearnCourseLearningObjective;

  /// No description provided for @mLearnCourseRegistrationInstructions.
  ///
  /// In en, this message translates to:
  /// **'Registration instructions'**
  String get mLearnCourseRegistrationInstructions;

  /// No description provided for @mLearnCourseStudyMaterials.
  ///
  /// In en, this message translates to:
  /// **'Study materials'**
  String get mLearnCourseStudyMaterials;

  /// No description provided for @mLearnCourseSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get mLearnCourseSkills;

  /// No description provided for @mLearnCoursePreRequisites.
  ///
  /// In en, this message translates to:
  /// **'Pre-Requisites'**
  String get mLearnCoursePreRequisites;

  /// No description provided for @mLearnCourseTopics.
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get mLearnCourseTopics;

  /// No description provided for @mLearnResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get mLearnResume;

  /// No description provided for @mLearnStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get mLearnStart;

  /// No description provided for @mLearnStartAgain.
  ///
  /// In en, this message translates to:
  /// **'Start again'**
  String get mLearnStartAgain;

  /// No description provided for @mLearnTakeAssessment.
  ///
  /// In en, this message translates to:
  /// **'Take Assessment'**
  String get mLearnTakeAssessment;

  /// No description provided for @mLearnEnroll.
  ///
  /// In en, this message translates to:
  /// **'Enroll'**
  String get mLearnEnroll;

  /// No description provided for @mLearnYouAreNotInvitedProgram.
  ///
  /// In en, this message translates to:
  /// **'You are not invited for this Program.'**
  String get mLearnYouAreNotInvitedProgram;

  /// No description provided for @mLearnYouAreNotInvitedAssessment.
  ///
  /// In en, this message translates to:
  /// **'You are not invited for this Assessment.'**
  String get mLearnYouAreNotInvitedAssessment;

  /// No description provided for @mLearnNoActiveBatches.
  ///
  /// In en, this message translates to:
  /// **'No Active Batches!!.'**
  String get mLearnNoActiveBatches;

  /// No description provided for @mLearnBatchWillStart.
  ///
  /// In en, this message translates to:
  /// **'Batch will start'**
  String get mLearnBatchWillStart;

  /// No description provided for @mLearnTakeTest.
  ///
  /// In en, this message translates to:
  /// **'Take test'**
  String get mLearnTakeTest;

  /// No description provided for @mLearnRequestUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Request under review'**
  String get mLearnRequestUnderReview;

  /// No description provided for @mLearnRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get mLearnRegister;

  /// No description provided for @mLearnContentExpiredDeleted.
  ///
  /// In en, this message translates to:
  /// **'The content is expired or deleted.'**
  String get mLearnContentExpiredDeleted;

  /// No description provided for @mLearnContentUnpublished.
  ///
  /// In en, this message translates to:
  /// **'The content has been unpublished.'**
  String get mLearnContentUnpublished;

  /// No description provided for @mLearnContentDraft.
  ///
  /// In en, this message translates to:
  /// **'The content is in draft.'**
  String get mLearnContentDraft;

  /// No description provided for @mLearnContentReview.
  ///
  /// In en, this message translates to:
  /// **'The content is in review.'**
  String get mLearnContentReview;

  /// No description provided for @mLearnCertificationTakesTime.
  ///
  /// In en, this message translates to:
  /// **'Kindly be patient. The certificate generation normally takes up to 24 hours; however, it might take longer sometimes.'**
  String get mLearnCertificationTakesTime;

  /// No description provided for @mLearnIssuePersistsMailus.
  ///
  /// In en, this message translates to:
  /// **'If the issue persists, please mail us at'**
  String get mLearnIssuePersistsMailus;

  /// No description provided for @mLearnCongratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get mLearnCongratulations;

  /// No description provided for @mLearnCertificateCompletionReady.
  ///
  /// In en, this message translates to:
  /// **'Your certificate of completion is ready for you to download.'**
  String get mLearnCertificateCompletionReady;

  /// No description provided for @mLearnViewedInIntranet.
  ///
  /// In en, this message translates to:
  /// **'This can be viewed only in the Intranet.'**
  String get mLearnViewedInIntranet;

  /// No description provided for @mLearnNotAvailableOnline.
  ///
  /// In en, this message translates to:
  /// **'This is an instructor-led classroom course and is not available online.'**
  String get mLearnNotAvailableOnline;

  /// No description provided for @mLearnYoutubeContentBlocked.
  ///
  /// In en, this message translates to:
  /// **'Access to this YouTube content is blocked.'**
  String get mLearnYoutubeContentBlocked;

  /// No description provided for @mLearnApplyForPhysicalTraining.
  ///
  /// In en, this message translates to:
  /// **'Apply for physical training'**
  String get mLearnApplyForPhysicalTraining;

  /// No description provided for @mLearnYourProgress.
  ///
  /// In en, this message translates to:
  /// **'Your progress'**
  String get mLearnYourProgress;

  /// No description provided for @mLearnRateThis.
  ///
  /// In en, this message translates to:
  /// **'Rate this'**
  String get mLearnRateThis;

  /// No description provided for @mLearnCourse.
  ///
  /// In en, this message translates to:
  /// **'course'**
  String get mLearnCourse;

  /// No description provided for @mLearnEditRating.
  ///
  /// In en, this message translates to:
  /// **'Edit rating'**
  String get mLearnEditRating;

  /// No description provided for @mLearnAtGlance.
  ///
  /// In en, this message translates to:
  /// **'At a glance'**
  String get mLearnAtGlance;

  /// No description provided for @mLearnCourses1.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get mLearnCourses1;

  /// No description provided for @mLearnCourse1.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get mLearnCourse1;

  /// No description provided for @mLearnModule.
  ///
  /// In en, this message translates to:
  /// **'Module'**
  String get mLearnModule;

  /// No description provided for @mLearnModules.
  ///
  /// In en, this message translates to:
  /// **'Modules'**
  String get mLearnModules;

  /// No description provided for @mLearnVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get mLearnVideo;

  /// No description provided for @mLearnVideos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get mLearnVideos;

  /// No description provided for @mLearnSession.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get mLearnSession;

  /// No description provided for @mLearnSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get mLearnSessions;

  /// No description provided for @mLearnPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get mLearnPdf;

  /// No description provided for @mLearnPdfs.
  ///
  /// In en, this message translates to:
  /// **'PDFs'**
  String get mLearnPdfs;

  /// No description provided for @mLearnAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get mLearnAudio;

  /// No description provided for @mLearnAudios.
  ///
  /// In en, this message translates to:
  /// **'Audios'**
  String get mLearnAudios;

  /// No description provided for @mLearnWebPage.
  ///
  /// In en, this message translates to:
  /// **'Web Page'**
  String get mLearnWebPage;

  /// No description provided for @mLearnWebPages.
  ///
  /// In en, this message translates to:
  /// **'Web Pages'**
  String get mLearnWebPages;

  /// No description provided for @mLearnSurvey.
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get mLearnSurvey;

  /// No description provided for @mLearnSurveys.
  ///
  /// In en, this message translates to:
  /// **'Surveys'**
  String get mLearnSurveys;

  /// No description provided for @mLearnInteractiveContent.
  ///
  /// In en, this message translates to:
  /// **'Interactive Content'**
  String get mLearnInteractiveContent;

  /// No description provided for @mLearnInteractiveContents.
  ///
  /// In en, this message translates to:
  /// **'Interactive Contents'**
  String get mLearnInteractiveContents;

  /// No description provided for @mLearnAssessment.
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get mLearnAssessment;

  /// No description provided for @mLearnAssessments.
  ///
  /// In en, this message translates to:
  /// **'Assessments'**
  String get mLearnAssessments;

  /// No description provided for @mLearnPracticeTest.
  ///
  /// In en, this message translates to:
  /// **'Practice test'**
  String get mLearnPracticeTest;

  /// No description provided for @mLearnPracticeTests.
  ///
  /// In en, this message translates to:
  /// **'Practice Tests'**
  String get mLearnPracticeTests;

  /// No description provided for @mLearnFinalTest.
  ///
  /// In en, this message translates to:
  /// **'Final test'**
  String get mLearnFinalTest;

  /// No description provided for @mLearnFinalTests.
  ///
  /// In en, this message translates to:
  /// **'Final Tests'**
  String get mLearnFinalTests;

  /// No description provided for @mLearnOtherItem.
  ///
  /// In en, this message translates to:
  /// **'Other Item'**
  String get mLearnOtherItem;

  /// No description provided for @mLearnOtherItems.
  ///
  /// In en, this message translates to:
  /// **'Other Items'**
  String get mLearnOtherItems;

  /// No description provided for @mLearnTo.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get mLearnTo;

  /// No description provided for @mLearnPaidContent.
  ///
  /// In en, this message translates to:
  /// **'Paid Content'**
  String get mLearnPaidContent;

  /// No description provided for @mLearnFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get mLearnFree;

  /// No description provided for @mLearnView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get mLearnView;

  /// No description provided for @mCourseLastUpdatedOn.
  ///
  /// In en, this message translates to:
  /// **'Last updated on'**
  String get mCourseLastUpdatedOn;

  /// No description provided for @mCourseExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get mCourseExpiryDate;

  /// No description provided for @mCourseLearningMode.
  ///
  /// In en, this message translates to:
  /// **'Learning mode'**
  String get mCourseLearningMode;

  /// No description provided for @mCourseRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get mCourseRegion;

  /// No description provided for @mCourseLicense.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get mCourseLicense;

  /// No description provided for @mCourseLocale.
  ///
  /// In en, this message translates to:
  /// **'Locale'**
  String get mCourseLocale;

  /// No description provided for @mCourseHasTranslations.
  ///
  /// In en, this message translates to:
  /// **'Has translations'**
  String get mCourseHasTranslations;

  /// No description provided for @mCourseKeywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get mCourseKeywords;

  /// No description provided for @mCourseSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get mCourseSize;

  /// No description provided for @mCourseContentType.
  ///
  /// In en, this message translates to:
  /// **'Content type'**
  String get mCourseContentType;

  /// No description provided for @mCourseComplexityLevel.
  ///
  /// In en, this message translates to:
  /// **'Complexity level'**
  String get mCourseComplexityLevel;

  /// No description provided for @mCourseDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get mCourseDuration;

  /// No description provided for @mCourseCost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get mCourseCost;

  /// No description provided for @mCourseViewCount.
  ///
  /// In en, this message translates to:
  /// **'View count'**
  String get mCourseViewCount;

  /// No description provided for @mCourseSourceName.
  ///
  /// In en, this message translates to:
  /// **'Source name'**
  String get mCourseSourceName;

  /// No description provided for @mCourseStructure.
  ///
  /// In en, this message translates to:
  /// **'Structure'**
  String get mCourseStructure;

  /// No description provided for @mCourseCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Competencies'**
  String get mCourseCompetencies;

  /// No description provided for @mCourseBatchDate.
  ///
  /// In en, this message translates to:
  /// **'Batch date'**
  String get mCourseBatchDate;

  /// No description provided for @mCourseBatchDuration.
  ///
  /// In en, this message translates to:
  /// **'Batch duration'**
  String get mCourseBatchDuration;

  /// No description provided for @mCourseEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Enrolled'**
  String get mCourseEnrolled;

  /// No description provided for @mCourseRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get mCourseRejected;

  /// No description provided for @mCourseTotalApplied.
  ///
  /// In en, this message translates to:
  /// **'Total applied'**
  String get mCourseTotalApplied;

  /// No description provided for @mCommonratings.
  ///
  /// In en, this message translates to:
  /// **'ratings'**
  String get mCommonratings;

  /// No description provided for @mCommonoutof5.
  ///
  /// In en, this message translates to:
  /// **'out of 5'**
  String get mCommonoutof5;

  /// No description provided for @mCommonstar.
  ///
  /// In en, this message translates to:
  /// **'star'**
  String get mCommonstar;

  /// No description provided for @mCommonviewReply.
  ///
  /// In en, this message translates to:
  /// **'View reply'**
  String get mCommonviewReply;

  /// No description provided for @mCommonrateReview.
  ///
  /// In en, this message translates to:
  /// **'Rate and review'**
  String get mCommonrateReview;

  /// No description provided for @mCommonyourReviewFeedbackValuable.
  ///
  /// In en, this message translates to:
  /// **'Your review and feedback is valuable in creating a robust learning experience'**
  String get mCommonyourReviewFeedbackValuable;

  /// No description provided for @mCommonrateThis.
  ///
  /// In en, this message translates to:
  /// **'Rate this'**
  String get mCommonrateThis;

  /// No description provided for @mCommongiveReview.
  ///
  /// In en, this message translates to:
  /// **'Give a review'**
  String get mCommongiveReview;

  /// No description provided for @mCommoncharacters.
  ///
  /// In en, this message translates to:
  /// **'characters'**
  String get mCommoncharacters;

  /// No description provided for @mCommonaddReview.
  ///
  /// In en, this message translates to:
  /// **'Add a review for this'**
  String get mCommonaddReview;

  /// No description provided for @mCommonexceededCharacters.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded 200 characters.'**
  String get mCommonexceededCharacters;

  /// No description provided for @mCommonrecommendCourse.
  ///
  /// In en, this message translates to:
  /// **'Recommend this course to your friends'**
  String get mCommonrecommendCourse;

  /// No description provided for @mCommonsubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get mCommonsubmit;

  /// No description provided for @mCommonupdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get mCommonupdate;

  /// No description provided for @mCommonthankYouForFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thank you for the feedback!!!'**
  String get mCommonthankYouForFeedback;

  /// No description provided for @mCommonyouCanUpdateYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'You can update your feedback at anytime.'**
  String get mCommonyouCanUpdateYourFeedback;

  /// No description provided for @mCommonOptionalBracket.
  ///
  /// In en, this message translates to:
  /// **'(optional)'**
  String get mCommonOptionalBracket;

  /// No description provided for @mCommonpreviewContentUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The preview for this type of content is unavailable. Please click on Start button above to view.'**
  String get mCommonpreviewContentUnavailable;

  /// No description provided for @mCommonmodule.
  ///
  /// In en, this message translates to:
  /// **'Module'**
  String get mCommonmodule;

  /// No description provided for @mCommoncourse.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get mCommoncourse;

  /// No description provided for @mCommonOptional.
  ///
  /// In en, this message translates to:
  /// **'optional'**
  String get mCommonOptional;

  /// No description provided for @mCommonviewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get mCommonviewDetails;

  /// No description provided for @mCommoncompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get mCommoncompleted;

  /// No description provided for @mCommoninProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get mCommoninProgress;

  /// No description provided for @mCommonnotStarted.
  ///
  /// In en, this message translates to:
  /// **'Not started'**
  String get mCommonnotStarted;

  /// No description provided for @mCommonnoSessionsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No sessions available in this batch'**
  String get mCommonnoSessionsAvailable;

  /// No description provided for @mCommonsessionHandouts.
  ///
  /// In en, this message translates to:
  /// **'Session Handouts'**
  String get mCommonsessionHandouts;

  /// No description provided for @mCommondownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get mCommondownload;

  /// No description provided for @mCuratedCollectionAll.
  ///
  /// In en, this message translates to:
  /// **'All Collections'**
  String get mCuratedCollectionAll;

  /// No description provided for @mCuratedCollectionPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular Collections'**
  String get mCuratedCollectionPopular;

  /// No description provided for @mCuratedCollectionTestingModule.
  ///
  /// In en, this message translates to:
  /// **'igot CuratedCollection'**
  String get mCuratedCollectionTestingModule;

  /// No description provided for @mCuratedCollectionExploreCbp.
  ///
  /// In en, this message translates to:
  /// **'Explore all CBPs from any collection within the learnhub'**
  String get mCuratedCollectionExploreCbp;

  /// No description provided for @mCommonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mCommonSearch;

  /// No description provided for @mCommonSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get mCommonSortBy;

  /// No description provided for @mCommonCourse.
  ///
  /// In en, this message translates to:
  /// **'COURSE'**
  String get mCommonCourse;

  /// No description provided for @mTabBites.
  ///
  /// In en, this message translates to:
  /// **'Bites'**
  String get mTabBites;

  /// No description provided for @mBitesComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get mBitesComingSoon;

  /// No description provided for @mCommonBtnGoback.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get mCommonBtnGoback;

  /// No description provided for @mCommonHubs.
  ///
  /// In en, this message translates to:
  /// **'Hubs'**
  String get mCommonHubs;

  /// No description provided for @mCommonLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get mCommonLearn;

  /// No description provided for @mCommonDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Discuss'**
  String get mCommonDiscuss;

  /// No description provided for @mCommonNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get mCommonNetwork;

  /// No description provided for @mCommonCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Competencies'**
  String get mCommonCompetencies;

  /// No description provided for @mCommonEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get mCommonEvents;

  /// No description provided for @mCommonMdoPortal.
  ///
  /// In en, this message translates to:
  /// **'MDO Portal'**
  String get mCommonMdoPortal;

  /// No description provided for @mCommonCbpPortal.
  ///
  /// In en, this message translates to:
  /// **'CBP Portal'**
  String get mCommonCbpPortal;

  /// No description provided for @mCommonCbcPortal.
  ///
  /// In en, this message translates to:
  /// **'CBC Portal'**
  String get mCommonCbcPortal;

  /// No description provided for @mCommonSpvPortal.
  ///
  /// In en, this message translates to:
  /// **'SPV Portal'**
  String get mCommonSpvPortal;

  /// No description provided for @mCommonFracDictionary.
  ///
  /// In en, this message translates to:
  /// **'Frac Dictionary'**
  String get mCommonFracDictionary;

  /// No description provided for @mCommonMore.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get mCommonMore;

  /// No description provided for @mCommonKnowledgeResources.
  ///
  /// In en, this message translates to:
  /// **'Knowledge Resources'**
  String get mCommonKnowledgeResources;

  /// No description provided for @mCommonDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get mCommonDashboard;

  /// No description provided for @mCommonSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get mCommonSettings;

  /// No description provided for @mCommonLastAdded.
  ///
  /// In en, this message translates to:
  /// **'Last added'**
  String get mCommonLastAdded;

  /// No description provided for @mCommonSortByName.
  ///
  /// In en, this message translates to:
  /// **'Sort By Name'**
  String get mCommonSortByName;

  /// No description provided for @mCommonConnections.
  ///
  /// In en, this message translates to:
  /// **'connections'**
  String get mCommonConnections;

  /// No description provided for @mCommonConnection.
  ///
  /// In en, this message translates to:
  /// **'connection'**
  String get mCommonConnection;

  /// No description provided for @mCommonAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get mCommonAll;

  /// No description provided for @mCommonMissionKarmyogi.
  ///
  /// In en, this message translates to:
  /// **'Mission Karmayogi'**
  String get mCommonMissionKarmyogi;

  /// No description provided for @mCommonAccountAndAccess.
  ///
  /// In en, this message translates to:
  /// **'Account and access'**
  String get mCommonAccountAndAccess;

  /// No description provided for @mCommonIgotMarketplace.
  ///
  /// In en, this message translates to:
  /// **'iGOT Marketplace'**
  String get mCommonIgotMarketplace;

  /// No description provided for @mCommonContentProvider.
  ///
  /// In en, this message translates to:
  /// **'Content provider'**
  String get mCommonContentProvider;

  /// No description provided for @mCommonFracing.
  ///
  /// In en, this message translates to:
  /// **'FRACing'**
  String get mCommonFracing;

  /// No description provided for @mCommonRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get mCommonRegister;

  /// No description provided for @mCommonOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get mCommonOr;

  /// No description provided for @mCommonSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get mCommonSignIn;

  /// No description provided for @mCommonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get mCommonUpdate;

  /// No description provided for @mCommonShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get mCommonShowAll;

  /// No description provided for @mTabDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Discuss'**
  String get mTabDiscuss;

  /// No description provided for @mDiscussSubTabAllDiscussions.
  ///
  /// In en, this message translates to:
  /// **'All discussions'**
  String get mDiscussSubTabAllDiscussions;

  /// No description provided for @mDiscussSidepanelCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get mDiscussSidepanelCategories;

  /// No description provided for @mDiscussSubTabTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get mDiscussSubTabTags;

  /// No description provided for @mDiscussSubTabYourDiscussions.
  ///
  /// In en, this message translates to:
  /// **'My discussions'**
  String get mDiscussSubTabYourDiscussions;

  /// No description provided for @mDiscussMsgNoDiscussions.
  ///
  /// In en, this message translates to:
  /// **'Click on the + button to start a new discussion'**
  String get mDiscussMsgNoDiscussions;

  /// No description provided for @mDiscussMsgClickToStart.
  ///
  /// In en, this message translates to:
  /// **'Recent posts'**
  String get mDiscussMsgClickToStart;

  /// No description provided for @mDiscussAskQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask a question or post an idea'**
  String get mDiscussAskQuestion;

  /// No description provided for @mDiscussSidepanelAlldiscussion.
  ///
  /// In en, this message translates to:
  /// **'All discussions'**
  String get mDiscussSidepanelAlldiscussion;

  /// No description provided for @mDiscussSidepanelTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get mDiscussSidepanelTags;

  /// No description provided for @mDiscussSidepanelMyDiscuss.
  ///
  /// In en, this message translates to:
  /// **'My Discussions'**
  String get mDiscussSidepanelMyDiscuss;

  /// No description provided for @mDiscussStartDiscussQues.
  ///
  /// In en, this message translates to:
  /// **'Question is mandatory'**
  String get mDiscussStartDiscussQues;

  /// No description provided for @mDiscussDescMandatory.
  ///
  /// In en, this message translates to:
  /// **'Description is mandatory'**
  String get mDiscussDescMandatory;

  /// No description provided for @mDiscussBtnSubmitPost.
  ///
  /// In en, this message translates to:
  /// **'Submit post'**
  String get mDiscussBtnSubmitPost;

  /// No description provided for @mDiscussComments.
  ///
  /// In en, this message translates to:
  /// **'comments'**
  String get mDiscussComments;

  /// No description provided for @mDiscussYourAnswerHere.
  ///
  /// In en, this message translates to:
  /// **'Your answer here'**
  String get mDiscussYourAnswerHere;

  /// No description provided for @mDiscussThisIsMandatory.
  ///
  /// In en, this message translates to:
  /// **'This is mandatory'**
  String get mDiscussThisIsMandatory;

  /// No description provided for @mDiscussPostReply.
  ///
  /// In en, this message translates to:
  /// **'Post reply'**
  String get mDiscussPostReply;

  /// No description provided for @mDiscussRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get mDiscussRecent;

  /// No description provided for @mDiscussReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get mDiscussReply;

  /// No description provided for @mDiscussLastReply.
  ///
  /// In en, this message translates to:
  /// **'Last reply'**
  String get mDiscussLastReply;

  /// No description provided for @mDiscussReplies.
  ///
  /// In en, this message translates to:
  /// **'replies'**
  String get mDiscussReplies;

  /// No description provided for @mDiscussCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get mDiscussCancel;

  /// No description provided for @mDiscussSiscussions.
  ///
  /// In en, this message translates to:
  /// **'Discussions'**
  String get mDiscussSiscussions;

  /// No description provided for @mDiscussPosts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get mDiscussPosts;

  /// No description provided for @mDiscussBestPosts.
  ///
  /// In en, this message translates to:
  /// **'Best posts'**
  String get mDiscussBestPosts;

  /// No description provided for @mDiscussSavedPosts.
  ///
  /// In en, this message translates to:
  /// **'Saved posts'**
  String get mDiscussSavedPosts;

  /// No description provided for @mDiscussUpVoted.
  ///
  /// In en, this message translates to:
  /// **'Upvoted'**
  String get mDiscussUpVoted;

  /// No description provided for @mDiscussDownVoted.
  ///
  /// In en, this message translates to:
  /// **'Downvoted'**
  String get mDiscussDownVoted;

  /// No description provided for @mDiscussNodata.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get mDiscussNodata;

  /// No description provided for @mDiscussDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get mDiscussDiscard;

  /// No description provided for @mDiscussLabelAllDiscussionRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get mDiscussLabelAllDiscussionRecent;

  /// No description provided for @mDiscussLabelAllDiscussionPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get mDiscussLabelAllDiscussionPopular;

  /// No description provided for @mDiscussBtnStartDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Start discussion'**
  String get mDiscussBtnStartDiscussion;

  /// No description provided for @mDiscussPlaceholderAskQuesPostIdea.
  ///
  /// In en, this message translates to:
  /// **'Ask a question or post an idea'**
  String get mDiscussPlaceholderAskQuesPostIdea;

  /// No description provided for @mDiscussLabelCategoriesAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get mDiscussLabelCategoriesAll;

  /// No description provided for @mDiscussLabelCategoriesWatching.
  ///
  /// In en, this message translates to:
  /// **'Watching'**
  String get mDiscussLabelCategoriesWatching;

  /// No description provided for @mDiscussPlaceholderTagsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search by name'**
  String get mDiscussPlaceholderTagsSearch;

  /// No description provided for @mDiscussDiscussionVotes.
  ///
  /// In en, this message translates to:
  /// **'Votes'**
  String get mDiscussDiscussionVotes;

  /// No description provided for @mDiscussDiscussionViews.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get mDiscussDiscussionViews;

  /// No description provided for @mNetworkTabNetworkHome.
  ///
  /// In en, this message translates to:
  /// **'Network home'**
  String get mNetworkTabNetworkHome;

  /// No description provided for @mNetworkSearchUser.
  ///
  /// In en, this message translates to:
  /// **'Search User'**
  String get mNetworkSearchUser;

  /// No description provided for @mNetworkTabYourConnections.
  ///
  /// In en, this message translates to:
  /// **'Your connections'**
  String get mNetworkTabYourConnections;

  /// No description provided for @mNetworkNoConnectionRequests.
  ///
  /// In en, this message translates to:
  /// **' No connection requests!'**
  String get mNetworkNoConnectionRequests;

  /// No description provided for @mNetworkTabConnectionRequests.
  ///
  /// In en, this message translates to:
  /// **'Connection Requests'**
  String get mNetworkTabConnectionRequests;

  /// No description provided for @mNetworkTabConnectionRequest.
  ///
  /// In en, this message translates to:
  /// **'Connection Request'**
  String get mNetworkTabConnectionRequest;

  /// No description provided for @mNetworkTabUsersFromMDO.
  ///
  /// In en, this message translates to:
  /// **'Users from MDO'**
  String get mNetworkTabUsersFromMDO;

  /// No description provided for @mNetworkTabFromYourMdo.
  ///
  /// In en, this message translates to:
  /// **'From Your MDO'**
  String get mNetworkTabFromYourMdo;

  /// No description provided for @mNetworkTabRecommendedConnections.
  ///
  /// In en, this message translates to:
  /// **'Recommended Connections'**
  String get mNetworkTabRecommendedConnections;

  /// No description provided for @mNetworkBtnSeeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get mNetworkBtnSeeMore;

  /// No description provided for @mNetworkUserSearch.
  ///
  /// In en, this message translates to:
  /// **'User Search'**
  String get mNetworkUserSearch;

  /// No description provided for @mNetworkShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show All'**
  String get mNetworkShowAll;

  /// No description provided for @mNetworkUserTabDiscussions.
  ///
  /// In en, this message translates to:
  /// **'Discussions'**
  String get mNetworkUserTabDiscussions;

  /// No description provided for @mNetworkUserUpvotes.
  ///
  /// In en, this message translates to:
  /// **'Upvotes'**
  String get mNetworkUserUpvotes;

  /// No description provided for @mCommonMonthsAgo.
  ///
  /// In en, this message translates to:
  /// **'months ago'**
  String get mCommonMonthsAgo;

  /// No description provided for @mCommonViews.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get mCommonViews;

  /// No description provided for @mCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Competencies'**
  String get mCompetencies;

  /// No description provided for @mTabYourCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Your Competencies'**
  String get mTabYourCompetencies;

  /// No description provided for @mTabAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'All Competencies'**
  String get mTabAllCompetencies;

  /// No description provided for @mCompetenciesLabelRecommendCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Recommended competencies'**
  String get mCompetenciesLabelRecommendCompetencies;

  /// No description provided for @mCompetenciesTabAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'All competencies'**
  String get mCompetenciesTabAllCompetencies;

  /// No description provided for @mCompetenciesAcquiredByYou.
  ///
  /// In en, this message translates to:
  /// **'Acquired By You'**
  String get mCompetenciesAcquiredByYou;

  /// No description provided for @mCompetenciesDesired.
  ///
  /// In en, this message translates to:
  /// **'Desired'**
  String get mCompetenciesDesired;

  /// No description provided for @mCompetenciesFromFRAC.
  ///
  /// In en, this message translates to:
  /// **'From FRAC'**
  String get mCompetenciesFromFRAC;

  /// No description provided for @mCompetenciesFromWAT.
  ///
  /// In en, this message translates to:
  /// **'From WAT'**
  String get mCompetenciesFromWAT;

  /// No description provided for @mCompetenciesCbpCourse.
  ///
  /// In en, this message translates to:
  /// **'CBP course'**
  String get mCompetenciesCbpCourse;

  /// No description provided for @mCompetenciesSelfAttestation.
  ///
  /// In en, this message translates to:
  /// **'Self attestation'**
  String get mCompetenciesSelfAttestation;

  /// No description provided for @mCompetenciesAddCompetency.
  ///
  /// In en, this message translates to:
  /// **'Add a competency'**
  String get mCompetenciesAddCompetency;

  /// No description provided for @mCompetenciesRecommendedBasedOnPosition.
  ///
  /// In en, this message translates to:
  /// **'Competencies will be recommended based on your position.'**
  String get mCompetenciesRecommendedBasedOnPosition;

  /// No description provided for @mCommonReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get mCommonReadMore;

  /// No description provided for @mCompetencyRemoveBtn.
  ///
  /// In en, this message translates to:
  /// **'Remove from your competency'**
  String get mCompetencyRemoveBtn;

  /// No description provided for @mCompetencyBackToAll.
  ///
  /// In en, this message translates to:
  /// **'Back to \'All competencies\''**
  String get mCompetencyBackToAll;

  /// No description provided for @mCompLabelCompetencyType.
  ///
  /// In en, this message translates to:
  /// **'Competency type:'**
  String get mCompLabelCompetencyType;

  /// No description provided for @mCompLabelCompetencyArea.
  ///
  /// In en, this message translates to:
  /// **'Competency area:'**
  String get mCompLabelCompetencyArea;

  /// No description provided for @mCompLabelAllCbps.
  ///
  /// In en, this message translates to:
  /// **'All associated CBPs'**
  String get mCompLabelAllCbps;

  /// No description provided for @mCompLabelCbpsFor.
  ///
  /// In en, this message translates to:
  /// **'CBPs for'**
  String get mCompLabelCbpsFor;

  /// No description provided for @mCompLabelNoCbps.
  ///
  /// In en, this message translates to:
  /// **'No CBPs found!'**
  String get mCompLabelNoCbps;

  /// No description provided for @mCompLabelFilterBy.
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get mCompLabelFilterBy;

  /// No description provided for @mCompLabelAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get mCompLabelAudio;

  /// No description provided for @mCompLabelPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get mCompLabelPdf;

  /// No description provided for @mCompLabelWebpage.
  ///
  /// In en, this message translates to:
  /// **'Webpage'**
  String get mCompLabelWebpage;

  /// No description provided for @mCompLabelCourse.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get mCompLabelCourse;

  /// No description provided for @mCompLabelPopularCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Popular competencies'**
  String get mCompLabelPopularCompetencies;

  /// No description provided for @mCompLabelNocompetenciesfound.
  ///
  /// In en, this message translates to:
  /// **'No competencies found!'**
  String get mCompLabelNocompetenciesfound;

  /// No description provided for @mCompLabelAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'All competencies'**
  String get mCompLabelAllCompetencies;

  /// No description provided for @mCompLabelSortBy.
  ///
  /// In en, this message translates to:
  /// **'z'**
  String get mCompLabelSortBy;

  /// No description provided for @mCompLabelAscending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get mCompLabelAscending;

  /// No description provided for @mCompLabelDescending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get mCompLabelDescending;

  /// No description provided for @mCompLabelSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mCompLabelSearch;

  /// No description provided for @mCompLabelQuickExplore.
  ///
  /// In en, this message translates to:
  /// **'Quick explore'**
  String get mCompLabelQuickExplore;

  /// No description provided for @mCompLabelSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get mCompLabelSeeAll;

  /// No description provided for @mEventsLabelTodayEvent.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Events'**
  String get mEventsLabelTodayEvent;

  /// No description provided for @mEventsLabelLiveEvent.
  ///
  /// In en, this message translates to:
  /// **'Live Events'**
  String get mEventsLabelLiveEvent;

  /// No description provided for @mEventsNoEvent.
  ///
  /// In en, this message translates to:
  /// **'No Event'**
  String get mEventsNoEvent;

  /// No description provided for @mEventsLabelAllEvents.
  ///
  /// In en, this message translates to:
  /// **'All Events'**
  String get mEventsLabelAllEvents;

  /// No description provided for @mEventsAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get mEventsAll;

  /// No description provided for @mEventsTypoWebinar.
  ///
  /// In en, this message translates to:
  /// **'Webinar'**
  String get mEventsTypoWebinar;

  /// No description provided for @mEventsBtnViewRecording.
  ///
  /// In en, this message translates to:
  /// **'View recording'**
  String get mEventsBtnViewRecording;

  /// No description provided for @mEventsTabCuratedEvents.
  ///
  /// In en, this message translates to:
  /// **'Curated Events'**
  String get mEventsTabCuratedEvents;

  /// No description provided for @mEventsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Karmayogi Bharat'**
  String get mEventsCardTitle;

  /// No description provided for @mEventsEventDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mEventsEventDescription;

  /// No description provided for @mEventsEventPresenters.
  ///
  /// In en, this message translates to:
  /// **'Presenters'**
  String get mEventsEventPresenters;

  /// No description provided for @mEventsEventAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get mEventsEventAgenda;

  /// No description provided for @mEventsBtnEventCompleted.
  ///
  /// In en, this message translates to:
  /// **'Event is completed'**
  String get mEventsBtnEventCompleted;

  /// No description provided for @mEventsEventType.
  ///
  /// In en, this message translates to:
  /// **'Event Type'**
  String get mEventsEventType;

  /// No description provided for @mEventsEventHostedBy.
  ///
  /// In en, this message translates to:
  /// **'Hosted By'**
  String get mEventsEventHostedBy;

  /// No description provided for @mEventsBtnYetToStart.
  ///
  /// In en, this message translates to:
  /// **'Event is yet to start'**
  String get mEventsBtnYetToStart;

  /// No description provided for @mEventsType.
  ///
  /// In en, this message translates to:
  /// **'Event Type'**
  String get mEventsType;

  /// No description provided for @mEvents.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get mEvents;

  /// No description provided for @mEventsHostedBy.
  ///
  /// In en, this message translates to:
  /// **'Hosted By'**
  String get mEventsHostedBy;

  /// No description provided for @mEventsLastUpdatedOn.
  ///
  /// In en, this message translates to:
  /// **'Last updated on'**
  String get mEventsLastUpdatedOn;

  /// No description provided for @mEventsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mEventsDescription;

  /// No description provided for @mEventsPresenters.
  ///
  /// In en, this message translates to:
  /// **'Presenters'**
  String get mEventsPresenters;

  /// No description provided for @mEventsAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get mEventsAgenda;

  /// No description provided for @mEventsHost.
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get mEventsHost;

  /// No description provided for @mCommonMsgCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get mCommonMsgCompleted;

  /// No description provided for @mCommonLastUpdatedOn.
  ///
  /// In en, this message translates to:
  /// **'Last updated on'**
  String get mCommonLastUpdatedOn;

  /// No description provided for @mCommonExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get mCommonExpiryDate;

  /// No description provided for @mCommonLearningMode.
  ///
  /// In en, this message translates to:
  /// **'Learning mode'**
  String get mCommonLearningMode;

  /// No description provided for @mCommonRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get mCommonRegion;

  /// No description provided for @mCommonLicense.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get mCommonLicense;

  /// No description provided for @mCommonLocale.
  ///
  /// In en, this message translates to:
  /// **'Locale'**
  String get mCommonLocale;

  /// No description provided for @mCommonHasTranslations.
  ///
  /// In en, this message translates to:
  /// **'Has translations'**
  String get mCommonHasTranslations;

  /// No description provided for @mCommonKeywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get mCommonKeywords;

  /// No description provided for @mCommonSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get mCommonSize;

  /// No description provided for @mCommonContentType.
  ///
  /// In en, this message translates to:
  /// **'Content type'**
  String get mCommonContentType;

  /// No description provided for @mCommonComplexityLevel.
  ///
  /// In en, this message translates to:
  /// **'Complexity level'**
  String get mCommonComplexityLevel;

  /// No description provided for @mCommonDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get mCommonDuration;

  /// No description provided for @mCommonCost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get mCommonCost;

  /// No description provided for @mCommonViewCount.
  ///
  /// In en, this message translates to:
  /// **'View count'**
  String get mCommonViewCount;

  /// No description provided for @mCommonSourceName.
  ///
  /// In en, this message translates to:
  /// **'Source name'**
  String get mCommonSourceName;

  /// No description provided for @mCommonStructure.
  ///
  /// In en, this message translates to:
  /// **'Structure'**
  String get mCommonStructure;

  /// No description provided for @mCommonBatchDate.
  ///
  /// In en, this message translates to:
  /// **'Batch date'**
  String get mCommonBatchDate;

  /// No description provided for @mCommonBatchDuration.
  ///
  /// In en, this message translates to:
  /// **'Batch duration'**
  String get mCommonBatchDuration;

  /// No description provided for @mCommonEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Enrolled'**
  String get mCommonEnrolled;

  /// No description provided for @mCommonRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get mCommonRejected;

  /// No description provided for @mCommonTotalApplied.
  ///
  /// In en, this message translates to:
  /// **'Total applied'**
  String get mCommonTotalApplied;

  /// No description provided for @mCommonDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get mCommonDownload;

  /// No description provided for @mCommonPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get mCommonPdf;

  /// No description provided for @mCommonPng.
  ///
  /// In en, this message translates to:
  /// **'PNG'**
  String get mCommonPng;

  /// No description provided for @mCommonSvg.
  ///
  /// In en, this message translates to:
  /// **'SVG'**
  String get mCommonSvg;

  /// No description provided for @mCommonCongratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get mCommonCongratulations;

  /// No description provided for @mCommonYourCertificateAvailableShortly.
  ///
  /// In en, this message translates to:
  /// **'Your certificate of completion will be available shortly.'**
  String get mCommonYourCertificateAvailableShortly;

  /// No description provided for @mCommonWouldLoveHearExperience.
  ///
  /// In en, this message translates to:
  /// **'We would love to hear about your experience, so please take a moment to'**
  String get mCommonWouldLoveHearExperience;

  /// No description provided for @mCommonRateTheCourse.
  ///
  /// In en, this message translates to:
  /// **'Rate the course'**
  String get mCommonRateTheCourse;

  /// No description provided for @mCommonShareYourThoughts.
  ///
  /// In en, this message translates to:
  /// **'and share your thoughts with us.'**
  String get mCommonShareYourThoughts;

  /// No description provided for @mCommonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get mCommonClose;

  /// No description provided for @mContactHeaderForAnyTech.
  ///
  /// In en, this message translates to:
  /// **'For any technical issues please contact'**
  String get mContactHeaderForAnyTech;

  /// No description provided for @mContactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get mContactEmail;

  /// No description provided for @mContactHelpDesk.
  ///
  /// In en, this message translates to:
  /// **'Helpdesk'**
  String get mContactHelpDesk;

  /// No description provided for @mContactCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get mContactCall;

  /// No description provided for @mContactVideoConference.
  ///
  /// In en, this message translates to:
  /// **'We are now available on Video Conference'**
  String get mContactVideoConference;

  /// No description provided for @mContactSupportReqd.
  ///
  /// In en, this message translates to:
  /// **'For any Support Required'**
  String get mContactSupportReqd;

  /// No description provided for @mContactWeekDays.
  ///
  /// In en, this message translates to:
  /// **'Monday to Friday'**
  String get mContactWeekDays;

  /// No description provided for @mContactBtnJoinNow.
  ///
  /// In en, this message translates to:
  /// **'Join Now'**
  String get mContactBtnJoinNow;

  /// No description provided for @mTourGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get mTourGetStarted;

  /// No description provided for @mTourWelcomeNote.
  ///
  /// In en, this message translates to:
  /// **'Namaste! Welcome to the journey of anytime anywhere learning.'**
  String get mTourWelcomeNote;

  /// No description provided for @mTourWhatIsiGOTKarmayogi.
  ///
  /// In en, this message translates to:
  /// **'What is iGOT Karmayogi?'**
  String get mTourWhatIsiGOTKarmayogi;

  /// No description provided for @mTourTakeTour.
  ///
  /// In en, this message translates to:
  /// **'Take a tour'**
  String get mTourTakeTour;

  /// No description provided for @mTourSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get mTourSkip;

  /// No description provided for @mTourNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get mTourNext;

  /// No description provided for @mTourPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get mTourPrevious;

  /// No description provided for @mTourFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get mTourFinish;

  /// No description provided for @mTourStartNow.
  ///
  /// In en, this message translates to:
  /// **'You are all set to start your learning journey.'**
  String get mTourStartNow;

  /// No description provided for @mTourCongrats.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get mTourCongrats;

  /// No description provided for @mTourStepLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get mTourStepLearn;

  /// No description provided for @mTourStepDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Discuss'**
  String get mTourStepDiscuss;

  /// No description provided for @mTourDiscussContent.
  ///
  /// In en, this message translates to:
  /// **'Discuss new ideas with colleagues and experts in the government.'**
  String get mTourDiscussContent;

  /// No description provided for @mTourStepSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mTourStepSearch;

  /// No description provided for @mTourSearchContent.
  ///
  /// In en, this message translates to:
  /// **'Find the perfect course and program tailor-made for you.'**
  String get mTourSearchContent;

  /// No description provided for @mTourStepMyProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get mTourStepMyProfile;

  /// No description provided for @mTourMyProfileContent.
  ///
  /// In en, this message translates to:
  /// **'Update your information to get the best-suited courses and programs.'**
  String get mTourMyProfileContent;

  /// No description provided for @mSettingGeneralSettings.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get mSettingGeneralSettings;

  /// No description provided for @mSettingNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get mSettingNotifications;

  /// No description provided for @mSettingAccountAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Account and Password'**
  String get mSettingAccountAndPassword;

  /// No description provided for @mSettingPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get mSettingPrivacy;

  /// No description provided for @mSettingGetStartedTour.
  ///
  /// In en, this message translates to:
  /// **'\'Get Started\' tour'**
  String get mSettingGetStartedTour;

  /// No description provided for @mCourseBatchEnrollL1Msg.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment request is being reviewed. You will be notified when it is approved.'**
  String get mCourseBatchEnrollL1Msg;

  /// No description provided for @mCourseBatchEnrollL2Msg.
  ///
  /// In en, this message translates to:
  /// **'We are now reviewing your request. You will be notified when it is approved.'**
  String get mCourseBatchEnrollL2Msg;

  /// No description provided for @mCourseBatchEnrollDelayMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you still waiting for the approval?'**
  String get mCourseBatchEnrollDelayMsg;

  /// No description provided for @mCourseBatchEnrollApprovedMsg.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment is now approved.'**
  String get mCourseBatchEnrollApprovedMsg;

  /// No description provided for @mCourseBatchEnrollRejectedMsg.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment request for the selected batch has been rejected.'**
  String get mCourseBatchEnrollRejectedMsg;

  /// No description provided for @mCourseBatchEnrollRemoveMsg.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment request for the selected batch has been removed.'**
  String get mCourseBatchEnrollRemoveMsg;

  /// No description provided for @mCourseBatchEnrollSupportMsg.
  ///
  /// In en, this message translates to:
  /// **'For help, write to us at '**
  String get mCourseBatchEnrollSupportMsg;

  /// No description provided for @mCourseBatchEnrollWithdrawMsg.
  ///
  /// In en, this message translates to:
  /// **'Your request to withdraw from this blended program has been successfully processed.'**
  String get mCourseBatchEnrollWithdrawMsg;

  /// No description provided for @mCourseBatchListExpiredMsg.
  ///
  /// In en, this message translates to:
  /// **'You can\'t enroll into this blended program.'**
  String get mCourseBatchListExpiredMsg;

  /// No description provided for @mProfileHome.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get mProfileHome;

  /// No description provided for @mProfileNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get mProfileNetwork;

  /// No description provided for @mProfileUpdateprofile.
  ///
  /// In en, this message translates to:
  /// **'Update profile'**
  String get mProfileUpdateprofile;

  /// No description provided for @mProfilePersonalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get mProfilePersonalDetails;

  /// No description provided for @mProfileMaxFileSize.
  ///
  /// In en, this message translates to:
  /// **'Max file size: 1 MB'**
  String get mProfileMaxFileSize;

  /// No description provided for @mProfileSupportedFiles.
  ///
  /// In en, this message translates to:
  /// **'Supported file types: JPG, JPEG, PNG'**
  String get mProfileSupportedFiles;

  /// No description provided for @mProfileFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get mProfileFullName;

  /// No description provided for @mProfileEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get mProfileEnterFullName;

  /// No description provided for @mProfileFullNameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Full name is mandatory'**
  String get mProfileFullNameMandatory;

  /// No description provided for @mProfileFullNameWithConditions.
  ///
  /// In en, this message translates to:
  /// **'Name field can only contain letters, space and the character (\').'**
  String get mProfileFullNameWithConditions;

  /// No description provided for @mProfileDOB.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get mProfileDOB;

  /// No description provided for @mProfileDOBMandatory.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth is mandatory'**
  String get mProfileDOBMandatory;

  /// No description provided for @mProfileNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get mProfileNationality;

  /// No description provided for @mProfileMotherTongue.
  ///
  /// In en, this message translates to:
  /// **'Mother Tongue'**
  String get mProfileMotherTongue;

  /// No description provided for @mProfileDomicileMandatory.
  ///
  /// In en, this message translates to:
  /// **'Domicile Medium is mandatory'**
  String get mProfileDomicileMandatory;

  /// No description provided for @mProfileDomicileEror.
  ///
  /// In en, this message translates to:
  /// **'Please choose a value from the list provided above.'**
  String get mProfileDomicileEror;

  /// No description provided for @mProfileGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get mProfileGender;

  /// No description provided for @mProfileMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get mProfileMale;

  /// No description provided for @mProfileFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get mProfileFemale;

  /// No description provided for @mProfileOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get mProfileOthers;

  /// No description provided for @mProfileMartalStatus.
  ///
  /// In en, this message translates to:
  /// **'Marital Status'**
  String get mProfileMartalStatus;

  /// No description provided for @mProfileSingle.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get mProfileSingle;

  /// No description provided for @mProfileMarried.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get mProfileMarried;

  /// No description provided for @mProfileCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get mProfileCategory;

  /// No description provided for @mProfileGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get mProfileGeneral;

  /// No description provided for @mProfileOBC.
  ///
  /// In en, this message translates to:
  /// **'OBC'**
  String get mProfileOBC;

  /// No description provided for @mProfileSC.
  ///
  /// In en, this message translates to:
  /// **'SC'**
  String get mProfileSC;

  /// No description provided for @mProfileST.
  ///
  /// In en, this message translates to:
  /// **'ST'**
  String get mProfileST;

  /// No description provided for @mProfileOtherLanguages.
  ///
  /// In en, this message translates to:
  /// **'Other Languages Known'**
  String get mProfileOtherLanguages;

  /// No description provided for @mProfileOtherLanguageMandatory.
  ///
  /// In en, this message translates to:
  /// **'Other Languages Known is mandatory'**
  String get mProfileOtherLanguageMandatory;

  /// No description provided for @mProfileMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mProfileMobileNumber;

  /// No description provided for @mProfileMobileNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get mProfileMobileNumberError;

  /// No description provided for @mProfileMobileNumberLengthError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10 digit mobile number'**
  String get mProfileMobileNumberLengthError;

  /// No description provided for @mProfileGetOTP.
  ///
  /// In en, this message translates to:
  /// **'Get OTP'**
  String get mProfileGetOTP;

  /// No description provided for @mProfileResendOTPAfter.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP after'**
  String get mProfileResendOTPAfter;

  /// No description provided for @mProfileResendOTP.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get mProfileResendOTP;

  /// No description provided for @mProfileVerifyOTP.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get mProfileVerifyOTP;

  /// No description provided for @mProfileTelephoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Telephone Number (e.g., 0123-26104183)'**
  String get mProfileTelephoneNumber;

  /// No description provided for @mProfileTelephoneNumberValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid telephone number (e.g., 0123-26104183)'**
  String get mProfileTelephoneNumberValidation;

  /// No description provided for @mProfileTelePhoneMandatory.
  ///
  /// In en, this message translates to:
  /// **'Telephone Number is mandatory'**
  String get mProfileTelePhoneMandatory;

  /// No description provided for @mProfilePrimaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Primary Email'**
  String get mProfilePrimaryEmail;

  /// No description provided for @mProfilePrimaryEmailMandatory.
  ///
  /// In en, this message translates to:
  /// **'Primary Email is mandatory'**
  String get mProfilePrimaryEmailMandatory;

  /// No description provided for @mProfileOfficialEmail.
  ///
  /// In en, this message translates to:
  /// **'This is my official email'**
  String get mProfileOfficialEmail;

  /// No description provided for @mProfileSecondaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Secondary Email'**
  String get mProfileSecondaryEmail;

  /// No description provided for @mProfileSecondaryEmailValidation.
  ///
  /// In en, this message translates to:
  /// **'Max 64 characters before \'@\' & 255 characters after \'@\' are valid.'**
  String get mProfileSecondaryEmailValidation;

  /// No description provided for @mProfilePostalAddress.
  ///
  /// In en, this message translates to:
  /// **'Postal Address'**
  String get mProfilePostalAddress;

  /// No description provided for @mProfilePostalAddressMandatory.
  ///
  /// In en, this message translates to:
  /// **'Postal Address is mandatory'**
  String get mProfilePostalAddressMandatory;

  /// No description provided for @mProfilePostalAddressLengthValidation.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded 200 characters.'**
  String get mProfilePostalAddressLengthValidation;

  /// No description provided for @mProfileAddressPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Type Your Residence Address Here'**
  String get mProfileAddressPlaceholder;

  /// No description provided for @mProfilePinCode.
  ///
  /// In en, this message translates to:
  /// **'Pin Code'**
  String get mProfilePinCode;

  /// No description provided for @mProfilePinMandatory.
  ///
  /// In en, this message translates to:
  /// **'Pin Code is mandatory'**
  String get mProfilePinMandatory;

  /// No description provided for @mProfilePinLength.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 6 digit pincode'**
  String get mProfilePinLength;

  /// No description provided for @mProfileEarnKarmayogiBadge.
  ///
  /// In en, this message translates to:
  /// **'Earn your Karmayogi Badge today'**
  String get mProfileEarnKarmayogiBadge;

  /// No description provided for @mProfileTenth.
  ///
  /// In en, this message translates to:
  /// **'10th Standard'**
  String get mProfileTenth;

  /// No description provided for @mProfileSchoolName.
  ///
  /// In en, this message translates to:
  /// **'School Name'**
  String get mProfileSchoolName;

  /// No description provided for @mProfileSchoolNameMandatory.
  ///
  /// In en, this message translates to:
  /// **'School Name is mandatory'**
  String get mProfileSchoolNameMandatory;

  /// No description provided for @mProfileTwelveth.
  ///
  /// In en, this message translates to:
  /// **'12th Standard'**
  String get mProfileTwelveth;

  /// No description provided for @mProfileYearOfPassing.
  ///
  /// In en, this message translates to:
  /// **'Year of Passing'**
  String get mProfileYearOfPassing;

  /// No description provided for @mProfileValidFourDigit.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 4 digit year'**
  String get mProfileValidFourDigit;

  /// No description provided for @mProfileGraduationDetails.
  ///
  /// In en, this message translates to:
  /// **'Graduation Details'**
  String get mProfileGraduationDetails;

  /// No description provided for @mProfileDegree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get mProfileDegree;

  /// No description provided for @mProfileOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get mProfileOther;

  /// No description provided for @mProfileOtherGraduationMandatory.
  ///
  /// In en, this message translates to:
  /// **'Other Graduation Name is mandatory'**
  String get mProfileOtherGraduationMandatory;

  /// No description provided for @mProfileInstituteName.
  ///
  /// In en, this message translates to:
  /// **'Institute Name'**
  String get mProfileInstituteName;

  /// No description provided for @mProfileInstituteNameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Institute Name is mandatory'**
  String get mProfileInstituteNameMandatory;

  /// No description provided for @mProfileAddOtherQualification.
  ///
  /// In en, this message translates to:
  /// **'Add Other Qualification'**
  String get mProfileAddOtherQualification;

  /// No description provided for @mProfilePostGraduationDetails.
  ///
  /// In en, this message translates to:
  /// **'Post Graduation Details'**
  String get mProfilePostGraduationDetails;

  /// No description provided for @mProfileProfessionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Professional Details'**
  String get mProfileProfessionalDetails;

  /// No description provided for @mProfileGovernmentOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Government Organisation'**
  String get mProfileGovernmentOrganisation;

  /// No description provided for @mProfileNonGovernmentOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Non-Government Organisation'**
  String get mProfileNonGovernmentOrganisation;

  /// No description provided for @mProfileOrganisationName.
  ///
  /// In en, this message translates to:
  /// **'Organisation Name'**
  String get mProfileOrganisationName;

  /// No description provided for @mProfileOtherOrganisationMandatory.
  ///
  /// In en, this message translates to:
  /// **'Other Organisation Name is mandatory'**
  String get mProfileOtherOrganisationMandatory;

  /// No description provided for @mProfileIndustry.
  ///
  /// In en, this message translates to:
  /// **'Industry'**
  String get mProfileIndustry;

  /// No description provided for @mProfileOtherIndustryName.
  ///
  /// In en, this message translates to:
  /// **'Other Industry Name is mandatory'**
  String get mProfileOtherIndustryName;

  /// No description provided for @mProfileDesignation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get mProfileDesignation;

  /// No description provided for @mProfileOtherDesignationMandatory.
  ///
  /// In en, this message translates to:
  /// **'Other Designation Name is mandatory'**
  String get mProfileOtherDesignationMandatory;

  /// No description provided for @mProfileCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get mProfileCountry;

  /// No description provided for @mProfileDateOfJoining.
  ///
  /// In en, this message translates to:
  /// **'Date of Joining'**
  String get mProfileDateOfJoining;

  /// No description provided for @mProfileDateOfJoiningMandatory.
  ///
  /// In en, this message translates to:
  /// **'Date of Joining is mandatory'**
  String get mProfileDateOfJoiningMandatory;

  /// No description provided for @mProfileDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mProfileDescription;

  /// No description provided for @mProfileDescriptionLength.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded 500 characters.'**
  String get mProfileDescriptionLength;

  /// No description provided for @mProfileCharacters.
  ///
  /// In en, this message translates to:
  /// **'characters'**
  String get mProfileCharacters;

  /// No description provided for @mProfileOtherDetailsGovernmentEmployees.
  ///
  /// In en, this message translates to:
  /// **'Other Details For Government Employees (If Applicable)'**
  String get mProfileOtherDetailsGovernmentEmployees;

  /// No description provided for @mProfilePayBand.
  ///
  /// In en, this message translates to:
  /// **'Pay Band (Grade Pay)'**
  String get mProfilePayBand;

  /// No description provided for @mProfileService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get mProfileService;

  /// No description provided for @mProfileCadre.
  ///
  /// In en, this message translates to:
  /// **'Cadre'**
  String get mProfileCadre;

  /// No description provided for @mProfileAllotmentYearOfService.
  ///
  /// In en, this message translates to:
  /// **'Allotment Year of Service'**
  String get mProfileAllotmentYearOfService;

  /// No description provided for @mProfileCivilListNumber.
  ///
  /// In en, this message translates to:
  /// **'Civil List Number'**
  String get mProfileCivilListNumber;

  /// No description provided for @mProfileCivilListNumberMandatory.
  ///
  /// In en, this message translates to:
  /// **'Civil List Number is mandatory'**
  String get mProfileCivilListNumberMandatory;

  /// No description provided for @mProfileEmployeeCode.
  ///
  /// In en, this message translates to:
  /// **'Employee Code'**
  String get mProfileEmployeeCode;

  /// No description provided for @mProfileEmployeeCodeMandatory.
  ///
  /// In en, this message translates to:
  /// **'Employee Code is mandatory'**
  String get mProfileEmployeeCodeMandatory;

  /// No description provided for @mProfileOfficePostalAddress.
  ///
  /// In en, this message translates to:
  /// **'Office Postal Address'**
  String get mProfileOfficePostalAddress;

  /// No description provided for @mProfileOfficePostalAddressMandatory.
  ///
  /// In en, this message translates to:
  /// **'Office Postal Address is mandatory'**
  String get mProfileOfficePostalAddressMandatory;

  /// No description provided for @mProfileOfficePostalAddressLength.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded 200 characters.'**
  String get mProfileOfficePostalAddressLength;

  /// No description provided for @mProfileTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get mProfileTags;

  /// No description provided for @mProfileNoTags.
  ///
  /// In en, this message translates to:
  /// **'No tags available'**
  String get mProfileNoTags;

  /// No description provided for @mProfileApproveRequest.
  ///
  /// In en, this message translates to:
  /// **'Once Your department will approve your request, System will unlock this section.'**
  String get mProfileApproveRequest;

  /// No description provided for @mProfileSaveDetails.
  ///
  /// In en, this message translates to:
  /// **'Save Details'**
  String get mProfileSaveDetails;

  /// No description provided for @mCommonFilterSearch.
  ///
  /// In en, this message translates to:
  /// **'Filter search'**
  String get mCommonFilterSearch;

  /// No description provided for @mCommonProgram.
  ///
  /// In en, this message translates to:
  /// **'Program'**
  String get mCommonProgram;

  /// No description provided for @mCommonLearningResource.
  ///
  /// In en, this message translates to:
  /// **'Learning Resource'**
  String get mCommonLearningResource;

  /// No description provided for @mCommonStandaloneAssessment.
  ///
  /// In en, this message translates to:
  /// **'Standalone Assessment'**
  String get mCommonStandaloneAssessment;

  /// No description provided for @mCommonModeratedCourses.
  ///
  /// In en, this message translates to:
  /// **'Moderated Courses'**
  String get mCommonModeratedCourses;

  /// No description provided for @mCommonBlendedProgram.
  ///
  /// In en, this message translates to:
  /// **'Blended Program'**
  String get mCommonBlendedProgram;

  /// No description provided for @mCommonCuratedProgram.
  ///
  /// In en, this message translates to:
  /// **'Curated Program'**
  String get mCommonCuratedProgram;

  /// No description provided for @mMsgNoEvent.
  ///
  /// In en, this message translates to:
  /// **'No Event'**
  String get mMsgNoEvent;

  /// No description provided for @mMsgSuccessfullyEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Successfully enrolled'**
  String get mMsgSuccessfullyEnrolled;

  /// No description provided for @mMsgFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get mMsgFailed;

  /// No description provided for @mMsgYourActionIsSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Your action is successful'**
  String get mMsgYourActionIsSuccessful;

  /// No description provided for @mMsgNoSearchResultFound.
  ///
  /// In en, this message translates to:
  /// **'No search results found!'**
  String get mMsgNoSearchResultFound;

  /// No description provided for @mMsgNoUserFound.
  ///
  /// In en, this message translates to:
  /// **'No users found!'**
  String get mMsgNoUserFound;

  /// No description provided for @mMsgShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show All'**
  String get mMsgShowAll;

  /// No description provided for @mMsgPeopleYouMayKnow.
  ///
  /// In en, this message translates to:
  /// **'People you may know'**
  String get mMsgPeopleYouMayKnow;

  /// No description provided for @mMsgSeeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get mMsgSeeMore;

  /// No description provided for @mMsgNoConnectionFound.
  ///
  /// In en, this message translates to:
  /// **'No connection found'**
  String get mMsgNoConnectionFound;

  /// No description provided for @mMsgSearchResult.
  ///
  /// In en, this message translates to:
  /// **'Search Results !'**
  String get mMsgSearchResult;

  /// No description provided for @mMsgMoRecommUser.
  ///
  /// In en, this message translates to:
  /// **'No recommended users!'**
  String get mMsgMoRecommUser;

  /// No description provided for @mMsgNoOpeningFound.
  ///
  /// In en, this message translates to:
  /// **'No Opening found'**
  String get mMsgNoOpeningFound;

  /// No description provided for @mMsgNoCompetenciesFound.
  ///
  /// In en, this message translates to:
  /// **'No competencies found'**
  String get mMsgNoCompetenciesFound;

  /// No description provided for @mMsgFindCompetenciesToAddFrom.
  ///
  /// In en, this message translates to:
  /// **'Find competencies to add from'**
  String get mMsgFindCompetenciesToAddFrom;

  /// No description provided for @mMsgAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'All competencies'**
  String get mMsgAllCompetencies;

  /// No description provided for @mMsgNotEnoughData.
  ///
  /// In en, this message translates to:
  /// **'Not enough data'**
  String get mMsgNotEnoughData;

  /// No description provided for @mMsgNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get mMsgNotFound;

  /// No description provided for @mMsgCbcPortal.
  ///
  /// In en, this message translates to:
  /// **'CBC Portal'**
  String get mMsgCbcPortal;

  /// No description provided for @mMsgSpvPortal.
  ///
  /// In en, this message translates to:
  /// **'SPV Portal'**
  String get mMsgSpvPortal;

  /// No description provided for @mMsgFracDictionary.
  ///
  /// In en, this message translates to:
  /// **'FRAC Dictionary'**
  String get mMsgFracDictionary;

  /// No description provided for @mMsgMore.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get mMsgMore;

  /// No description provided for @mMsgKnowledgeResources.
  ///
  /// In en, this message translates to:
  /// **'knowledge Resources'**
  String get mMsgKnowledgeResources;

  /// No description provided for @mMsgDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get mMsgDashboard;

  /// No description provided for @mMsgSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get mMsgSettings;

  /// No description provided for @mMsgNoDataFound.
  ///
  /// In en, this message translates to:
  /// **'No data found!'**
  String get mMsgNoDataFound;

  /// No description provided for @mCommonSearchResults.
  ///
  /// In en, this message translates to:
  /// **'search results'**
  String get mCommonSearchResults;

  /// No description provided for @mCommonSearchResult.
  ///
  /// In en, this message translates to:
  /// **'search result'**
  String get mCommonSearchResult;

  /// No description provided for @mCommonFor.
  ///
  /// In en, this message translates to:
  /// **'for'**
  String get mCommonFor;

  /// No description provided for @mCommonAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get mCommonAudio;

  /// No description provided for @mCommonPDF.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get mCommonPDF;

  /// No description provided for @mCommonWebpage.
  ///
  /// In en, this message translates to:
  /// **'Webpage'**
  String get mCommonWebpage;

  /// No description provided for @mCommonBy.
  ///
  /// In en, this message translates to:
  /// **'By'**
  String get mCommonBy;

  /// No description provided for @mCommonNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get mCommonNoResults;

  /// No description provided for @mCommonRemoveFilters.
  ///
  /// In en, this message translates to:
  /// **'Try removing the filters or search using different keywords'**
  String get mCommonRemoveFilters;

  /// No description provided for @mCommonHome.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get mCommonHome;

  /// No description provided for @mRegisterregister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get mRegisterregister;

  /// No description provided for @mRegisterfullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get mRegisterfullName;

  /// No description provided for @mRegisterfullNameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Full name is mandatory'**
  String get mRegisterfullNameMandatory;

  /// No description provided for @mRegisterenterYourFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get mRegisterenterYourFullName;

  /// No description provided for @mRegisterfullNameWitoutSp.
  ///
  /// In en, this message translates to:
  /// **'Name field can only contain letters, space and the character (.).'**
  String get mRegisterfullNameWitoutSp;

  /// No description provided for @mRegistergroup.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get mRegistergroup;

  /// No description provided for @mRegisterselectYourGroup.
  ///
  /// In en, this message translates to:
  /// **'Select your group'**
  String get mRegisterselectYourGroup;

  /// No description provided for @mRegistergroupMandatory.
  ///
  /// In en, this message translates to:
  /// **' Group is mandatory'**
  String get mRegistergroupMandatory;

  /// No description provided for @mRegisteremail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get mRegisteremail;

  /// No description provided for @mRegisterenterYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get mRegisterenterYourEmailAddress;

  /// No description provided for @mRegisterpleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get mRegisterpleaseEnterEmail;

  /// No description provided for @mRegistervalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get mRegistervalidEmail;

  /// No description provided for @mRegisteremailLengthValidation.
  ///
  /// In en, this message translates to:
  /// **'Max 64 characters before \'@\' & 255 characters after \'@\' are valid.'**
  String get mRegisteremailLengthValidation;

  /// No description provided for @mRegisterdonotHaveGovernmentEmail.
  ///
  /// In en, this message translates to:
  /// **'Do not have a government email address?'**
  String get mRegisterdonotHaveGovernmentEmail;

  /// No description provided for @mRegisterrequestForHelp.
  ///
  /// In en, this message translates to:
  /// **'Request for help'**
  String get mRegisterrequestForHelp;

  /// No description provided for @mRegistersendOTP.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get mRegistersendOTP;

  /// No description provided for @mRegisterenterOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get mRegisterenterOTP;

  /// No description provided for @mRegisterresendOTPAfter.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP after'**
  String get mRegisterresendOTPAfter;

  /// No description provided for @mRegisterresendOTP.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get mRegisterresendOTP;

  /// No description provided for @mRegisterverifyOTP.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get mRegisterverifyOTP;

  /// No description provided for @mRegistermobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mRegistermobileNumber;

  /// No description provided for @mRegisterEnterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get mRegisterEnterMobileNumber;

  /// No description provided for @mRegistervalidMobilenumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10 digit mobile number'**
  String get mRegistervalidMobilenumber;

  /// No description provided for @mRegistermobileOtp.
  ///
  /// In en, this message translates to:
  /// **'Mobile otp is required'**
  String get mRegistermobileOtp;

  /// No description provided for @mRegistercenterOrState.
  ///
  /// In en, this message translates to:
  /// **'Center/State'**
  String get mRegistercenterOrState;

  /// No description provided for @mRegistercenter.
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get mRegistercenter;

  /// No description provided for @mRegisterstate.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get mRegisterstate;

  /// No description provided for @mRegisterorganisation.
  ///
  /// In en, this message translates to:
  /// **'Organisation'**
  String get mRegisterorganisation;

  /// No description provided for @mRegistersearchOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Search organisation'**
  String get mRegistersearchOrganisation;

  /// No description provided for @mRegistersearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mRegistersearch;

  /// No description provided for @mRegisterenterOrganisationName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your organisation name'**
  String get mRegisterenterOrganisationName;

  /// No description provided for @mRegisternotFound.
  ///
  /// In en, this message translates to:
  /// **'Not found yet?'**
  String get mRegisternotFound;

  /// No description provided for @mRegisterunder.
  ///
  /// In en, this message translates to:
  /// **'Under'**
  String get mRegisterunder;

  /// No description provided for @mRegisternoMatchingSearch.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any matches for your search.'**
  String get mRegisternoMatchingSearch;

  /// No description provided for @mRegisterconfirmInfo.
  ///
  /// In en, this message translates to:
  /// **'I confirm that the above provided information is accurate.'**
  String get mRegisterconfirmInfo;

  /// No description provided for @mRegisteragree.
  ///
  /// In en, this message translates to:
  /// **'I agree to the iGOT karmayogi\'s'**
  String get mRegisteragree;

  /// No description provided for @mRegisterterms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get mRegisterterms;

  /// No description provided for @mRegistersignup.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get mRegistersignup;

  /// No description provided for @mRegisterhaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get mRegisterhaveAccount;

  /// No description provided for @mRegistersignin.
  ///
  /// In en, this message translates to:
  /// **'Sign in here'**
  String get mRegistersignin;

  /// No description provided for @mTermAndCondP25EffortsOnAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Though all efforts have been made to ensure the accuracy and currency of the content on the Platform, the same should not be construed as a statement of law or used for any legal purposes. In case of any ambiguity or doubts, Users are advised to verify/check with the concerned Ministry/Department/Organization and/or other source(s), and to obtain appropriate professional advice.'**
  String get mTermAndCondP25EffortsOnAccuracy;

  /// No description provided for @mTermAndCondP26PolicyLinked.
  ///
  /// In en, this message translates to:
  /// **'Hyperlinking Policy:'**
  String get mTermAndCondP26PolicyLinked;

  /// No description provided for @mTermAndCondP27LinkExternalWeb.
  ///
  /// In en, this message translates to:
  /// **'Links to external websites/portals'**
  String get mTermAndCondP27LinkExternalWeb;

  /// No description provided for @mTermAndCondP28LinksToOtherWebPortal.
  ///
  /// In en, this message translates to:
  /// **'At many places on the Platform, the User shall find links to other websites/portals. These links have been placed for the convenience of the User. The Platform is not responsible for the contents of the linked websites and does not necessarily endorse the views expressed in them. Mere presence of the link or its listing on the Platform should not be assumed as endorsement of any kind. The Platform cannot guarantee that these links will work all the time and have no control over availability of linked destinations.'**
  String get mTermAndCondP28LinksToOtherWebPortal;

  /// No description provided for @mTermAndCondP29LinksByOtherPlatform.
  ///
  /// In en, this message translates to:
  /// **'Links to the Platform by other websites/portals'**
  String get mTermAndCondP29LinksByOtherPlatform;

  /// No description provided for @mTermAndCondP30LinkInfoOnPlatform.
  ///
  /// In en, this message translates to:
  /// **'The User shall be free link the information on the Platform to other websites. However, the Platform needs to be informed about any links provided to it so that User can be informed of any changes or updates therein. Also, the Platform does not permit its pages to be loaded into frames on any other website. The pages belonging to the Platform must load into a newly opened browser window of the User.'**
  String get mTermAndCondP30LinkInfoOnPlatform;

  /// No description provided for @mTermAndCondP31ContentOnPlatform.
  ///
  /// In en, this message translates to:
  /// **'The Content on the Platform is for the use by the Users only and not for commercial exploitation. A User may not decompile, reverse engineer, disassemble, rent, lease, loan, sell, sublicense, or create derivative works from the Platform. Nor may User use any network monitoring or discovery software to determine the site architecture, or extract information about usage, individual identities or users. A User will not use any robot, spider, other automatic software or device, or manual process to monitor or copy the Platform without the Platform’s prior written permission. A User will not copy, modify, reproduce, republish, distribute, display, or transmit for commercial, non-profit or public purposes all or any portion of the Platform, except to the extent permitted by the copyright policy of this terms of use. Any unauthorized use of the Platform is prohibited. The use of any software (e.g. bots, scraper tools) or other automatic devices to access, monitor or copy the Platform is prohibited unless expressly authorized by the Platform in writing'**
  String get mTermAndCondP31ContentOnPlatform;

  /// No description provided for @mTermAndCondP32PlatformAndManager.
  ///
  /// In en, this message translates to:
  /// **'The Platform and its managers have no obligation to, and do not and cannot review every item of material or information that Service Provider make available through the Platform and are not responsible for any content of this material or information. However, the Platform reserves the right to delete, move, or edit any material or information that it deems, in its sole discretion, unacceptable, defamatory, abusive, or otherwise in violation of any law or that infringes or violates any rights of any other person or entity. Further, the Platform reserves the right, at all times, to disclose any material or information as necessary to satisfy any law, regulation, or governmental request.'**
  String get mTermAndCondP32PlatformAndManager;

  /// No description provided for @mTermAndCondP33UserAgreement.
  ///
  /// In en, this message translates to:
  /// **'User expressly agrees that use of the Service and the Platform is at the sole risk of the User. Neither the Platform nor any of its managers, employees, agents, distributors, third party content providers, or licensors (and their respective directors, officers, employees, and agents) warrant that the service or the Platform will be compatible on all devices or operating systems, uninterrupted or error free or that they will be free of viruses or other harmful components nor do they make any warranty as to the results that may be obtained from the use of the Platform or as to the accuracy, reliability, completeness, or contents of any content, information, material, postings, or posting responses found on the Platform, or any services provided through the Platform, or any links to other sites or services made available on the Platform.'**
  String get mTermAndCondP33UserAgreement;

  /// No description provided for @mTermAndCondP34CoursesTrainings.
  ///
  /// In en, this message translates to:
  /// **'The courses, trainings, all content, material, information, found on the platform, are provided on an \'as is\' basis without warranties of any kind, either expressed or implied. To the maximum extent permitted by law, the Platform makes no representations or warranties about the validity, accuracy, correctness, reliability, quality, stability, completeness or correctness of any information provided on or through the Platform or on any of the external links that are made available on the Platform. The Platform makes no representation that the services or training providing over the Platform would guarantee any promotions, advancements, raise, etc., professionally or academically.'**
  String get mTermAndCondP34CoursesTrainings;

  /// No description provided for @mTermAndCondP35TermsAndCondContrary.
  ///
  /// In en, this message translates to:
  /// **'Notwithstanding anything in the terms and conditions to the contrary, under no circumstances, including, but not limited to negligence, the Platform or its managers, any of its affiliates, assignees, successors-in-interest, employees, agents, distributors, third party content providers, partners, licensees, licensors, or sponsors or any of their respective directors, officers, employees, agents and independent contractors be liable for any direct, indirect, incidental, special or consequential damages, losses or expenses arising out of or relating to the use of, the misuse of, or the inability to use, any content, information, material, modules, features, links or other elements on the Platform or any failure of performance, error, omission, interruption, inconvenience, unauthorized access, defect, incorrect sequencing, delay in operation or transmission, virus, configuration or compatibility problem, or line or system failure. These limitations apply regardless of whether the party liable or allegedly liable was advised, had other reason to know, or in fact knew of the possibility of such damages, losses or expenses. User specifically acknowledge and agree that the Platform and/or any of its officers will not be liable for any defamatory, offensive or illegal conduct of any User.'**
  String get mTermAndCondP35TermsAndCondContrary;

  /// No description provided for @mTermAndCondP36MaximumExtentPermit.
  ///
  /// In en, this message translates to:
  /// **'To the maximum extent permitted by applicable law, User will defend, indemnify and hold harmless the Platform and any of its managers, parts, subsidiaries, affiliates, employees, agents, distributors, third party content providers, or licensors (and their respective directors, officers, employees, and agents)) from and against all claims, liability, and expenses, including attorneys\' fees and legal fees and costs, arising out of use of the Platform and/or breach of any provision of the terms and conditions. The Platform reserves the right, in its sole discretion and at its own expense, to assume the exclusive defense and control of any matter otherwise subject to indemnification by User. User will cooperate as fully as reasonably required in the defense of any claim.'**
  String get mTermAndCondP36MaximumExtentPermit;

  /// No description provided for @mTermAndCondP37SubmissionOnPlatform.
  ///
  /// In en, this message translates to:
  /// **'Any submissions made on the Platform by the User for assessment or for any other purpose, shall be the sole responsibility of the User and the User shall ensure that all submissions made on the Platform are compliant with the current terms and conditions. The Platform does not and cannot verify the contents of the submissions by each User and disclaims any liability from any harm, damage, injury, insult, etc., caused by the submission made by the User. In accordance with the Privacy Policy of the Platform and subject to the restrictions mentioned therein, the Platform shall be free to use any information'**
  String get mTermAndCondP37SubmissionOnPlatform;

  /// No description provided for @mTermAndCondP38PlatformMayTerminate.
  ///
  /// In en, this message translates to:
  /// **'The Platform may terminate the User\'s use of the Platform, or discontinue the service, at any time for breach of any of the terms and conditions and/or failure to pay for the training course or services. The Platform shall have the right, immediately upon notice, to terminate a User\'s use of the service in the event of any conduct by User is considered to be unacceptable, or in the event of any breach by the terms and conditions or if User is in violation of any applicable law.'**
  String get mTermAndCondP38PlatformMayTerminate;

  /// No description provided for @mTermAndCondP39DisputeArising.
  ///
  /// In en, this message translates to:
  /// **'Any disputes arising out of use of the Platform and the present terms and conditions shall be governed exclusively by the applicable laws of India, irrespective of the location of the User, without giving effect to their conflict of laws principles. User expressly consent to the exclusive jurisdiction, and venue of the Courts of New Delhi, India.'**
  String get mTermAndCondP39DisputeArising;

  /// No description provided for @mTermAndCondP40PlatformUserAck.
  ///
  /// In en, this message translates to:
  /// **'The Platform and the User acknowledge that other generally accepted standard terms and conditions and legal contractual obligations would apply wherever required and in case of any query or feedback for the Platform, User may use the feedback feature on the Platform or visit'**
  String get mTermAndCondP40PlatformUserAck;

  /// No description provided for @mTermAndCondP41LinktoPortal.
  ///
  /// In en, this message translates to:
  /// **'https://karmayogibharat.gov.in/'**
  String get mTermAndCondP41LinktoPortal;

  /// No description provided for @mTermAndCondP42Disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer for Content Published on Platform:'**
  String get mTermAndCondP42Disclaimer;

  /// No description provided for @mTermAndCondP43ContentPublishedOnPlatform.
  ///
  /// In en, this message translates to:
  /// **'All content published on Karmayogi platform is provided by various Ministries, Departments and other public and authorised private organisations. The concerned course publishers ensure the accuracy and currency of the content on this platform. Many courses provided by various departments relate to policies, rules, guidelines as applicable on the date of publication of the course.  All courses publishers strive to keep the most updated content, however the latest position of any law, rules, guidelines etc. may be accessed from the website of the concerned Ministries.'**
  String get mTermAndCondP43ContentPublishedOnPlatform;

  /// No description provided for @mTermAndCondP44GovernmentResponsibility.
  ///
  /// In en, this message translates to:
  /// **'In no event will the Government of India or Karmayogi Bharat SPV be liable for any expense, loss or damage including, without limitation, indirect or consequential loss or damage, or any expense, loss or damage whatsoever arising from use, or loss of use, of data, arising out of or in connection with the use of this platform. The platform makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability or availability of the published content. Links to other websites that have been included on this platform are provided for convenience only.'**
  String get mTermAndCondP44GovernmentResponsibility;

  /// No description provided for @mCardMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get mCardMore;

  /// No description provided for @mCardNoHubs.
  ///
  /// In en, this message translates to:
  /// **'No hubs Info Available'**
  String get mCardNoHubs;

  /// No description provided for @mCardDoMore.
  ///
  /// In en, this message translates to:
  /// **'Do more'**
  String get mCardDoMore;

  /// No description provided for @mCardKnowledgeResources.
  ///
  /// In en, this message translates to:
  /// **'Knowledge resources'**
  String get mCardKnowledgeResources;

  /// No description provided for @mCardKnowledgeResourcesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the latest policies, circulars and all available knowledge resources.'**
  String get mCardKnowledgeResourcesSubtitle;

  /// No description provided for @mCardDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get mCardDashboard;

  /// No description provided for @mCardDashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All your data represented as simple visualizations.'**
  String get mCardDashboardSubtitle;

  /// No description provided for @mCardSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get mCardSettings;

  /// No description provided for @mCardSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage all your preferences hessssre'**
  String get mCardSettingSubtitle;

  /// No description provided for @mCardQuickLinks.
  ///
  /// In en, this message translates to:
  /// **'Quick links'**
  String get mCardQuickLinks;

  /// No description provided for @mCardCbcPortaldesc.
  ///
  /// In en, this message translates to:
  /// **'Capacity Building Commission'**
  String get mCardCbcPortaldesc;

  /// No description provided for @mCardCbpPortaldesc.
  ///
  /// In en, this message translates to:
  /// **'Create and manage CBPs here'**
  String get mCardCbpPortaldesc;

  /// No description provided for @mCardMdoPortaldesc.
  ///
  /// In en, this message translates to:
  /// **'Manage MDO user access, work orders and events'**
  String get mCardMdoPortaldesc;

  /// No description provided for @mCardFracDictionarydesc.
  ///
  /// In en, this message translates to:
  /// **'The dictionary of framework of roles, activities and competencies.'**
  String get mCardFracDictionarydesc;

  /// No description provided for @mCardSpvPortaldesc.
  ///
  /// In en, this message translates to:
  /// **'Create and manage MDOs'**
  String get mCardSpvPortaldesc;

  /// No description provided for @mStaticKarmayogiBharat.
  ///
  /// In en, this message translates to:
  /// **'iGOT Karmayogi'**
  String get mStaticKarmayogiBharat;

  /// No description provided for @mStaticMinistry.
  ///
  /// In en, this message translates to:
  /// **'Ministry'**
  String get mStaticMinistry;

  /// No description provided for @mStaticDepartment.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get mStaticDepartment;

  /// No description provided for @mStaticBasicDetails.
  ///
  /// In en, this message translates to:
  /// **'BASIC DETAILS'**
  String get mStaticBasicDetails;

  /// No description provided for @mStaticOrgansationDetails.
  ///
  /// In en, this message translates to:
  /// **'ORGANISATION DETAILS'**
  String get mStaticOrgansationDetails;

  /// No description provided for @mStaticPositionDetails.
  ///
  /// In en, this message translates to:
  /// **'2. POSITION DETAILS'**
  String get mStaticPositionDetails;

  /// No description provided for @mStaticSelectHere.
  ///
  /// In en, this message translates to:
  /// **'Select here'**
  String get mStaticSelectHere;

  /// No description provided for @mStaticGovernmentEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'government email address'**
  String get mStaticGovernmentEmailAddress;

  /// No description provided for @mStaticEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'email address'**
  String get mStaticEmailAddress;

  /// No description provided for @mStaticPostionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not finding your position?'**
  String get mStaticPostionNotFound;

  /// No description provided for @mStaticNoOrganisationFound.
  ///
  /// In en, this message translates to:
  /// **'Did not find your organisation?'**
  String get mStaticNoOrganisationFound;

  /// No description provided for @mStaticWhatIsAnOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Do you know what is an organisation?'**
  String get mStaticWhatIsAnOrganisation;

  /// No description provided for @mStaticRequestForSupport.
  ///
  /// In en, this message translates to:
  /// **'Request for support'**
  String get mStaticRequestForSupport;

  /// No description provided for @mStaticMobileNumberHelper.
  ///
  /// In en, this message translates to:
  /// **'XXXXX-XXXXX'**
  String get mStaticMobileNumberHelper;

  /// No description provided for @mStaticSelectYourOrganisationType.
  ///
  /// In en, this message translates to:
  /// **'Select your organisation type'**
  String get mStaticSelectYourOrganisationType;

  /// No description provided for @mStaticSelectYourOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Select your organisation'**
  String get mStaticSelectYourOrganisation;

  /// No description provided for @mStaticKnowMore.
  ///
  /// In en, this message translates to:
  /// **'Know more'**
  String get mStaticKnowMore;

  /// No description provided for @mStaticPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Request to add the '**
  String get mStaticPageTitle;

  /// No description provided for @mStaticDescribePositionDetails.
  ///
  /// In en, this message translates to:
  /// **'Describe position details'**
  String get mStaticDescribePositionDetails;

  /// No description provided for @mStaticDomainRequest.
  ///
  /// In en, this message translates to:
  /// **'Request to add domain'**
  String get mStaticDomainRequest;

  /// No description provided for @mStaticDescribeYourRequest.
  ///
  /// In en, this message translates to:
  /// **'Describe your request'**
  String get mStaticDescribeYourRequest;

  /// No description provided for @mStaticDescribeOrganisationDetails.
  ///
  /// In en, this message translates to:
  /// **'Describe organisation details'**
  String get mStaticDescribeOrganisationDetails;

  /// No description provided for @mStaticOrganisationRequest.
  ///
  /// In en, this message translates to:
  /// **'Request to add the organisation'**
  String get mStaticOrganisationRequest;

  /// No description provided for @mStaticThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get mStaticThankYou;

  /// No description provided for @mStaticRequestLogged.
  ///
  /// In en, this message translates to:
  /// **'We have logged your request.'**
  String get mStaticRequestLogged;

  /// No description provided for @mStaticRequestSentConfirmation.
  ///
  /// In en, this message translates to:
  /// **'We will reach out to you in the next 48 hours to help you. Resume self-registration process to see if you have all the other required details for the registration process.'**
  String get mStaticRequestSentConfirmation;

  /// No description provided for @mStaticResumeRegistration.
  ///
  /// In en, this message translates to:
  /// **'Resume registration'**
  String get mStaticResumeRegistration;

  /// No description provided for @mStaticDomainHintText.
  ///
  /// In en, this message translates to:
  /// **'Example: gov.in'**
  String get mStaticDomainHintText;

  /// No description provided for @mStaticPlatformRatingSubmit.
  ///
  /// In en, this message translates to:
  /// **'platform-rating-submit'**
  String get mStaticPlatformRatingSubmit;

  /// No description provided for @mStaticPlatformRatingClose.
  ///
  /// In en, this message translates to:
  /// **'platform-rating-close'**
  String get mStaticPlatformRatingClose;

  /// No description provided for @mStaticPlatformRating.
  ///
  /// In en, this message translates to:
  /// **'Platform Rating'**
  String get mStaticPlatformRating;

  /// No description provided for @mStaticAskVega.
  ///
  /// In en, this message translates to:
  /// **'Ask Vega'**
  String get mStaticAskVega;

  /// No description provided for @mStaticVegaIsListening.
  ///
  /// In en, this message translates to:
  /// **'Vega is listening.. '**
  String get mStaticVegaIsListening;

  /// No description provided for @mStaticExternalLinks.
  ///
  /// In en, this message translates to:
  /// **'External links'**
  String get mStaticExternalLinks;

  /// No description provided for @mStaticNetworkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with interesting people, see what they are upto.'**
  String get mStaticNetworkSubtitle;

  /// No description provided for @mStaticLearnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sharpen your skills with hundreds-of online courses.'**
  String get mStaticLearnSubtitle;

  /// No description provided for @mStaticCareersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore career options, grow in the path of your choice.'**
  String get mStaticCareersSubtitle;

  /// No description provided for @mStaticCompetenciesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your competencies, see what others are adding.'**
  String get mStaticCompetenciesSubtitle;

  /// No description provided for @mStaticEventsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your events.'**
  String get mStaticEventsSubtitle;

  /// No description provided for @mStaticDashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All your data represented as simple visualisations.'**
  String get mStaticDashboardSubtitle;

  /// No description provided for @mStaticSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage all your preferences here.'**
  String get mStaticSettingsSubtitle;

  /// No description provided for @mStaticMicroSurveys.
  ///
  /// In en, this message translates to:
  /// **'Micro surveys'**
  String get mStaticMicroSurveys;

  /// No description provided for @mStaticMicroSurveysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Survey scenarios.'**
  String get mStaticMicroSurveysSubtitle;

  /// No description provided for @mStaticInterests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get mStaticInterests;

  /// No description provided for @mStaticInterestsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage topics of your interest and personalize your experience'**
  String get mStaticInterestsSubtitle;

  /// No description provided for @mStaticFracDictionarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Responsive web version of Karmayogi Bharat.'**
  String get mStaticFracDictionarySubtitle;

  /// No description provided for @mStaticKarmayogiWebPortal.
  ///
  /// In en, this message translates to:
  /// **'Karmayogi web portal'**
  String get mStaticKarmayogiWebPortal;

  /// No description provided for @mStaticKarmayogiWebPortalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Responsive web version of Karmayogi Bharat.'**
  String get mStaticKarmayogiWebPortalSubtitle;

  /// No description provided for @mStaticCopyRightText.
  ///
  /// In en, this message translates to:
  /// **'© Copyright '**
  String get mStaticCopyRightText;

  /// No description provided for @mStaticPublicCopyRightText.
  ///
  /// In en, this message translates to:
  /// **'Copyright © App managed by Karmayogi Bharat'**
  String get mStaticPublicCopyRightText;

  /// No description provided for @mStaticEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get mStaticEnglish;

  /// No description provided for @mStaticHindi.
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get mStaticHindi;

  /// No description provided for @mStaticLive.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get mStaticLive;

  /// No description provided for @mStaticSomethingWrong.
  ///
  /// In en, this message translates to:
  /// **'Something is wrong'**
  String get mStaticSomethingWrong;

  /// No description provided for @mStaticSomethingWrongTryLater.
  ///
  /// In en, this message translates to:
  /// **'Something is wrong, please try again later'**
  String get mStaticSomethingWrongTryLater;

  /// No description provided for @mStaticContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get mStaticContactUs;

  /// No description provided for @mStaticClickHereToLogin.
  ///
  /// In en, this message translates to:
  /// **'Click here to login'**
  String get mStaticClickHereToLogin;

  /// No description provided for @mStaticCodeParamsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Failed to login in Parichay. Code param is invalid.'**
  String get mStaticCodeParamsInvalid;

  /// No description provided for @mStaticCodeParamsMissing.
  ///
  /// In en, this message translates to:
  /// **'Failed to login in Parichay. Code param is missing.'**
  String get mStaticCodeParamsMissing;

  /// No description provided for @mStaticThanksForRegistering.
  ///
  /// In en, this message translates to:
  /// **'Thank you for registering!'**
  String get mStaticThanksForRegistering;

  /// No description provided for @mStaticPostRegisterInfo.
  ///
  /// In en, this message translates to:
  /// **'Please check your registered email to activate your account.'**
  String get mStaticPostRegisterInfo;

  /// No description provided for @mStaticOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get mStaticOk;

  /// No description provided for @mStaticFirstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get mStaticFirstName;

  /// No description provided for @mStaticFirstNameMandatory.
  ///
  /// In en, this message translates to:
  /// **'First name is mandatory'**
  String get mStaticFirstNameMandatory;

  /// No description provided for @mStaticTypeYourFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get mStaticTypeYourFirstName;

  /// No description provided for @mStaticPositionValidationText.
  ///
  /// In en, this message translates to:
  /// **'Position is mandatory. You must enter value from suggested list only.'**
  String get mStaticPositionValidationText;

  /// No description provided for @mStaticDomain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get mStaticDomain;

  /// No description provided for @mStaticPositionMandate.
  ///
  /// In en, this message translates to:
  /// **'Position is mandatory'**
  String get mStaticPositionMandate;

  /// No description provided for @mStaticPositionDescriptionMandate.
  ///
  /// In en, this message translates to:
  /// **'Position description is mandatory'**
  String get mStaticPositionDescriptionMandate;

  /// No description provided for @mStaticDomainMandate.
  ///
  /// In en, this message translates to:
  /// **'Domain is mandatory'**
  String get mStaticDomainMandate;

  /// No description provided for @mStaticDomainDescriptionMandate.
  ///
  /// In en, this message translates to:
  /// **'Domain description is mandatory'**
  String get mStaticDomainDescriptionMandate;

  /// No description provided for @mStaticOrganisationDescriptionMandate.
  ///
  /// In en, this message translates to:
  /// **'Organisation description is mandatory'**
  String get mStaticOrganisationDescriptionMandate;

  /// No description provided for @mStaticSelectYourPosition.
  ///
  /// In en, this message translates to:
  /// **'Select your position'**
  String get mStaticSelectYourPosition;

  /// No description provided for @mStaticEmailId.
  ///
  /// In en, this message translates to:
  /// **'Email id'**
  String get mStaticEmailId;

  /// No description provided for @mStaticEmailIdEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email ID'**
  String get mStaticEmailIdEmpty;

  /// No description provided for @mStaticDomainValidationText.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get mStaticDomainValidationText;

  /// No description provided for @mStaticOrgValidationText.
  ///
  /// In en, this message translates to:
  /// **'Organisation is mandatory. Please choose a value from the list provided below.'**
  String get mStaticOrgValidationText;

  /// No description provided for @mStaticWelcomeToiGOT.
  ///
  /// In en, this message translates to:
  /// **'Welcome to iGOT'**
  String get mStaticWelcomeToiGOT;

  /// No description provided for @mStaticPleaseFillAll.
  ///
  /// In en, this message translates to:
  /// **'Please fill the following information.'**
  String get mStaticPleaseFillAll;

  /// No description provided for @mStaticPleaseFillAllMandatory.
  ///
  /// In en, this message translates to:
  /// **'Please fill all the mandatory fields.'**
  String get mStaticPleaseFillAllMandatory;

  /// No description provided for @mStaticSignUpConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'I confirm that the above provided information are accurate.'**
  String get mStaticSignUpConfirmationText;

  /// No description provided for @mStaticSaveAndNext.
  ///
  /// In en, this message translates to:
  /// **'Save and Next'**
  String get mStaticSaveAndNext;

  /// No description provided for @mStaticDomainDetails.
  ///
  /// In en, this message translates to:
  /// **'DOMAIN DETAILS'**
  String get mStaticDomainDetails;

  /// No description provided for @mStaticOrgSearchHelperText.
  ///
  /// In en, this message translates to:
  /// **'Please type your organisation and tap on search icon to get the result'**
  String get mStaticOrgSearchHelperText;

  /// No description provided for @mStaticDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get mStaticDone;

  /// No description provided for @mStaticPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get mStaticPrivacyPolicy;

  /// No description provided for @mStaticTrendingCourses.
  ///
  /// In en, this message translates to:
  /// **'Trending courses'**
  String get mStaticTrendingCourses;

  /// No description provided for @mStaticRecentCourses.
  ///
  /// In en, this message translates to:
  /// **'Recent courses'**
  String get mStaticRecentCourses;

  /// No description provided for @mStaticAllRecommendedCBPs.
  ///
  /// In en, this message translates to:
  /// **'All recommended CBPs'**
  String get mStaticAllRecommendedCBPs;

  /// No description provided for @mStaticAllTrendingCBPs.
  ///
  /// In en, this message translates to:
  /// **'All Trending CBPs'**
  String get mStaticAllTrendingCBPs;

  /// No description provided for @mStaticAllRecentlyAddedCBPs.
  ///
  /// In en, this message translates to:
  /// **'All recently added CBPs'**
  String get mStaticAllRecentlyAddedCBPs;

  /// No description provided for @mStaticAllPrograms.
  ///
  /// In en, this message translates to:
  /// **'All Programs'**
  String get mStaticAllPrograms;

  /// No description provided for @mStaticAllStandaloneAssessments.
  ///
  /// In en, this message translates to:
  /// **'All Standalone Assessments'**
  String get mStaticAllStandaloneAssessments;

  /// No description provided for @mStaticSelectBatchToEnroll.
  ///
  /// In en, this message translates to:
  /// **'Select batch to enroll'**
  String get mStaticSelectBatchToEnroll;

  /// No description provided for @mStaticRequestToEnrollProgram.
  ///
  /// In en, this message translates to:
  /// **'Request to enroll'**
  String get mStaticRequestToEnrollProgram;

  /// No description provided for @mStaticSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get mStaticSave;

  /// No description provided for @mStaticShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get mStaticShare;

  /// No description provided for @mStaticFileDownloadingCompleted.
  ///
  /// In en, this message translates to:
  /// **'File downloading completed.'**
  String get mStaticFileDownloadingCompleted;

  /// No description provided for @mStaticMyRating.
  ///
  /// In en, this message translates to:
  /// **'My rating'**
  String get mStaticMyRating;

  /// No description provided for @mStaticYourCompetenciesTagged.
  ///
  /// In en, this message translates to:
  /// **'Your competencies tagged'**
  String get mStaticYourCompetenciesTagged;

  /// No description provided for @mStaticOtherCompetenciesTagged.
  ///
  /// In en, this message translates to:
  /// **'Other competencies tagged'**
  String get mStaticOtherCompetenciesTagged;

  /// No description provided for @mStaticCompetenciesTagged.
  ///
  /// In en, this message translates to:
  /// **'Competencies tagged'**
  String get mStaticCompetenciesTagged;

  /// No description provided for @mStaticRatingAndReviews.
  ///
  /// In en, this message translates to:
  /// **'Ratings and reviews'**
  String get mStaticRatingAndReviews;

  /// No description provided for @mStaticSimilarCBPs.
  ///
  /// In en, this message translates to:
  /// **'Similar CBPs'**
  String get mStaticSimilarCBPs;

  /// No description provided for @mStaticWithdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get mStaticWithdraw;

  /// No description provided for @mStaticAvailableBatch.
  ///
  /// In en, this message translates to:
  /// **'Available Batches'**
  String get mStaticAvailableBatch;

  /// No description provided for @mStaticEnrolLateDateTxt.
  ///
  /// In en, this message translates to:
  /// **'Last enrollment date: '**
  String get mStaticEnrolLateDateTxt;

  /// No description provided for @mStaticEnrolmentWithdrawDesc.
  ///
  /// In en, this message translates to:
  /// **'Withdraw your request'**
  String get mStaticEnrolmentWithdrawDesc;

  /// No description provided for @mStaticEnrolmentWithdrawConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to withdraw your request?'**
  String get mStaticEnrolmentWithdrawConfirm;

  /// No description provided for @mStaticEnrolmentWithdrawConfirmDesc.
  ///
  /// In en, this message translates to:
  /// **'You will miss the learning opportunity if you withdraw your enrolment.'**
  String get mStaticEnrolmentWithdrawConfirmDesc;

  /// No description provided for @mStaticAttendenceStatus.
  ///
  /// In en, this message translates to:
  /// **'Attendance status'**
  String get mStaticAttendenceStatus;

  /// No description provided for @mStaticSessionStartAttendence.
  ///
  /// In en, this message translates to:
  /// **'Session start attendance'**
  String get mStaticSessionStartAttendence;

  /// No description provided for @mStaticUnMarkedAttendence.
  ///
  /// In en, this message translates to:
  /// **'Unmarked'**
  String get mStaticUnMarkedAttendence;

  /// No description provided for @mStaticMarkedAttendence.
  ///
  /// In en, this message translates to:
  /// **'Marked'**
  String get mStaticMarkedAttendence;

  /// No description provided for @mStaticScannerSuccesfuly.
  ///
  /// In en, this message translates to:
  /// **'Your session attendance has been recorded successfully.'**
  String get mStaticScannerSuccesfuly;

  /// No description provided for @mStaticAttendanceAlreadyMarked.
  ///
  /// In en, this message translates to:
  /// **'Your session has been attendance already marked.'**
  String get mStaticAttendanceAlreadyMarked;

  /// No description provided for @mStaticOffFlash.
  ///
  /// In en, this message translates to:
  /// **'Off Flash'**
  String get mStaticOffFlash;

  /// No description provided for @mStaticOnFlash.
  ///
  /// In en, this message translates to:
  /// **'On Flash'**
  String get mStaticOnFlash;

  /// No description provided for @mStaticScanAndMarkAttendence.
  ///
  /// In en, this message translates to:
  /// **'Scan and mark your attendance'**
  String get mStaticScanAndMarkAttendence;

  /// No description provided for @mStaticScanToMarkAttendence.
  ///
  /// In en, this message translates to:
  /// **'Scan to mark attendance'**
  String get mStaticScanToMarkAttendence;

  /// No description provided for @mStaticInvalidQR.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code'**
  String get mStaticInvalidQR;

  /// No description provided for @mStaticInvalidQRDesc.
  ///
  /// In en, this message translates to:
  /// **'Please scan the correct QR code to mark your attendance.'**
  String get mStaticInvalidQRDesc;

  /// No description provided for @mStaticScanAgain.
  ///
  /// In en, this message translates to:
  /// **'Scan again'**
  String get mStaticScanAgain;

  /// No description provided for @mStaticDisabledLocationToastMsg.
  ///
  /// In en, this message translates to:
  /// **'Location permission is currently disabled. Please enable it to mark your attendance.'**
  String get mStaticDisabledLocationToastMsg;

  /// No description provided for @mStaticDisabledLocationToastToOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Location permission is currently disabled. Please enable by going to app settings.'**
  String get mStaticDisabledLocationToastToOpenSettings;

  /// No description provided for @mStaticInvalidBatchLocation.
  ///
  /// In en, this message translates to:
  /// **'Invalid batch Location'**
  String get mStaticInvalidBatchLocation;

  /// No description provided for @mStaticInvalidBatchLocationDesc.
  ///
  /// In en, this message translates to:
  /// **'Your location doesn’t match. Please reach out to your program coordinator to mark your attendance.'**
  String get mStaticInvalidBatchLocationDesc;

  /// No description provided for @mStaticReachOutProgramCordinator.
  ///
  /// In en, this message translates to:
  /// **'Please reach out to program coordinator to mark your attendance.'**
  String get mStaticReachOutProgramCordinator;

  /// No description provided for @mStaticInvalidSession.
  ///
  /// In en, this message translates to:
  /// **'Session over'**
  String get mStaticInvalidSession;

  /// No description provided for @mStaticContactProgramCordinator.
  ///
  /// In en, this message translates to:
  /// **'Please contact your program coordinator to mark your attendance.'**
  String get mStaticContactProgramCordinator;

  /// No description provided for @mStaticInvalidLocation.
  ///
  /// In en, this message translates to:
  /// **'Invalid location'**
  String get mStaticInvalidLocation;

  /// No description provided for @mStaticInvalidLocationDesc.
  ///
  /// In en, this message translates to:
  /// **'Your location doesn’t match. Please reach out to your program coordinator to mark your attendance.'**
  String get mStaticInvalidLocationDesc;

  /// No description provided for @mStaticTryAgainMsg.
  ///
  /// In en, this message translates to:
  /// **'You have the opportunity to try again and do better next time. Keep going!'**
  String get mStaticTryAgainMsg;

  /// No description provided for @mStaticAcedAssessment.
  ///
  /// In en, this message translates to:
  /// **'Hurray! \n You have aced the assessment, with flying colours.'**
  String get mStaticAcedAssessment;

  /// No description provided for @mStaticPassedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Congratulations on successfully passing the assessment. Good job!'**
  String get mStaticPassedSuccessfully;

  /// No description provided for @mStaticPassed.
  ///
  /// In en, this message translates to:
  /// **'Passed '**
  String get mStaticPassed;

  /// No description provided for @mStaticFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed '**
  String get mStaticFailed;

  /// No description provided for @mStaticCorrect.
  ///
  /// In en, this message translates to:
  /// **'questions correct answered'**
  String get mStaticCorrect;

  /// No description provided for @mStaticIncorrect.
  ///
  /// In en, this message translates to:
  /// **'questions wrong answered'**
  String get mStaticIncorrect;

  /// No description provided for @mStaticNotAttempted.
  ///
  /// In en, this message translates to:
  /// **'unanswered'**
  String get mStaticNotAttempted;

  /// No description provided for @mStaticQuestionsNotAttempted.
  ///
  /// In en, this message translates to:
  /// **'Oops! It looks like a few questions were missed. Are you sure you want to submit?'**
  String get mStaticQuestionsNotAttempted;

  /// No description provided for @mStaticCalculatingResult.
  ///
  /// In en, this message translates to:
  /// **'Be patient please, while we calculate your result!'**
  String get mStaticCalculatingResult;

  /// No description provided for @mStaticPerformanceSummary.
  ///
  /// In en, this message translates to:
  /// **'Your Performance Summary'**
  String get mStaticPerformanceSummary;

  /// No description provided for @mStaticQuickAssessment.
  ///
  /// In en, this message translates to:
  /// **'Now, it’s time for a quick assessment'**
  String get mStaticQuickAssessment;

  /// No description provided for @mStaticKeepLearning.
  ///
  /// In en, this message translates to:
  /// **'Well done, Keep learning!'**
  String get mStaticKeepLearning;

  /// No description provided for @mStaticDiscussSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Have a question? Have an idea? Discuss with your peers!.'**
  String get mStaticDiscussSubtitle;

  /// No description provided for @mStaticReplyToComment.
  ///
  /// In en, this message translates to:
  /// **'Reply to comment'**
  String get mStaticReplyToComment;

  /// No description provided for @mStaticReplyMinLengthText.
  ///
  /// In en, this message translates to:
  /// **'Your reply (min 8 characters)'**
  String get mStaticReplyMinLengthText;

  /// No description provided for @mStaticSentForReview.
  ///
  /// In en, this message translates to:
  /// **'Sent for review'**
  String get mStaticSentForReview;

  /// No description provided for @mStaticModerationMessage.
  ///
  /// In en, this message translates to:
  /// **'Your post has been sent for review. Once approved, it will be displayed in the Discussion hub'**
  String get mStaticModerationMessage;

  /// No description provided for @mStaticNewDiscussion.
  ///
  /// In en, this message translates to:
  /// **'New discussion'**
  String get mStaticNewDiscussion;

  /// No description provided for @mStaticTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get mStaticTitle;

  /// No description provided for @mStaticElaborateYourQuestionText.
  ///
  /// In en, this message translates to:
  /// **'Please elaborate your question or idea here'**
  String get mStaticElaborateYourQuestionText;

  /// No description provided for @mStaticEnterTags.
  ///
  /// In en, this message translates to:
  /// **'Add a tag and press Enter'**
  String get mStaticEnterTags;

  /// No description provided for @mStaticNewAssessmentHoldInfo.
  ///
  /// In en, this message translates to:
  /// **'Sorry, the app does not support assessments right now. You can take the assessment on the web portal.'**
  String get mStaticNewAssessmentHoldInfo;

  /// No description provided for @mStaticSurveyHoldInfo.
  ///
  /// In en, this message translates to:
  /// **'Sorry, the app does not support survey right now. You can take the survey on the web portal.'**
  String get mStaticSurveyHoldInfo;

  /// No description provided for @mStaticDoSignInOrRegisterMessage.
  ///
  /// In en, this message translates to:
  /// **'If you are a government official, register or sign in and get your certificate.'**
  String get mStaticDoSignInOrRegisterMessage;

  /// No description provided for @mStaticPleaseSelectLevel.
  ///
  /// In en, this message translates to:
  /// **'Please select a level'**
  String get mStaticPleaseSelectLevel;

  /// No description provided for @mStaticAddComment.
  ///
  /// In en, this message translates to:
  /// **'Add comment'**
  String get mStaticAddComment;

  /// No description provided for @mStaticBackToCategories.
  ///
  /// In en, this message translates to:
  /// **'Back to ‘Categories’'**
  String get mStaticBackToCategories;

  /// No description provided for @mStaticBackToTrendingTags.
  ///
  /// In en, this message translates to:
  /// **'Back to ‘Trending tags’'**
  String get mStaticBackToTrendingTags;

  /// No description provided for @mStaticSubmitChanges.
  ///
  /// In en, this message translates to:
  /// **'Submit changes'**
  String get mStaticSubmitChanges;

  /// No description provided for @mStaticPostMinLengthText.
  ///
  /// In en, this message translates to:
  /// **'Post should contain atleast 8 characters.'**
  String get mStaticPostMinLengthText;

  /// No description provided for @mStaticOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get mStaticOpen;

  /// No description provided for @mStaticErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get mStaticErrorMessage;

  /// No description provided for @mStaticConnectionRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Connection request sent'**
  String get mStaticConnectionRequestSent;

  /// No description provided for @mStaticConnectionRequestRejected.
  ///
  /// In en, this message translates to:
  /// **'Connection request rejected!'**
  String get mStaticConnectionRequestRejected;

  /// No description provided for @mStaticAddedToYourCompetency.
  ///
  /// In en, this message translates to:
  /// **'Added successfully!'**
  String get mStaticAddedToYourCompetency;

  /// No description provided for @mStaticRemovedFromYourCompetency.
  ///
  /// In en, this message translates to:
  /// **'Removed from your competency!'**
  String get mStaticRemovedFromYourCompetency;

  /// No description provided for @mStaticBookmarkAddedMessage.
  ///
  /// In en, this message translates to:
  /// **'Bookmark added successfully!'**
  String get mStaticBookmarkAddedMessage;

  /// No description provided for @mStaticBookmarkRemovedMessage.
  ///
  /// In en, this message translates to:
  /// **'Bookmark removed successfully!'**
  String get mStaticBookmarkRemovedMessage;

  /// No description provided for @mStaticCommentPostedCreated.
  ///
  /// In en, this message translates to:
  /// **'Post created successfully!'**
  String get mStaticCommentPostedCreated;

  /// No description provided for @mStaticCommentPostedText.
  ///
  /// In en, this message translates to:
  /// **'Comment successfully posted!'**
  String get mStaticCommentPostedText;

  /// No description provided for @mStaticDiscussionAddedText.
  ///
  /// In en, this message translates to:
  /// **'New discussion added successfully!'**
  String get mStaticDiscussionAddedText;

  /// No description provided for @mStaticDiscussionDeletedText.
  ///
  /// In en, this message translates to:
  /// **'Post deleted successfully!'**
  String get mStaticDiscussionDeletedText;

  /// No description provided for @mStaticDiscussionUpdatedText.
  ///
  /// In en, this message translates to:
  /// **'Post updated successfully!'**
  String get mStaticDiscussionUpdatedText;

  /// No description provided for @mStaticKarmaPoints.
  ///
  /// In en, this message translates to:
  /// **'Karma Points'**
  String get mStaticKarmaPoints;

  /// No description provided for @mStaticCoinsSpent.
  ///
  /// In en, this message translates to:
  /// **'Coins spent'**
  String get mStaticCoinsSpent;

  /// No description provided for @mStaticKarmaEarned.
  ///
  /// In en, this message translates to:
  /// **'Karma earned'**
  String get mStaticKarmaEarned;

  /// No description provided for @mStaticHostedByMyMDO.
  ///
  /// In en, this message translates to:
  /// **'Hosted by my MDO'**
  String get mStaticHostedByMyMDO;

  /// No description provided for @mStaticAscentAtoZ.
  ///
  /// In en, this message translates to:
  /// **'A-Z'**
  String get mStaticAscentAtoZ;

  /// No description provided for @mStaticDescentZtoA.
  ///
  /// In en, this message translates to:
  /// **'Z-A'**
  String get mStaticDescentZtoA;

  /// No description provided for @mStaticPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get mStaticPosition;

  /// No description provided for @mStaticAllPositions.
  ///
  /// In en, this message translates to:
  /// **'All positions'**
  String get mStaticAllPositions;

  /// No description provided for @mStaticApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get mStaticApply;

  /// No description provided for @mStaticResetToDefault.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get mStaticResetToDefault;

  /// No description provided for @mStaticAllMembers.
  ///
  /// In en, this message translates to:
  /// **'All members'**
  String get mStaticAllMembers;

  /// No description provided for @mStaticSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get mStaticSaved;

  /// No description provided for @mStaticMultipleSelected.
  ///
  /// In en, this message translates to:
  /// **'MULTIPLE SELECTED'**
  String get mStaticMultipleSelected;

  /// No description provided for @mStaticNoDiscussions.
  ///
  /// In en, this message translates to:
  /// **'No discussions'**
  String get mStaticNoDiscussions;

  /// No description provided for @mStaticNoLearners.
  ///
  /// In en, this message translates to:
  /// **'No learners found'**
  String get mStaticNoLearners;

  /// No description provided for @mStaticNoPosts.
  ///
  /// In en, this message translates to:
  /// **'No posts'**
  String get mStaticNoPosts;

  /// No description provided for @mStaticResourceNotFound.
  ///
  /// In en, this message translates to:
  /// **'Resource not found'**
  String get mStaticResourceNotFound;

  /// No description provided for @mStaticErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get mStaticErrorOccurred;

  /// No description provided for @mStaticPageNotAvailableText.
  ///
  /// In en, this message translates to:
  /// **'This page is not available'**
  String get mStaticPageNotAvailableText;

  /// No description provided for @mStaticWaitingForCertificateGeneration.
  ///
  /// In en, this message translates to:
  /// **'Kindly be patient. The certificate generation normally takes up to 24 hours, however, it might take longer sometimes. \n If the issue persists, please mail us at '**
  String get mStaticWaitingForCertificateGeneration;

  /// No description provided for @mStaticSupportLink.
  ///
  /// In en, this message translates to:
  /// **'mission.karmayogi@gov.in'**
  String get mStaticSupportLink;

  /// No description provided for @mStaticExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get mStaticExperience;

  /// No description provided for @mStaticEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get mStaticEducation;

  /// No description provided for @mStaticCertificationAndSkills.
  ///
  /// In en, this message translates to:
  /// **'Certification and skills'**
  String get mStaticCertificationAndSkills;

  /// No description provided for @mStaticAddAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get mStaticAddAPhoto;

  /// No description provided for @mStaticTakeAPicture.
  ///
  /// In en, this message translates to:
  /// **'Take a picture'**
  String get mStaticTakeAPicture;

  /// No description provided for @mStaticGoToFiles.
  ///
  /// In en, this message translates to:
  /// **'Go to files'**
  String get mStaticGoToFiles;

  /// No description provided for @mStaticCropImage.
  ///
  /// In en, this message translates to:
  /// **'Crop image'**
  String get mStaticCropImage;

  /// No description provided for @mStaticAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get mStaticAdd;

  /// No description provided for @mStaticName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get mStaticName;

  /// No description provided for @mStaticTypeHere.
  ///
  /// In en, this message translates to:
  /// **'Type here'**
  String get mStaticTypeHere;

  /// No description provided for @mStaticEnterYourPosition.
  ///
  /// In en, this message translates to:
  /// **'Enter your position'**
  String get mStaticEnterYourPosition;

  /// No description provided for @mStaticEnterYourOrg.
  ///
  /// In en, this message translates to:
  /// **'Enter your organisation'**
  String get mStaticEnterYourOrg;

  /// No description provided for @mStaticEnterYourDomain.
  ///
  /// In en, this message translates to:
  /// **'Enter your domain'**
  String get mStaticEnterYourDomain;

  /// No description provided for @mStaticAddValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please add a valid mobile number'**
  String get mStaticAddValidNumber;

  /// No description provided for @mStaticChooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get mStaticChooseDate;

  /// No description provided for @mStaticMiddleName.
  ///
  /// In en, this message translates to:
  /// **'Middle name'**
  String get mStaticMiddleName;

  /// No description provided for @mStaticSurName.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get mStaticSurName;

  /// No description provided for @mStaticSpecialCharInName.
  ///
  /// In en, this message translates to:
  /// **'Name fields cannot contain numbers and special characters except (\")'**
  String get mStaticSpecialCharInName;

  /// No description provided for @mStaticTelephoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Telephone number'**
  String get mStaticTelephoneNumber;

  /// No description provided for @mStaticTelephoneNumberExample.
  ///
  /// In en, this message translates to:
  /// **'Example  0123-26104183 or 012327204281'**
  String get mStaticTelephoneNumberExample;

  /// No description provided for @mStaticAcademicDetailsUpdatedText.
  ///
  /// In en, this message translates to:
  /// **'Academic details updated.'**
  String get mStaticAcademicDetailsUpdatedText;

  /// No description provided for @mStaticConfirmRemoveText.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove it?'**
  String get mStaticConfirmRemoveText;

  /// No description provided for @mStaticYesRemove.
  ///
  /// In en, this message translates to:
  /// **'Yes, remove'**
  String get mStaticYesRemove;

  /// No description provided for @mStaticNoBackText.
  ///
  /// In en, this message translates to:
  /// **'No, take me back'**
  String get mStaticNoBackText;

  /// No description provided for @mStaticGovernment.
  ///
  /// In en, this message translates to:
  /// **'Government'**
  String get mStaticGovernment;

  /// No description provided for @mStaticNonGovernment.
  ///
  /// In en, this message translates to:
  /// **'Non-Government'**
  String get mStaticNonGovernment;

  /// No description provided for @mStaticProfessionalDetailsUpdatedText.
  ///
  /// In en, this message translates to:
  /// **'Professional details updated.'**
  String get mStaticProfessionalDetailsUpdatedText;

  /// No description provided for @mStaticTypeOfOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Type of organisation'**
  String get mStaticTypeOfOrganisation;

  /// No description provided for @mStaticOrganisationName.
  ///
  /// In en, this message translates to:
  /// **'Organization name'**
  String get mStaticOrganisationName;

  /// No description provided for @mStaticOtherDetailsOfGovtEmployees.
  ///
  /// In en, this message translates to:
  /// **'Other details for government employees(If applicable)'**
  String get mStaticOtherDetailsOfGovtEmployees;

  /// No description provided for @mStaticPayBand.
  ///
  /// In en, this message translates to:
  /// **'Pay band(grade pay)'**
  String get mStaticPayBand;

  /// No description provided for @mStaticOfficialPostalAddress.
  ///
  /// In en, this message translates to:
  /// **'Official postal address'**
  String get mStaticOfficialPostalAddress;

  /// No description provided for @mStaticCertificationAndSkillsUpdatedText.
  ///
  /// In en, this message translates to:
  /// **'Certification and skills updated successfully.'**
  String get mStaticCertificationAndSkillsUpdatedText;

  /// No description provided for @mStaticCertifications.
  ///
  /// In en, this message translates to:
  /// **'Certifications'**
  String get mStaticCertifications;

  /// No description provided for @mStaticAdditionalSkillAcquired.
  ///
  /// In en, this message translates to:
  /// **'Additional skill acquired/Course completed'**
  String get mStaticAdditionalSkillAcquired;

  /// No description provided for @mStaticProvideCertificationDetails.
  ///
  /// In en, this message translates to:
  /// **'Provide certification details'**
  String get mStaticProvideCertificationDetails;

  /// No description provided for @mStaticProfessionalInterests.
  ///
  /// In en, this message translates to:
  /// **'Professional interests'**
  String get mStaticProfessionalInterests;

  /// No description provided for @mStaticPostGradDetails.
  ///
  /// In en, this message translates to:
  /// **' Post graduation details'**
  String get mStaticPostGradDetails;

  /// No description provided for @mStaticSelectOrganization.
  ///
  /// In en, this message translates to:
  /// **'Select an organization'**
  String get mStaticSelectOrganization;

  /// No description provided for @mStaticSelectIndustry.
  ///
  /// In en, this message translates to:
  /// **'Select an industry'**
  String get mStaticSelectIndustry;

  /// No description provided for @mStaticSelectGradePay.
  ///
  /// In en, this message translates to:
  /// **'Select a pay band'**
  String get mStaticSelectGradePay;

  /// No description provided for @mStaticSelectService.
  ///
  /// In en, this message translates to:
  /// **'Select a service'**
  String get mStaticSelectService;

  /// No description provided for @mStaticSelectCadre.
  ///
  /// In en, this message translates to:
  /// **'Select a cadre'**
  String get mStaticSelectCadre;

  /// No description provided for @mStaticSelectDesignation.
  ///
  /// In en, this message translates to:
  /// **'Select a designation'**
  String get mStaticSelectDesignation;

  /// No description provided for @mStaticSelectFromDropdown.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get mStaticSelectFromDropdown;

  /// No description provided for @mStaticOtpSentToMobile.
  ///
  /// In en, this message translates to:
  /// **'An OTP has been sent to your mobile number (valid for 5 minutes)'**
  String get mStaticOtpSentToMobile;

  /// No description provided for @mStaticMobileVerifiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Mobile number verified successfully'**
  String get mStaticMobileVerifiedMessage;

  /// No description provided for @mStaticPleaseAddValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10 digit number'**
  String get mStaticPleaseAddValidNumber;

  /// No description provided for @mStaticMobileNumberVerificationInfo.
  ///
  /// In en, this message translates to:
  /// **'Please verify your phone number for better experience'**
  String get mStaticMobileNumberVerificationInfo;

  /// No description provided for @mStaticAddValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please add a valid email address'**
  String get mStaticAddValidEmail;

  /// No description provided for @mStaticChangeEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Change Email Address'**
  String get mStaticChangeEmailAddress;

  /// No description provided for @mStaticOtpSentToEmailDesc.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email address'**
  String get mStaticOtpSentToEmailDesc;

  /// No description provided for @mStaticOtpSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'An OTP has been sent to your email address (valid for 15 minutes)'**
  String get mStaticOtpSentToEmail;

  /// No description provided for @mStaticEmailVerifiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Email address verified successfully'**
  String get mStaticEmailVerifiedMessage;

  /// No description provided for @mStaticPleaseEnterOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter OTP'**
  String get mStaticPleaseEnterOtp;

  /// No description provided for @mStaticBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get mStaticBadges;

  /// No description provided for @mStaticConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get mStaticConfirm;

  /// No description provided for @mStaticNotificationRemoved.
  ///
  /// In en, this message translates to:
  /// **'Notification removed'**
  String get mStaticNotificationRemoved;

  /// No description provided for @mStaticNotificationMarkedAsRead.
  ///
  /// In en, this message translates to:
  /// **'Notification marked as read.'**
  String get mStaticNotificationMarkedAsRead;

  /// No description provided for @mStaticMarkAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get mStaticMarkAllAsRead;

  /// No description provided for @mStaticShowUnreadNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show unread notifications'**
  String get mStaticShowUnreadNotifications;

  /// No description provided for @mStaticShowAllNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show all notifications'**
  String get mStaticShowAllNotifications;

  /// No description provided for @mStaticNotificationSettingsSavedText.
  ///
  /// In en, this message translates to:
  /// **'Notification settings saved!'**
  String get mStaticNotificationSettingsSavedText;

  /// No description provided for @mStaticNotificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get mStaticNotificationSettings;

  /// No description provided for @mStaticNoSearchResultsText.
  ///
  /// In en, this message translates to:
  /// **'No search results found.'**
  String get mStaticNoSearchResultsText;

  /// No description provided for @mStaticExploreByTopic.
  ///
  /// In en, this message translates to:
  /// **'Explore by Topic'**
  String get mStaticExploreByTopic;

  /// No description provided for @mStaticBrowseTopics.
  ///
  /// In en, this message translates to:
  /// **'Explore all topics within the learn hub'**
  String get mStaticBrowseTopics;

  /// No description provided for @mStaticBrowseModeratedCourses.
  ///
  /// In en, this message translates to:
  /// **'Explore all moderated courses'**
  String get mStaticBrowseModeratedCourses;

  /// No description provided for @mStaticBrowseCompetency.
  ///
  /// In en, this message translates to:
  /// **'Explore all competencies within the learn hub'**
  String get mStaticBrowseCompetency;

  /// No description provided for @mStaticBrowseProvider.
  ///
  /// In en, this message translates to:
  /// **'Explore all CBPs from any provider within the learn hub'**
  String get mStaticBrowseProvider;

  /// No description provided for @mStaticBrowseCuratedCollections.
  ///
  /// In en, this message translates to:
  /// **'Explore all CBPs from any collection within the learn hub'**
  String get mStaticBrowseCuratedCollections;

  /// No description provided for @mStaticDeleteDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Delete discussion'**
  String get mStaticDeleteDiscussion;

  /// No description provided for @mStaticEditDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Edit discussion'**
  String get mStaticEditDiscussion;

  /// No description provided for @mStaticImage.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get mStaticImage;

  /// No description provided for @mStaticResourceType.
  ///
  /// In en, this message translates to:
  /// **'Resource type'**
  String get mStaticResourceType;

  /// No description provided for @mStaticProviders.
  ///
  /// In en, this message translates to:
  /// **'Providers'**
  String get mStaticProviders;

  /// No description provided for @mStaticDesiredCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Desired competencies'**
  String get mStaticDesiredCompetencies;

  /// No description provided for @mStaticRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get mStaticRecommended;

  /// No description provided for @mStaticRecommendedFromFrac.
  ///
  /// In en, this message translates to:
  /// **'Recommended from Frac'**
  String get mStaticRecommendedFromFrac;

  /// No description provided for @mStaticRecommendedFromWAT.
  ///
  /// In en, this message translates to:
  /// **'Recommended from WAT'**
  String get mStaticRecommendedFromWAT;

  /// No description provided for @mStaticAcquiredByYou.
  ///
  /// In en, this message translates to:
  /// **'Added by you'**
  String get mStaticAcquiredByYou;

  /// No description provided for @mStaticAddedByYou.
  ///
  /// In en, this message translates to:
  /// **'Added by you'**
  String get mStaticAddedByYou;

  /// No description provided for @mStaticAddToYourCompetency.
  ///
  /// In en, this message translates to:
  /// **'Add to your competency'**
  String get mStaticAddToYourCompetency;

  /// No description provided for @mStaticSelfAttestDeclaration.
  ///
  /// In en, this message translates to:
  /// **'You are self-declaring competency and you can also take the competency assessment to add further credibility'**
  String get mStaticSelfAttestDeclaration;

  /// No description provided for @mStaticBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get mStaticBack;

  /// No description provided for @mStaticSelectYourLevel.
  ///
  /// In en, this message translates to:
  /// **'Select your competency level'**
  String get mStaticSelectYourLevel;

  /// No description provided for @mStaticBackToAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Back to \"All competencies\"'**
  String get mStaticBackToAllCompetencies;

  /// No description provided for @mStaticDoYouWantToRemove.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove it from your competency ?'**
  String get mStaticDoYouWantToRemove;

  /// No description provided for @mStaticNoAssociatedCBPs.
  ///
  /// In en, this message translates to:
  /// **'No associated CBPs'**
  String get mStaticNoAssociatedCBPs;

  /// No description provided for @mStaticCompetencyAssessment.
  ///
  /// In en, this message translates to:
  /// **'Competency assessment'**
  String get mStaticCompetencyAssessment;

  /// No description provided for @mStaticSelfAttestCompetency.
  ///
  /// In en, this message translates to:
  /// **'Self attest competency'**
  String get mStaticSelfAttestCompetency;

  /// No description provided for @mStaticFromWorkOrder.
  ///
  /// In en, this message translates to:
  /// **'From work order'**
  String get mStaticFromWorkOrder;

  /// No description provided for @mStaticAddToDesired.
  ///
  /// In en, this message translates to:
  /// **'Add your desired competency'**
  String get mStaticAddToDesired;

  /// No description provided for @mStaticLevelBasedOnEvaluation.
  ///
  /// In en, this message translates to:
  /// **'Level based on evaluation'**
  String get mStaticLevelBasedOnEvaluation;

  /// No description provided for @mStaticCompetencyLevelGap.
  ///
  /// In en, this message translates to:
  /// **'Competency level gap'**
  String get mStaticCompetencyLevelGap;

  /// No description provided for @mStaticRecommendedFromWatDescription.
  ///
  /// In en, this message translates to:
  /// **'Recommendations are based on your position and are coming from your Work Allocation Order.'**
  String get mStaticRecommendedFromWatDescription;

  /// No description provided for @mStaticWorkOrder.
  ///
  /// In en, this message translates to:
  /// **'Work order'**
  String get mStaticWorkOrder;

  /// No description provided for @mStaticNoCompetenciesFoundFromWat.
  ///
  /// In en, this message translates to:
  /// **'No competencies found from WAT'**
  String get mStaticNoCompetenciesFoundFromWat;

  /// No description provided for @mStaticRecommendedFromFracDescription.
  ///
  /// In en, this message translates to:
  /// **'Recommendations are based on your position and are coming from FRAC dictionary allocated to your position.'**
  String get mStaticRecommendedFromFracDescription;

  /// No description provided for @mStaticNoCompetenciesFromFRAC.
  ///
  /// In en, this message translates to:
  /// **'No competencies found from FRAC'**
  String get mStaticNoCompetenciesFromFRAC;

  /// No description provided for @mStaticCompetencyFracMessage.
  ///
  /// In en, this message translates to:
  /// **'Competencies will be recommended  \n        based on your position.'**
  String get mStaticCompetencyFracMessage;

  /// No description provided for @mStaticCompetencyType.
  ///
  /// In en, this message translates to:
  /// **'Competency type'**
  String get mStaticCompetencyType;

  /// No description provided for @mStaticCompetencyArea.
  ///
  /// In en, this message translates to:
  /// **'Competency area'**
  String get mStaticCompetencyArea;

  /// No description provided for @mStaticSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get mStaticSubject;

  /// No description provided for @mStaticAllCourses.
  ///
  /// In en, this message translates to:
  /// **'All courses'**
  String get mStaticAllCourses;

  /// No description provided for @mStaticAllSubjects.
  ///
  /// In en, this message translates to:
  /// **'All subjects'**
  String get mStaticAllSubjects;

  /// No description provided for @mStaticAttendLiveEvent.
  ///
  /// In en, this message translates to:
  /// **'Attend Live Event'**
  String get mStaticAttendLiveEvent;

  /// No description provided for @mStaticStarted.
  ///
  /// In en, this message translates to:
  /// **'started'**
  String get mStaticStarted;

  /// No description provided for @mStaticLastUpdatedOn.
  ///
  /// In en, this message translates to:
  /// **'Last updated on '**
  String get mStaticLastUpdatedOn;

  /// No description provided for @mStaticShowLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get mStaticShowLess;

  /// No description provided for @mStaticBatchStartInfo.
  ///
  /// In en, this message translates to:
  /// **'This Batch will start in'**
  String get mStaticBatchStartInfo;

  /// No description provided for @mStaticBatchStartInfoDays.
  ///
  /// In en, this message translates to:
  /// **'days!'**
  String get mStaticBatchStartInfoDays;

  /// No description provided for @mStaticYourPosition.
  ///
  /// In en, this message translates to:
  /// **'Your position'**
  String get mStaticYourPosition;

  /// No description provided for @mStaticFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get mStaticFollowing;

  /// No description provided for @mStaticBrowseByMDO.
  ///
  /// In en, this message translates to:
  /// **'Browse by MDO'**
  String get mStaticBrowseByMDO;

  /// No description provided for @mStaticBrowseByLocation.
  ///
  /// In en, this message translates to:
  /// **'Browse by location'**
  String get mStaticBrowseByLocation;

  /// No description provided for @mStaticPositionInfo.
  ///
  /// In en, this message translates to:
  /// **'Position info'**
  String get mStaticPositionInfo;

  /// No description provided for @mStaticOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening'**
  String get mStaticOpening;

  /// No description provided for @mStaticAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get mStaticAbout;

  /// No description provided for @mStaticPeople.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get mStaticPeople;

  /// No description provided for @mStaticRelatedCourses.
  ///
  /// In en, this message translates to:
  /// **'Related courses'**
  String get mStaticRelatedCourses;

  /// No description provided for @mStaticEnterLocation.
  ///
  /// In en, this message translates to:
  /// **'Enter location'**
  String get mStaticEnterLocation;

  /// No description provided for @mStaticSearchMDOs.
  ///
  /// In en, this message translates to:
  /// **'Search MDOs'**
  String get mStaticSearchMDOs;

  /// No description provided for @mStaticFindGaps.
  ///
  /// In en, this message translates to:
  /// **'Find gaps'**
  String get mStaticFindGaps;

  /// No description provided for @mStaticMatchingCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Matching competencies'**
  String get mStaticMatchingCompetencies;

  /// No description provided for @mStaticCompetencyGaps.
  ///
  /// In en, this message translates to:
  /// **'Competency gaps'**
  String get mStaticCompetencyGaps;

  /// No description provided for @mStaticRecommendedCourses.
  ///
  /// In en, this message translates to:
  /// **'Recommended courses'**
  String get mStaticRecommendedCourses;

  /// No description provided for @mStaticShowInterest.
  ///
  /// In en, this message translates to:
  /// **'Show interest'**
  String get mStaticShowInterest;

  /// No description provided for @mStaticFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get mStaticFollow;

  /// No description provided for @mStaticOpeningsFromMDOs.
  ///
  /// In en, this message translates to:
  /// **'Openings from MDOs you follow'**
  String get mStaticOpeningsFromMDOs;

  /// No description provided for @mStaticRecentlyViewedOpenings.
  ///
  /// In en, this message translates to:
  /// **'Recently viewed openings'**
  String get mStaticRecentlyViewedOpenings;

  /// No description provided for @mStaticOpeningsNearYou.
  ///
  /// In en, this message translates to:
  /// **'Openings near you'**
  String get mStaticOpeningsNearYou;

  /// No description provided for @mStaticMdoToFollow.
  ///
  /// In en, this message translates to:
  /// **'MDOs to follow'**
  String get mStaticMdoToFollow;

  /// No description provided for @mStaticMandatoryCourseGoal.
  ///
  /// In en, this message translates to:
  /// **'Mandatory Course Goal'**
  String get mStaticMandatoryCourseGoal;

  /// No description provided for @mStaticStandaloneAssessments.
  ///
  /// In en, this message translates to:
  /// **'Standalone assessments'**
  String get mStaticStandaloneAssessments;

  /// No description provided for @mStaticTrendingCBPs.
  ///
  /// In en, this message translates to:
  /// **'Trending CBPs'**
  String get mStaticTrendingCBPs;

  /// No description provided for @mStaticPopularTopics.
  ///
  /// In en, this message translates to:
  /// **'Popular topics'**
  String get mStaticPopularTopics;

  /// No description provided for @mStaticRecommendedCBPs.
  ///
  /// In en, this message translates to:
  /// **'Recommended CBPs'**
  String get mStaticRecommendedCBPs;

  /// No description provided for @mStaticTrendingCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Trending  competencies'**
  String get mStaticTrendingCompetencies;

  /// No description provided for @mStaticBrowseByCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Explore by competencies'**
  String get mStaticBrowseByCompetencies;

  /// No description provided for @mStaticLastViewedCBPs.
  ///
  /// In en, this message translates to:
  /// **'Last viewed CBPs'**
  String get mStaticLastViewedCBPs;

  /// No description provided for @mStaticBackToTop.
  ///
  /// In en, this message translates to:
  /// **'Back to top'**
  String get mStaticBackToTop;

  /// No description provided for @mStaticUpcomingSchedules.
  ///
  /// In en, this message translates to:
  /// **'Your Upcoming Schedule'**
  String get mStaticUpcomingSchedules;

  /// No description provided for @mStaticMarkAttendence.
  ///
  /// In en, this message translates to:
  /// **'Mark attendence'**
  String get mStaticMarkAttendence;

  /// No description provided for @mStaticNoRequests.
  ///
  /// In en, this message translates to:
  /// **'No requests'**
  String get mStaticNoRequests;

  /// No description provided for @mStaticNoRequestText.
  ///
  /// In en, this message translates to:
  /// **'Looks like there are no connection \n             requests at the moment'**
  String get mStaticNoRequestText;

  /// No description provided for @mStaticNoEstablishedConnectionText.
  ///
  /// In en, this message translates to:
  /// **'Looks like there are no established  \n                    connections yet'**
  String get mStaticNoEstablishedConnectionText;

  /// No description provided for @mStaticRequests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get mStaticRequests;

  /// No description provided for @mStaticMyMdo.
  ///
  /// In en, this message translates to:
  /// **'Your MDO'**
  String get mStaticMyMdo;

  /// No description provided for @mStaticNoConnectionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Looks like there are no connection requests at the moment'**
  String get mStaticNoConnectionsMessage;

  /// No description provided for @mStaticConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get mStaticConnected;

  /// No description provided for @mStaticReject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get mStaticReject;

  /// No description provided for @mStaticApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get mStaticApprove;

  /// No description provided for @mStaticApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get mStaticApproved;

  /// No description provided for @mStaticNoConnectionRequestsText.
  ///
  /// In en, this message translates to:
  /// **'No connection requests'**
  String get mStaticNoConnectionRequestsText;

  /// No description provided for @mStaticConnectionSent.
  ///
  /// In en, this message translates to:
  /// **'Connection sent'**
  String get mStaticConnectionSent;

  /// No description provided for @mStaticNoEstablishedConnections.
  ///
  /// In en, this message translates to:
  /// **'No connections'**
  String get mStaticNoEstablishedConnections;

  /// No description provided for @mStaticRolesAndActivities.
  ///
  /// In en, this message translates to:
  /// **'1. Roles and Activities'**
  String get mStaticRolesAndActivities;

  /// No description provided for @mStaticTopics.
  ///
  /// In en, this message translates to:
  /// **'2. Topics'**
  String get mStaticTopics;

  /// No description provided for @mStaticCurrentCompetencies.
  ///
  /// In en, this message translates to:
  /// **'3. Current competencies'**
  String get mStaticCurrentCompetencies;

  /// No description provided for @mStaticDesiredCompetency.
  ///
  /// In en, this message translates to:
  /// **'4. Desired competencies'**
  String get mStaticDesiredCompetency;

  /// No description provided for @mStaticPlatformWalkthrough.
  ///
  /// In en, this message translates to:
  /// **'5. Platform walkthrough '**
  String get mStaticPlatformWalkthrough;

  /// No description provided for @mStaticGuidedScreenStarted.
  ///
  /// In en, this message translates to:
  /// **'true'**
  String get mStaticGuidedScreenStarted;

  /// No description provided for @mStaticGuidedScreenEnded.
  ///
  /// In en, this message translates to:
  /// **'false'**
  String get mStaticGuidedScreenEnded;

  /// No description provided for @mStaticNoConnection.
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get mStaticNoConnection;

  /// No description provided for @mStaticNoConnectionDescription.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connectivity and try again'**
  String get mStaticNoConnectionDescription;

  /// No description provided for @mStaticRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get mStaticRetry;

  /// No description provided for @mStaticNoSubmit.
  ///
  /// In en, this message translates to:
  /// **'No, submit'**
  String get mStaticNoSubmit;

  /// No description provided for @mStaticYesTakeMeBack.
  ///
  /// In en, this message translates to:
  /// **'Yes, take me back'**
  String get mStaticYesTakeMeBack;

  /// No description provided for @mStaticSurveyAlreadySubmitted.
  ///
  /// In en, this message translates to:
  /// **'Survey is already submitted'**
  String get mStaticSurveyAlreadySubmitted;

  /// No description provided for @mStaticNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get mStaticNo;

  /// No description provided for @mStaticYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get mStaticYes;

  /// No description provided for @mStaticDiscussionTopicFlag.
  ///
  /// In en, this message translates to:
  /// **'discussionTopicFlag'**
  String get mStaticDiscussionTopicFlag;

  /// No description provided for @mStaticUseShareFeature.
  ///
  /// In en, this message translates to:
  /// **'Please use share option to download the certificate'**
  String get mStaticUseShareFeature;

  /// No description provided for @mStaticLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Logged-In'**
  String get mStaticLoggedIn;

  /// No description provided for @mStaticNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Not Logged-In'**
  String get mStaticNotLoggedIn;

  /// No description provided for @mStaticBoth.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get mStaticBoth;

  /// No description provided for @mStaticInformation.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get mStaticInformation;

  /// No description provided for @mStaticIssues.
  ///
  /// In en, this message translates to:
  /// **'Issues'**
  String get mStaticIssues;

  /// No description provided for @mStaticTeamsLinkKeyword.
  ///
  /// In en, this message translates to:
  /// **'<teams_call_link>'**
  String get mStaticTeamsLinkKeyword;

  /// No description provided for @mStaticHtmlTeamsLink.
  ///
  /// In en, this message translates to:
  /// **'<a href: \$htmlTeamsUriLink> Support Call </a>'**
  String get mStaticHtmlTeamsLink;

  /// No description provided for @mStaticEmailLinkKeyword.
  ///
  /// In en, this message translates to:
  /// **'<email_configuration>'**
  String get mStaticEmailLinkKeyword;

  /// No description provided for @mStaticHtmlEmailLink.
  ///
  /// In en, this message translates to:
  /// **'<a href:\'mailto: mission.karmayogi@gov.in\'> mission.karmayogi@gov.in </a>'**
  String get mStaticHtmlEmailLink;

  /// No description provided for @mStaticWatch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get mStaticWatch;

  /// No description provided for @mStaticPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get mStaticPause;

  /// No description provided for @mStaticKarmayogiTour.
  ///
  /// In en, this message translates to:
  /// **'‘Get Started’ tour'**
  String get mStaticKarmayogiTour;

  /// No description provided for @mStaticTourend.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get mStaticTourend;

  /// No description provided for @mStaticEnrollRemoveMessage.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment request for the selected batch has been '**
  String get mStaticEnrollRemoveMessage;

  /// No description provided for @mStaticTimings.
  ///
  /// In en, this message translates to:
  /// **'9:00 AM to 5:00 PM'**
  String get mStaticTimings;

  /// No description provided for @mStaticWelcomeintrotext.
  ///
  /// In en, this message translates to:
  /// **'National Programme for Civil Services Capacity Building, aptly named as Mission Karmayogi, aims to create a professional, well-trained and future-looking civil service.'**
  String get mStaticWelcomeintrotext;

  /// No description provided for @mStaticHi.
  ///
  /// In en, this message translates to:
  /// **'Namaste'**
  String get mStaticHi;

  /// No description provided for @mStaticShowAllCatgories.
  ///
  /// In en, this message translates to:
  /// **'Show all categories'**
  String get mStaticShowAllCatgories;

  /// No description provided for @mStaticHereSomeFrequentlyAsked.
  ///
  /// In en, this message translates to:
  /// **'Here are some most frequently asked questions users have looked for'**
  String get mStaticHereSomeFrequentlyAsked;

  /// No description provided for @mStaticQuestionsRelated.
  ///
  /// In en, this message translates to:
  /// **'Questions related to above question'**
  String get mStaticQuestionsRelated;

  /// No description provided for @mStaticShowingMoreQuestions.
  ///
  /// In en, this message translates to:
  /// **'Showing more questions'**
  String get mStaticShowingMoreQuestions;

  /// No description provided for @mStaticShowingAllCatgories.
  ///
  /// In en, this message translates to:
  /// **'Showing all categories'**
  String get mStaticShowingAllCatgories;

  /// No description provided for @mStaticShowMore.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get mStaticShowMore;

  /// No description provided for @mStaticTogo.
  ///
  /// In en, this message translates to:
  /// **'to go'**
  String get mStaticTogo;

  /// No description provided for @mStaticInprogress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get mStaticInprogress;

  /// No description provided for @mStaticMyLearning.
  ///
  /// In en, this message translates to:
  /// **'My Learning'**
  String get mStaticMyLearning;

  /// No description provided for @mStaticCertificates.
  ///
  /// In en, this message translates to:
  /// **'Certificate'**
  String get mStaticCertificates;

  /// No description provided for @mStaticLearningHours.
  ///
  /// In en, this message translates to:
  /// **'Learning hours'**
  String get mStaticLearningHours;

  /// No description provided for @mStaticWeeklyClaps.
  ///
  /// In en, this message translates to:
  /// **'Weekly claps'**
  String get mStaticWeeklyClaps;

  /// No description provided for @mStaticWeeks.
  ///
  /// In en, this message translates to:
  /// **'weeks'**
  String get mStaticWeeks;

  /// No description provided for @mStaticShowMyActivities.
  ///
  /// In en, this message translates to:
  /// **'Show my activities'**
  String get mStaticShowMyActivities;

  /// No description provided for @mStaticMarkYourAttendance.
  ///
  /// In en, this message translates to:
  /// **'Mark your attendance'**
  String get mStaticMarkYourAttendance;

  /// No description provided for @mStaticShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get mStaticShowAll;

  /// No description provided for @mStaticTrendingCoursesInYourDepartment.
  ///
  /// In en, this message translates to:
  /// **'Trending courses in your department'**
  String get mStaticTrendingCoursesInYourDepartment;

  /// No description provided for @mStaticLearnHub.
  ///
  /// In en, this message translates to:
  /// **'Learn Hub'**
  String get mStaticLearnHub;

  /// No description provided for @mStaticTrendingProgramsInYourDepartment.
  ///
  /// In en, this message translates to:
  /// **'Trending programs in your department'**
  String get mStaticTrendingProgramsInYourDepartment;

  /// No description provided for @mStaticMostEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Most Enrolled'**
  String get mStaticMostEnrolled;

  /// No description provided for @mStaticDiscussHub.
  ///
  /// In en, this message translates to:
  /// **'Discuss Hub'**
  String get mStaticDiscussHub;

  /// No description provided for @mStaticPostDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Post a discussion'**
  String get mStaticPostDiscussion;

  /// No description provided for @mStaticTrendingDiscussion.
  ///
  /// In en, this message translates to:
  /// **'Trending discussion'**
  String get mStaticTrendingDiscussion;

  /// No description provided for @mStaticVotes.
  ///
  /// In en, this message translates to:
  /// **'votes'**
  String get mStaticVotes;

  /// No description provided for @mStaticViews.
  ///
  /// In en, this message translates to:
  /// **'views'**
  String get mStaticViews;

  /// No description provided for @mStaticComments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get mStaticComments;

  /// No description provided for @mStaticYourDiscussions.
  ///
  /// In en, this message translates to:
  /// **'Your discussions'**
  String get mStaticYourDiscussions;

  /// No description provided for @mStaticMyActivities.
  ///
  /// In en, this message translates to:
  /// **'My activities'**
  String get mStaticMyActivities;

  /// No description provided for @mStaticYourStats.
  ///
  /// In en, this message translates to:
  /// **'Your stats'**
  String get mStaticYourStats;

  /// No description provided for @mStaticRecentRequests.
  ///
  /// In en, this message translates to:
  /// **'Recent requests'**
  String get mStaticRecentRequests;

  /// No description provided for @mStaticWhatIsWeeklyClaps.
  ///
  /// In en, this message translates to:
  /// **'What is weekly claps?'**
  String get mStaticWhatIsWeeklyClaps;

  /// No description provided for @mStaticWeeklyClapTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'Weekly Claps are a fun way to track your engagement on the platform. They reflect your commitment and activity levels.'**
  String get mStaticWeeklyClapTitleDescription;

  /// No description provided for @mStaticMaintainClaps.
  ///
  /// In en, this message translates to:
  /// **'What should I do to maintain the claps?'**
  String get mStaticMaintainClaps;

  /// No description provided for @mStaticSpentAtleast.
  ///
  /// In en, this message translates to:
  /// **'Spend at least'**
  String get mStaticSpentAtleast;

  /// No description provided for @mStaticMinutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get mStaticMinutes;

  /// No description provided for @mStaticEngageWithPlatform.
  ///
  /// In en, this message translates to:
  /// **'engaging with the platform every week to maintain your claps.'**
  String get mStaticEngageWithPlatform;

  /// No description provided for @mStaticWhyDidLossClaps.
  ///
  /// In en, this message translates to:
  /// **'Why did I lose my claps?'**
  String get mStaticWhyDidLossClaps;

  /// No description provided for @mStaticFallShort.
  ///
  /// In en, this message translates to:
  /// **'If you fall short of the'**
  String get mStaticFallShort;

  /// No description provided for @mStaticEngagementRequirement.
  ///
  /// In en, this message translates to:
  /// **'engagement requirement in a week, your claps count resets to zero.'**
  String get mStaticEngagementRequirement;

  /// No description provided for @mStaticWaitTillSessionStart.
  ///
  /// In en, this message translates to:
  /// **'Please wait until the session begins to mark attendance.'**
  String get mStaticWaitTillSessionStart;

  /// No description provided for @mStaticLearningUnder30Minutes.
  ///
  /// In en, this message translates to:
  /// **'Learning under 30 min'**
  String get mStaticLearningUnder30Minutes;

  /// No description provided for @mStaticUpdatePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Update your phone number'**
  String get mStaticUpdatePhoneNumber;

  /// No description provided for @mStaticUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get mStaticUpdate;

  /// No description provided for @mStaticUpdateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update your profile'**
  String get mStaticUpdateProfile;

  /// No description provided for @mStaticMyActivitySeePendingReqs.
  ///
  /// In en, this message translates to:
  /// **'See all pending requests'**
  String get mStaticMyActivitySeePendingReqs;

  /// No description provided for @mStaticUnableToConnectInternet.
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to the server. Please check your connection.'**
  String get mStaticUnableToConnectInternet;

  /// No description provided for @mStaticCertificateOfWeek.
  ///
  /// In en, this message translates to:
  /// **'Certificate of the week'**
  String get mStaticCertificateOfWeek;

  /// No description provided for @mStaticTopProvidersTitle.
  ///
  /// In en, this message translates to:
  /// **'Top providers powering your learning'**
  String get mStaticTopProvidersTitle;

  /// No description provided for @mStaticEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get mStaticEmail;

  /// No description provided for @mStaticPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get mStaticPassword;

  /// No description provided for @mStaticRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get mStaticRegister;

  /// No description provided for @mStaticSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get mStaticSignIn;

  /// No description provided for @mStaticShowcasedCourses.
  ///
  /// In en, this message translates to:
  /// **'Showcased Courses'**
  String get mStaticShowcasedCourses;

  /// No description provided for @mStaticCenter.
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get mStaticCenter;

  /// No description provided for @mStaticState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get mStaticState;

  /// No description provided for @mStaticOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Organisation'**
  String get mStaticOrganisation;

  /// No description provided for @mStaticNoGovtEmail.
  ///
  /// In en, this message translates to:
  /// **'Do not have a government email address?'**
  String get mStaticNoGovtEmail;

  /// No description provided for @mStaticRequestForHelp.
  ///
  /// In en, this message translates to:
  /// **'Request for help'**
  String get mStaticRequestForHelp;

  /// No description provided for @mStaticSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get mStaticSubmit;

  /// No description provided for @mStaticGroup.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get mStaticGroup;

  /// No description provided for @mStaticHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get mStaticHome;

  /// No description provided for @mStaticSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get mStaticSearch;

  /// No description provided for @mStaticDoMore.
  ///
  /// In en, this message translates to:
  /// **'Do more'**
  String get mStaticDoMore;

  /// No description provided for @mStaticHubs.
  ///
  /// In en, this message translates to:
  /// **'Hubs'**
  String get mStaticHubs;

  /// No description provided for @mStaticNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get mStaticNetwork;

  /// No description provided for @mStaticLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get mStaticLearn;

  /// No description provided for @mStaticExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get mStaticExplore;

  /// No description provided for @mStaticCareers.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get mStaticCareers;

  /// No description provided for @mStaticCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Competencies'**
  String get mStaticCompetencies;

  /// No description provided for @mStaticEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get mStaticEvents;

  /// No description provided for @mStaticKnowledgeResources.
  ///
  /// In en, this message translates to:
  /// **'Knowledge resources'**
  String get mStaticKnowledgeResources;

  /// No description provided for @mStaticKnowledgeResourcesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the latest policies, circulars and all available knowledge resources.'**
  String get mStaticKnowledgeResourcesSubtitle;

  /// No description provided for @mStaticDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get mStaticDashboard;

  /// No description provided for @mStaticSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get mStaticSettings;

  /// No description provided for @mStaticFracDictionary.
  ///
  /// In en, this message translates to:
  /// **'FRAC dictionary'**
  String get mStaticFracDictionary;

  /// No description provided for @mStaticSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get mStaticSignUp;

  /// No description provided for @mStaticFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get mStaticFullName;

  /// No description provided for @mStaticFullNameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Full name is mandatory'**
  String get mStaticFullNameMandatory;

  /// No description provided for @mStaticOrganisationMandate.
  ///
  /// In en, this message translates to:
  /// **'Please enter your organisation name'**
  String get mStaticOrganisationMandate;

  /// No description provided for @mStaticEmailValidationText.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get mStaticEmailValidationText;

  /// No description provided for @mStaticCenterOrState.
  ///
  /// In en, this message translates to:
  /// **'Center/State'**
  String get mStaticCenterOrState;

  /// No description provided for @mStaticCourses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get mStaticCourses;

  /// No description provided for @mStaticTopReviews.
  ///
  /// In en, this message translates to:
  /// **'Top reviews'**
  String get mStaticTopReviews;

  /// No description provided for @mStaticLatestReviews.
  ///
  /// In en, this message translates to:
  /// **'Latest reviews'**
  String get mStaticLatestReviews;

  /// No description provided for @mStaticBasedOnYourInterests.
  ///
  /// In en, this message translates to:
  /// **'Based on your interests'**
  String get mStaticBasedOnYourInterests;

  /// No description provided for @mStaticRequestUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Request under review'**
  String get mStaticRequestUnderReview;

  /// No description provided for @mStaticYourProgress.
  ///
  /// In en, this message translates to:
  /// **'Your progress'**
  String get mStaticYourProgress;

  /// No description provided for @mStaticAuthorsAndCurators.
  ///
  /// In en, this message translates to:
  /// **'Authors and curators'**
  String get mStaticAuthorsAndCurators;

  /// No description provided for @mStaticSearchInReviews.
  ///
  /// In en, this message translates to:
  /// **'Search in reviews'**
  String get mStaticSearchInReviews;

  /// No description provided for @mStaticNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get mStaticNotFound;

  /// No description provided for @mStaticStartAgain.
  ///
  /// In en, this message translates to:
  /// **'START AGAIN'**
  String get mStaticStartAgain;

  /// No description provided for @mStaticResume.
  ///
  /// In en, this message translates to:
  /// **'RESUME'**
  String get mStaticResume;

  /// No description provided for @mStaticStart.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get mStaticStart;

  /// No description provided for @mStaticEnroll.
  ///
  /// In en, this message translates to:
  /// **'Enroll'**
  String get mStaticEnroll;

  /// No description provided for @mStaticView.
  ///
  /// In en, this message translates to:
  /// **'VIEW'**
  String get mStaticView;

  /// No description provided for @mStaticFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get mStaticFinish;

  /// No description provided for @mStaticBatchLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Batch location'**
  String get mStaticBatchLocationTitle;

  /// No description provided for @mStaticEnrolmentApprovedDesc.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment is now approved.'**
  String get mStaticEnrolmentApprovedDesc;

  /// No description provided for @mStaticEnrolmentRequestInReviewDesc.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment request is being reviewed. You will be notified when it is approved.'**
  String get mStaticEnrolmentRequestInReviewDesc;

  /// No description provided for @mStaticDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Discuss'**
  String get mStaticDiscuss;

  /// No description provided for @mStaticDiscussions.
  ///
  /// In en, this message translates to:
  /// **'Discussions'**
  String get mStaticDiscussions;

  /// No description provided for @mStaticStartNewDiscussionText.
  ///
  /// In en, this message translates to:
  /// **'Click on the + button to start a new discussion'**
  String get mStaticStartNewDiscussionText;

  /// No description provided for @mStaticAllDiscussions.
  ///
  /// In en, this message translates to:
  /// **'All discussions'**
  String get mStaticAllDiscussions;

  /// No description provided for @mStaticMyDiscussions.
  ///
  /// In en, this message translates to:
  /// **'My discussions'**
  String get mStaticMyDiscussions;

  /// No description provided for @mStaticCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get mStaticCategories;

  /// No description provided for @mStaticTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get mStaticTags;

  /// No description provided for @mStaticSubmitPost.
  ///
  /// In en, this message translates to:
  /// **'Submit post'**
  String get mStaticSubmitPost;

  /// No description provided for @mStaticDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get mStaticDiscard;

  /// No description provided for @mStaticDiscussionTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask a question or post an idea'**
  String get mStaticDiscussionTitle;

  /// No description provided for @mStaticRecentPosts.
  ///
  /// In en, this message translates to:
  /// **'Recent posts'**
  String get mStaticRecentPosts;

  /// No description provided for @mStaticBestPosts.
  ///
  /// In en, this message translates to:
  /// **'Best posts'**
  String get mStaticBestPosts;

  /// No description provided for @mStaticUpvoted.
  ///
  /// In en, this message translates to:
  /// **'Upvoted'**
  String get mStaticUpvoted;

  /// No description provided for @mStaticDownvoted.
  ///
  /// In en, this message translates to:
  /// **'Downvoted'**
  String get mStaticDownvoted;

  /// No description provided for @mStaticTakeTest.
  ///
  /// In en, this message translates to:
  /// **'Take test'**
  String get mStaticTakeTest;

  /// No description provided for @mStaticClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get mStaticClose;

  /// No description provided for @mStaticGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get mStaticGoBack;

  /// No description provided for @mStaticComingSoon.
  ///
  /// In en, this message translates to:
  /// **'COMING SOON'**
  String get mStaticComingSoon;

  /// No description provided for @mStaticRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get mStaticRecent;

  /// No description provided for @mStaticPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get mStaticPopular;

  /// No description provided for @mStaticMostViewed.
  ///
  /// In en, this message translates to:
  /// **'Most viewed'**
  String get mStaticMostViewed;

  /// No description provided for @mStaticLastAdded.
  ///
  /// In en, this message translates to:
  /// **'Last added'**
  String get mStaticLastAdded;

  /// No description provided for @mStaticSortByName.
  ///
  /// In en, this message translates to:
  /// **'Sort by name'**
  String get mStaticSortByName;

  /// No description provided for @mStaticAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get mStaticAll;

  /// No description provided for @mStaticSearchByName.
  ///
  /// In en, this message translates to:
  /// **'Search by name'**
  String get mStaticSearchByName;

  /// No description provided for @mStaticFilterBy.
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get mStaticFilterBy;

  /// No description provided for @mStaticNoResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get mStaticNoResultsFound;

  /// No description provided for @mStaticNoFilterResultInfo.
  ///
  /// In en, this message translates to:
  /// **'Try removing the filters or search using different keywords'**
  String get mStaticNoFilterResultInfo;

  /// No description provided for @mStaticNoResultFromSearch.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any matches for your search.'**
  String get mStaticNoResultFromSearch;

  /// No description provided for @mStaticNoReviewsFound.
  ///
  /// In en, this message translates to:
  /// **'No reviews found!'**
  String get mStaticNoReviewsFound;

  /// No description provided for @mStaticDownloadCertificate.
  ///
  /// In en, this message translates to:
  /// **'Download certificate'**
  String get mStaticDownloadCertificate;

  /// No description provided for @mStaticProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get mStaticProfile;

  /// No description provided for @mStaticSavedPosts.
  ///
  /// In en, this message translates to:
  /// **'Saved posts'**
  String get mStaticSavedPosts;

  /// No description provided for @mStaticPersonalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal details'**
  String get mStaticPersonalDetails;

  /// No description provided for @mStaticAcademics.
  ///
  /// In en, this message translates to:
  /// **'Academics'**
  String get mStaticAcademics;

  /// No description provided for @mStaticProfessionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Professional details'**
  String get mStaticProfessionalDetails;

  /// No description provided for @mStaticMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get mStaticMale;

  /// No description provided for @mStaticFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get mStaticFemale;

  /// No description provided for @mStaticOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get mStaticOthers;

  /// No description provided for @mStaticSingle.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get mStaticSingle;

  /// No description provided for @mStaticMarried.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get mStaticMarried;

  /// No description provided for @mStaticGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get mStaticGeneral;

  /// No description provided for @mStaticObc.
  ///
  /// In en, this message translates to:
  /// **'OBC'**
  String get mStaticObc;

  /// No description provided for @mStaticSc.
  ///
  /// In en, this message translates to:
  /// **'SC'**
  String get mStaticSc;

  /// No description provided for @mStaticSt.
  ///
  /// In en, this message translates to:
  /// **'ST'**
  String get mStaticSt;

  /// No description provided for @mStaticEnterYourFullname.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get mStaticEnterYourFullname;

  /// No description provided for @mStaticEnterYourMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mStaticEnterYourMobileNumber;

  /// No description provided for @mStaticDob.
  ///
  /// In en, this message translates to:
  /// **'Date of birth (dd-mm-yyyy)'**
  String get mStaticDob;

  /// No description provided for @mStaticNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get mStaticNationality;

  /// No description provided for @mStaticGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get mStaticGender;

  /// No description provided for @mStaticMaritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Marital status'**
  String get mStaticMaritalStatus;

  /// No description provided for @mStaticCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get mStaticCategory;

  /// No description provided for @mStaticDomicileMeduium.
  ///
  /// In en, this message translates to:
  /// **'Domicile medium (Mother tongue)'**
  String get mStaticDomicileMeduium;

  /// No description provided for @mStaticOtherLangs.
  ///
  /// In en, this message translates to:
  /// **'Other languages known'**
  String get mStaticOtherLangs;

  /// No description provided for @mStaticMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mStaticMobileNumber;

  /// No description provided for @mStaticPrimaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Primary email'**
  String get mStaticPrimaryEmail;

  /// No description provided for @mStaticMyOfficialEmailText.
  ///
  /// In en, this message translates to:
  /// **'This is my official email'**
  String get mStaticMyOfficialEmailText;

  /// No description provided for @mStaticSecondaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Secondary email'**
  String get mStaticSecondaryEmail;

  /// No description provided for @mStaticPostalAddress.
  ///
  /// In en, this message translates to:
  /// **'Postal Address'**
  String get mStaticPostalAddress;

  /// No description provided for @mStaticChacters.
  ///
  /// In en, this message translates to:
  /// **'characters'**
  String get mStaticChacters;

  /// No description provided for @mStaticPinCode.
  ///
  /// In en, this message translates to:
  /// **'Pin code'**
  String get mStaticPinCode;

  /// No description provided for @mStaticTagsText.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get mStaticTagsText;

  /// No description provided for @mStaticDegres.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get mStaticDegres;

  /// No description provided for @mStaticYearOfPassing.
  ///
  /// In en, this message translates to:
  /// **'Year of passing'**
  String get mStaticYearOfPassing;

  /// No description provided for @mStaticInstituteName.
  ///
  /// In en, this message translates to:
  /// **'Institute name'**
  String get mStaticInstituteName;

  /// No description provided for @mStaticIndustry.
  ///
  /// In en, this message translates to:
  /// **'Industry'**
  String get mStaticIndustry;

  /// No description provided for @mStaticDesignation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get mStaticDesignation;

  /// No description provided for @mStaticLocation.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get mStaticLocation;

  /// No description provided for @mStaticDoj.
  ///
  /// In en, this message translates to:
  /// **'Date of joining'**
  String get mStaticDoj;

  /// No description provided for @mStaticDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mStaticDescription;

  /// No description provided for @mStaticSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get mStaticSummary;

  /// No description provided for @mStaticService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get mStaticService;

  /// No description provided for @mStaticCadre.
  ///
  /// In en, this message translates to:
  /// **'Cadre'**
  String get mStaticCadre;

  /// No description provided for @mStaticAllotmentYearOfService.
  ///
  /// In en, this message translates to:
  /// **'Allotment year of service'**
  String get mStaticAllotmentYearOfService;

  /// No description provided for @mStaticCivilListNumber.
  ///
  /// In en, this message translates to:
  /// **'Civil list number'**
  String get mStaticCivilListNumber;

  /// No description provided for @mStaticEmployeeCode.
  ///
  /// In en, this message translates to:
  /// **'Employee code'**
  String get mStaticEmployeeCode;

  /// No description provided for @mStaticSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get mStaticSkills;

  /// No description provided for @mStaticStandardTenth.
  ///
  /// In en, this message translates to:
  /// **'10th Standard'**
  String get mStaticStandardTenth;

  /// No description provided for @mStaticStandardTwelfth.
  ///
  /// In en, this message translates to:
  /// **'12th Standard'**
  String get mStaticStandardTwelfth;

  /// No description provided for @mStaticGradDetails.
  ///
  /// In en, this message translates to:
  /// **'Graduation details'**
  String get mStaticGradDetails;

  /// No description provided for @mStaticSchoolName.
  ///
  /// In en, this message translates to:
  /// **'School name'**
  String get mStaticSchoolName;

  /// No description provided for @mStaticEmptyMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get mStaticEmptyMobileNumber;

  /// No description provided for @mStaticSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get mStaticSendOtp;

  /// No description provided for @mStaticEnterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get mStaticEnterOtp;

  /// No description provided for @mStaticVerifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get mStaticVerifyOtp;

  /// No description provided for @mStaticResendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get mStaticResendOtp;

  /// No description provided for @mStaticSimilarProfiles.
  ///
  /// In en, this message translates to:
  /// **'Similar profiles'**
  String get mStaticSimilarProfiles;

  /// No description provided for @mStaticExploreByCompetency.
  ///
  /// In en, this message translates to:
  /// **'Explore by Competency'**
  String get mStaticExploreByCompetency;

  /// No description provided for @mStaticExploreByProvider.
  ///
  /// In en, this message translates to:
  /// **'Explore by Provider'**
  String get mStaticExploreByProvider;

  /// No description provided for @mStaticCuratedCollections.
  ///
  /// In en, this message translates to:
  /// **'Curated Collections'**
  String get mStaticCuratedCollections;

  /// No description provided for @mStaticModeratedCourses.
  ///
  /// In en, this message translates to:
  /// **'Moderated Courses'**
  String get mStaticModeratedCourses;

  /// No description provided for @mStaticBlendedProgram.
  ///
  /// In en, this message translates to:
  /// **'Blended program'**
  String get mStaticBlendedProgram;

  /// No description provided for @mStaticProgram.
  ///
  /// In en, this message translates to:
  /// **'Program'**
  String get mStaticProgram;

  /// No description provided for @mStaticCourse.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get mStaticCourse;

  /// No description provided for @mStaticLearningResource.
  ///
  /// In en, this message translates to:
  /// **'Learning resource'**
  String get mStaticLearningResource;

  /// No description provided for @mStaticStandaloneAssessment.
  ///
  /// In en, this message translates to:
  /// **'Standalone Assessment'**
  String get mStaticStandaloneAssessment;

  /// No description provided for @mStaticModeratedCourse.
  ///
  /// In en, this message translates to:
  /// **'Moderated Courses'**
  String get mStaticModeratedCourse;

  /// No description provided for @mStaticInteractiveContent.
  ///
  /// In en, this message translates to:
  /// **'Interactive content'**
  String get mStaticInteractiveContent;

  /// No description provided for @mStaticWebpage.
  ///
  /// In en, this message translates to:
  /// **'Webpage'**
  String get mStaticWebpage;

  /// No description provided for @mStaticAssessment.
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get mStaticAssessment;

  /// No description provided for @mStaticPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get mStaticPdf;

  /// No description provided for @mStaticVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get mStaticVideo;

  /// No description provided for @mStaticAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get mStaticAudio;

  /// No description provided for @mStaticContentType.
  ///
  /// In en, this message translates to:
  /// **'Content type'**
  String get mStaticContentType;

  /// No description provided for @mStaticYourCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Your competencies'**
  String get mStaticYourCompetencies;

  /// No description provided for @mStaticAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'All competencies'**
  String get mStaticAllCompetencies;

  /// No description provided for @mStaticDesired.
  ///
  /// In en, this message translates to:
  /// **'Desired'**
  String get mStaticDesired;

  /// No description provided for @mStaticAddACompetency.
  ///
  /// In en, this message translates to:
  /// **'Add a competency'**
  String get mStaticAddACompetency;

  /// No description provided for @mStaticNoCompetenciesFound.
  ///
  /// In en, this message translates to:
  /// **'No competencies found'**
  String get mStaticNoCompetenciesFound;

  /// No description provided for @mStaticRemoveFromYourCompetency.
  ///
  /// In en, this message translates to:
  /// **'Remove from your competency'**
  String get mStaticRemoveFromYourCompetency;

  /// No description provided for @mStaticRecommendedCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Recommended competencies'**
  String get mStaticRecommendedCompetencies;

  /// No description provided for @mStaticType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get mStaticType;

  /// No description provided for @mStaticEventIsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Event is completed'**
  String get mStaticEventIsCompleted;

  /// No description provided for @mStaticEventIsNotCompleted.
  ///
  /// In en, this message translates to:
  /// **'Event is yet to start'**
  String get mStaticEventIsNotCompleted;

  /// No description provided for @mStaticCompleted.
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get mStaticCompleted;

  /// No description provided for @mStaticNotStarted.
  ///
  /// In en, this message translates to:
  /// **'not started'**
  String get mStaticNotStarted;

  /// No description provided for @mStaticAtAGlance.
  ///
  /// In en, this message translates to:
  /// **'At a glance'**
  String get mStaticAtAGlance;

  /// No description provided for @mStaticEventType.
  ///
  /// In en, this message translates to:
  /// **'Event Type'**
  String get mStaticEventType;

  /// No description provided for @mStaticHostedBy.
  ///
  /// In en, this message translates to:
  /// **'Hosted By'**
  String get mStaticHostedBy;

  /// No description provided for @mStaticReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get mStaticReadMore;

  /// No description provided for @mStaticPresenters.
  ///
  /// In en, this message translates to:
  /// **'Presenters'**
  String get mStaticPresenters;

  /// No description provided for @mStaticAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get mStaticAgenda;

  /// No description provided for @mStaticFromYourMDO.
  ///
  /// In en, this message translates to:
  /// **'From your MDO'**
  String get mStaticFromYourMDO;

  /// No description provided for @mStaticBites.
  ///
  /// In en, this message translates to:
  /// **'Bites'**
  String get mStaticBites;

  /// No description provided for @mStaticYourLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue learning'**
  String get mStaticYourLearning;

  /// No description provided for @mStaticMandatoryCourses.
  ///
  /// In en, this message translates to:
  /// **'Mandatory courses'**
  String get mStaticMandatoryCourses;

  /// No description provided for @mStaticSeeAll.
  ///
  /// In en, this message translates to:
  /// **'SEE ALL'**
  String get mStaticSeeAll;

  /// No description provided for @mStaticCuratedPrograms.
  ///
  /// In en, this message translates to:
  /// **'Curated Programs'**
  String get mStaticCuratedPrograms;

  /// No description provided for @mStaticRecentlyAddedCourses.
  ///
  /// In en, this message translates to:
  /// **'Recently Added Courses'**
  String get mStaticRecentlyAddedCourses;

  /// No description provided for @mStaticRecentlyAddedPrograms.
  ///
  /// In en, this message translates to:
  /// **'Recently Added Programs'**
  String get mStaticRecentlyAddedPrograms;

  /// No description provided for @mStaticPrograms.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get mStaticPrograms;

  /// No description provided for @mStaticPeopleYouMayKnow.
  ///
  /// In en, this message translates to:
  /// **'People you may know'**
  String get mStaticPeopleYouMayKnow;

  /// No description provided for @mStaticConnections.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get mStaticConnections;

  /// No description provided for @mStaticConnection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get mStaticConnection;

  /// No description provided for @mStaticMyConnections.
  ///
  /// In en, this message translates to:
  /// **'Your connections'**
  String get mStaticMyConnections;

  /// No description provided for @mStaticConnectionRequests.
  ///
  /// In en, this message translates to:
  /// **'Connection requests'**
  String get mStaticConnectionRequests;

  /// No description provided for @mStaticFromMyMdo.
  ///
  /// In en, this message translates to:
  /// **'From your MDO'**
  String get mStaticFromMyMdo;

  /// No description provided for @mStaticRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get mStaticRejected;

  /// No description provided for @mStaticConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get mStaticConnect;

  /// No description provided for @mStaticCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get mStaticCancel;

  /// No description provided for @mStaticNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get mStaticNext;

  /// No description provided for @mStaticPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get mStaticPrevious;

  /// No description provided for @mStaticGetstarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get mStaticGetstarted;

  /// No description provided for @mStaticTourstart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get mStaticTourstart;

  /// No description provided for @mStaticSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get mStaticSkip;

  /// No description provided for @mStaticCongratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get mStaticCongratulations;

  /// No description provided for @mStaticCongratulationsDesc.
  ///
  /// In en, this message translates to:
  /// **'You are all set to start your learning journey.'**
  String get mStaticCongratulationsDesc;

  /// No description provided for @mStaticGetStartedFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get mStaticGetStartedFinish;

  /// No description provided for @mStaticDiscussDesc.
  ///
  /// In en, this message translates to:
  /// **'Discuss new ideas with colleagues and experts in the government.'**
  String get mStaticDiscussDesc;

  /// No description provided for @mStaticLearnDesc.
  ///
  /// In en, this message translates to:
  /// **'Drive your career forward through appropriate courses, programs and assessments.'**
  String get mStaticLearnDesc;

  /// No description provided for @mStaticSearchDesc.
  ///
  /// In en, this message translates to:
  /// **'Find the perfect course and program tailor-made for you.'**
  String get mStaticSearchDesc;

  /// No description provided for @mStaticMyProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get mStaticMyProfile;

  /// No description provided for @mStaticProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'Update your information to get the best-suited courses and programs.'**
  String get mStaticProfileDesc;

  /// No description provided for @mStaticWelcome.
  ///
  /// In en, this message translates to:
  /// **'Namaste! Welcome to the journey of anytime anywhere learning.'**
  String get mStaticWelcome;

  /// No description provided for @mStaticGetstartvideo.
  ///
  /// In en, this message translates to:
  /// **'What is iGOT Karmayogi?'**
  String get mStaticGetstartvideo;

  /// No description provided for @mStaticVideoConference.
  ///
  /// In en, this message translates to:
  /// **'We are now available on Video Conference'**
  String get mStaticVideoConference;

  /// No description provided for @mStaticSupportrequired.
  ///
  /// In en, this message translates to:
  /// **'For any support required'**
  String get mStaticSupportrequired;

  /// No description provided for @mStaticDay.
  ///
  /// In en, this message translates to:
  /// **'Monday to Friday'**
  String get mStaticDay;

  /// No description provided for @mStaticEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get mStaticEdit;

  /// No description provided for @mStaticChangeMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Change mobile number'**
  String get mStaticChangeMobileNumber;

  /// No description provided for @mRegisterEmailMandatory.
  ///
  /// In en, this message translates to:
  /// **'Email is mandatory'**
  String get mRegisterEmailMandatory;

  /// No description provided for @mRegisterMobileNumberMandatory.
  ///
  /// In en, this message translates to:
  /// **'Mobile number is mandatory'**
  String get mRegisterMobileNumberMandatory;

  /// No description provided for @mRegisterVerifyMobile.
  ///
  /// In en, this message translates to:
  /// **'Please verify your mobile number'**
  String get mRegisterVerifyMobile;

  /// No description provided for @mRegisterOrganisationMandatory.
  ///
  /// In en, this message translates to:
  /// **'Organisation is mandatory'**
  String get mRegisterOrganisationMandatory;

  /// No description provided for @mRegisterTapToSearch.
  ///
  /// In en, this message translates to:
  /// **'Tap here to search'**
  String get mRegisterTapToSearch;

  /// No description provided for @mHomeExitApp.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit the application?'**
  String get mHomeExitApp;

  /// No description provided for @mHomeComfirmExit.
  ///
  /// In en, this message translates to:
  /// **'Yes, Exit'**
  String get mHomeComfirmExit;

  /// No description provided for @mHomeCancelExit.
  ///
  /// In en, this message translates to:
  /// **'No, take me back'**
  String get mHomeCancelExit;

  /// No description provided for @mCommonHey.
  ///
  /// In en, this message translates to:
  /// **'Hey'**
  String get mCommonHey;

  /// No description provided for @mCommonProfileIsComplete.
  ///
  /// In en, this message translates to:
  /// **'Profile is {percentage}% completed'**
  String mCommonProfileIsComplete(Object percentage);

  /// No description provided for @mCommonCertificates.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get mCommonCertificates;

  /// No description provided for @mCommonLearningHours.
  ///
  /// In en, this message translates to:
  /// **'Learning hours'**
  String get mCommonLearningHours;

  /// No description provided for @mCommonSpendMinimum.
  ///
  /// In en, this message translates to:
  /// **'Simple Spend a Minimum of'**
  String get mCommonSpendMinimum;

  /// No description provided for @mStaticAcbpBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'My iGOT'**
  String get mStaticAcbpBannerTitle;

  /// No description provided for @mStaticTrendingProgramsAcrossDepartment.
  ///
  /// In en, this message translates to:
  /// **'Trending Programs Across Department'**
  String get mStaticTrendingProgramsAcrossDepartment;

  /// No description provided for @mStaticConnectionsRequestsWaiting.
  ///
  /// In en, this message translates to:
  /// **'Connections requests waiting for you'**
  String get mStaticConnectionsRequestsWaiting;

  /// No description provided for @mStaticFollowUs.
  ///
  /// In en, this message translates to:
  /// **'Follow us'**
  String get mStaticFollowUs;

  /// No description provided for @mProfileNationalityMandatory.
  ///
  /// In en, this message translates to:
  /// **'Nationality is mandatory'**
  String get mProfileNationalityMandatory;

  /// No description provided for @mProfileGenderMandatory.
  ///
  /// In en, this message translates to:
  /// **'Gender is mandatory'**
  String get mProfileGenderMandatory;

  /// No description provided for @mProfileMaritalMandatory.
  ///
  /// In en, this message translates to:
  /// **'Marital is mandatory'**
  String get mProfileMaritalMandatory;

  /// No description provided for @mProfileCategoryMandatory.
  ///
  /// In en, this message translates to:
  /// **'Category is mandatory'**
  String get mProfileCategoryMandatory;

  /// No description provided for @mCommonTypeHere.
  ///
  /// In en, this message translates to:
  /// **'Type here'**
  String get mCommonTypeHere;

  /// No description provided for @mProfileAddAnotherQualification.
  ///
  /// In en, this message translates to:
  /// **'Add another qualification'**
  String get mProfileAddAnotherQualification;

  /// No description provided for @mProfileDeleteDegree.
  ///
  /// In en, this message translates to:
  /// **'Delete degree'**
  String get mProfileDeleteDegree;

  /// No description provided for @mProfileIssuedOn.
  ///
  /// In en, this message translates to:
  /// **'Issued on'**
  String get mProfileIssuedOn;

  /// No description provided for @mDiscussionReport.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get mDiscussionReport;

  /// No description provided for @mDiscussAlreadyReported.
  ///
  /// In en, this message translates to:
  /// **'The content has already been flagged. We will use this information to find and remove more spam.'**
  String get mDiscussAlreadyReported;

  /// No description provided for @mDiscussThanksForLettingUsKnow.
  ///
  /// In en, this message translates to:
  /// **'Thanks for letting us know'**
  String get mDiscussThanksForLettingUsKnow;

  /// No description provided for @mDiscussReportThis.
  ///
  /// In en, this message translates to:
  /// **'Report this'**
  String get mDiscussReportThis;

  /// No description provided for @mDiscussPost.
  ///
  /// In en, this message translates to:
  /// **'post'**
  String get mDiscussPost;

  /// No description provided for @mDiscussUser.
  ///
  /// In en, this message translates to:
  /// **'user'**
  String get mDiscussUser;

  /// No description provided for @mDiscussWhyAreYouReporting.
  ///
  /// In en, this message translates to:
  /// **'Why are you reporting'**
  String get mDiscussWhyAreYouReporting;

  /// No description provided for @mDiscussPleaseTypeReason.
  ///
  /// In en, this message translates to:
  /// **'Please type any reason'**
  String get mDiscussPleaseTypeReason;

  /// No description provided for @mDiscussReportReason1.
  ///
  /// In en, this message translates to:
  /// **'Spam, suspicious content, fake content or misinformation'**
  String get mDiscussReportReason1;

  /// No description provided for @mDiscussReportReason1Des.
  ///
  /// In en, this message translates to:
  /// **'This content includes spam, fraud, fake content or misinformation.'**
  String get mDiscussReportReason1Des;

  /// No description provided for @mDiscussReportReason2.
  ///
  /// In en, this message translates to:
  /// **'Harassment, hateful speech, incites violence or physical harm'**
  String get mDiscussReportReason2;

  /// No description provided for @mDiscussReportReason2Des.
  ///
  /// In en, this message translates to:
  /// **'This content includes harassment, hateful speech, incites violence of physical harm.'**
  String get mDiscussReportReason2Des;

  /// No description provided for @mDiscussReportReason3.
  ///
  /// In en, this message translates to:
  /// **'Adult, pornographic or violent content'**
  String get mDiscussReportReason3;

  /// No description provided for @mDiscussReportReason3Des.
  ///
  /// In en, this message translates to:
  /// **'This content includes adult content including pornographic or other violent content violating platform policy.'**
  String get mDiscussReportReason3Des;

  /// No description provided for @mDiscussReportReason4.
  ///
  /// In en, this message translates to:
  /// **'Defamatory content, Privacy violation or Intellectual Property infringement'**
  String get mDiscussReportReason4;

  /// No description provided for @mDiscussReportReason4Des.
  ///
  /// In en, this message translates to:
  /// **'This content includes defamatory content, privacy violation, or intellectual property infringement violating platform policy.'**
  String get mDiscussReportReason4Des;

  /// No description provided for @mDiscussReportReason5.
  ///
  /// In en, this message translates to:
  /// **'Fake account or impersonation'**
  String get mDiscussReportReason5;

  /// No description provided for @mDiscussReportReason5Des.
  ///
  /// In en, this message translates to:
  /// **'Suspected fake account or impersonation.'**
  String get mDiscussReportReason5Des;

  /// No description provided for @mDiscussReportReason6.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get mDiscussReportReason6;

  /// No description provided for @mDiscussReportReason6Des.
  ///
  /// In en, this message translates to:
  /// **'Not classified into any of the above'**
  String get mDiscussReportReason6Des;

  /// No description provided for @mSettingDoYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Do you want to logout?'**
  String get mSettingDoYouWantToLogout;

  /// No description provided for @mSettingYeslogout.
  ///
  /// In en, this message translates to:
  /// **'Yes, Logout'**
  String get mSettingYeslogout;

  /// No description provided for @mSettingLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get mSettingLanguage;

  /// No description provided for @mSettingShareApplication.
  ///
  /// In en, this message translates to:
  /// **'Share Application'**
  String get mSettingShareApplication;

  /// No description provided for @mSettingGiveFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give feedback'**
  String get mSettingGiveFeedback;

  /// No description provided for @mSettingHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get mSettingHelp;

  /// No description provided for @mSettingSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get mSettingSignOut;

  /// No description provided for @mLearnNoSessionAvailable.
  ///
  /// In en, this message translates to:
  /// **'No sessions available'**
  String get mLearnNoSessionAvailable;

  /// No description provided for @mLearnRequestToEnroll.
  ///
  /// In en, this message translates to:
  /// **'Request to enroll'**
  String get mLearnRequestToEnroll;

  /// No description provided for @mStaticOutOf.
  ///
  /// In en, this message translates to:
  /// **'out of'**
  String get mStaticOutOf;

  /// No description provided for @mLearnBatchSize.
  ///
  /// In en, this message translates to:
  /// **'Batch size'**
  String get mLearnBatchSize;

  /// No description provided for @mLearnNoContentForCourse.
  ///
  /// In en, this message translates to:
  /// **'No content available for this course'**
  String get mLearnNoContentForCourse;

  /// No description provided for @mLearnNotStartedAnyCourse.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t started with any course'**
  String get mLearnNotStartedAnyCourse;

  /// No description provided for @mLearnEnrollGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Enroll for a course, to get started!'**
  String get mLearnEnrollGetStarted;

  /// No description provided for @mDiscussTrendingTags.
  ///
  /// In en, this message translates to:
  /// **'Trending tags'**
  String get mDiscussTrendingTags;

  /// No description provided for @mNetworkConnectionRequestAccepted.
  ///
  /// In en, this message translates to:
  /// **'Connection request accepted!'**
  String get mNetworkConnectionRequestAccepted;

  /// No description provided for @mCommonComing.
  ///
  /// In en, this message translates to:
  /// **'COMING'**
  String get mCommonComing;

  /// No description provided for @mCommonSoon.
  ///
  /// In en, this message translates to:
  /// **'SOON'**
  String get mCommonSoon;

  /// No description provided for @mCommonFeatureAvailableinPortal.
  ///
  /// In en, this message translates to:
  /// **'This feature is available in \n the web portal as of now'**
  String get mCommonFeatureAvailableinPortal;

  /// No description provided for @mCommonGoToWebPortal.
  ///
  /// In en, this message translates to:
  /// **'Go to web portal'**
  String get mCommonGoToWebPortal;

  /// No description provided for @mCommonShowAnswer.
  ///
  /// In en, this message translates to:
  /// **'Show answer'**
  String get mCommonShowAnswer;

  /// No description provided for @mCommonPleaseGiveYourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Please give your answer before showing the answer'**
  String get mCommonPleaseGiveYourAnswer;

  /// No description provided for @mStaticYourScore.
  ///
  /// In en, this message translates to:
  /// **'Your score'**
  String get mStaticYourScore;

  /// No description provided for @mStaticWeDontRecordScores.
  ///
  /// In en, this message translates to:
  /// **'We do not record these scores in our system. \n Retake as many times as you want'**
  String get mStaticWeDontRecordScores;

  /// No description provided for @mCommonTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get mCommonTotal;

  /// No description provided for @mCommonQuestion.
  ///
  /// In en, this message translates to:
  /// **'question'**
  String get mCommonQuestion;

  /// No description provided for @mCommonQuestions.
  ///
  /// In en, this message translates to:
  /// **'questions'**
  String get mCommonQuestions;

  /// No description provided for @mCommonGoodWork.
  ///
  /// In en, this message translates to:
  /// **'Good work!'**
  String get mCommonGoodWork;

  /// No description provided for @mCommonYourScore.
  ///
  /// In en, this message translates to:
  /// **'Your score is'**
  String get mCommonYourScore;

  /// No description provided for @mCommonQuestionsAnswered.
  ///
  /// In en, this message translates to:
  /// **'Questions answered'**
  String get mCommonQuestionsAnswered;

  /// No description provided for @mCommonQuestionsNotAnswered.
  ///
  /// In en, this message translates to:
  /// **'Questions not answered'**
  String get mCommonQuestionsNotAnswered;

  /// No description provided for @mCommonTimeSpent.
  ///
  /// In en, this message translates to:
  /// **'Time spent'**
  String get mCommonTimeSpent;

  /// No description provided for @mCommonNoTakeMeBack.
  ///
  /// In en, this message translates to:
  /// **'No, take me back'**
  String get mCommonNoTakeMeBack;

  /// No description provided for @mCommonLearners.
  ///
  /// In en, this message translates to:
  /// **'learners'**
  String get mCommonLearners;

  /// No description provided for @mCommonInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get mCommonInsights;

  /// No description provided for @mCommonRetakeAssessment.
  ///
  /// In en, this message translates to:
  /// **'Retake assessment'**
  String get mCommonRetakeAssessment;

  /// No description provided for @mEventsTodaysevents.
  ///
  /// In en, this message translates to:
  /// **'No events'**
  String get mEventsTodaysevents;

  /// No description provided for @mCompetenciesExploreallAssociatedCBPs.
  ///
  /// In en, this message translates to:
  /// **'Explore all associated CBPs'**
  String get mCompetenciesExploreallAssociatedCBPs;

  /// No description provided for @mCompetenciesBackToAllCompetencies.
  ///
  /// In en, this message translates to:
  /// **'Back to \'All competencies\''**
  String get mCompetenciesBackToAllCompetencies;

  /// No description provided for @mCompetenciesContentTypeApplyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get mCompetenciesContentTypeApplyFilters;

  /// No description provided for @mCoursesAllMandatoryCourses.
  ///
  /// In en, this message translates to:
  /// **'All mandatory courses'**
  String get mCoursesAllMandatoryCourses;

  /// No description provided for @mLearnNoCourseInProgress.
  ///
  /// In en, this message translates to:
  /// **'No course in progress'**
  String get mLearnNoCourseInProgress;

  /// No description provided for @mStaticClickHere.
  ///
  /// In en, this message translates to:
  /// **'Click here'**
  String get mStaticClickHere;

  /// No description provided for @mLearnExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get mLearnExplore;

  /// No description provided for @mStaticIntroTwoDashboard2Text.
  ///
  /// In en, this message translates to:
  /// **'Registered MDO\'s'**
  String get mStaticIntroTwoDashboard2Text;

  /// No description provided for @mStaticJoinEvent.
  ///
  /// In en, this message translates to:
  /// **'Join event'**
  String get mStaticJoinEvent;

  /// No description provided for @mCommonGyannKarmayogi.
  ///
  /// In en, this message translates to:
  /// **'Gyaan Karmayogi'**
  String get mCommonGyannKarmayogi;

  /// No description provided for @mStaticlearningHistory.
  ///
  /// In en, this message translates to:
  /// **'Learning History'**
  String get mStaticlearningHistory;

  /// No description provided for @mStaticCheckPassbook.
  ///
  /// In en, this message translates to:
  /// **'Check your Passbook'**
  String get mStaticCheckPassbook;

  /// No description provided for @mStaticYourEnrollmentIsNotApproved.
  ///
  /// In en, this message translates to:
  /// **'Your enrollment for this batch is not approved, Kindly withdraw your request'**
  String get mStaticYourEnrollmentIsNotApproved;

  /// No description provided for @mcourseRegisterOrSignin.
  ///
  /// In en, this message translates to:
  /// **'If you are a government official, register or sign in so you can track your learning progress and get certified.'**
  String get mcourseRegisterOrSignin;

  /// No description provided for @mcourseNavigationCourseCompletedMsg.
  ///
  /// In en, this message translates to:
  /// **'You have completed the course successfully. Please check back in some time to view your certificate of completion.'**
  String get mcourseNavigationCourseCompletedMsg;

  /// No description provided for @mCourseNavigationPleaseTakemomentTo.
  ///
  /// In en, this message translates to:
  /// **'Please take a moment to'**
  String get mCourseNavigationPleaseTakemomentTo;

  /// No description provided for @mCourseRateThisCourse.
  ///
  /// In en, this message translates to:
  /// **'rate this course'**
  String get mCourseRateThisCourse;

  /// No description provided for @mCourseCongratsForCompletingThe.
  ///
  /// In en, this message translates to:
  /// **'Congratulations for completing the '**
  String get mCourseCongratsForCompletingThe;

  /// No description provided for @mCourseAndTellUsAboutYourExperience.
  ///
  /// In en, this message translates to:
  /// **'and tell us about your experience.'**
  String get mCourseAndTellUsAboutYourExperience;

  /// No description provided for @mCourseOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get mCourseOr;

  /// No description provided for @mCoursePressPlayBtn.
  ///
  /// In en, this message translates to:
  /// **'Press the Play button to start'**
  String get mCoursePressPlayBtn;

  /// No description provided for @mCourseTapOnAssessment.
  ///
  /// In en, this message translates to:
  /// **'Tap on assessment to start'**
  String get mCourseTapOnAssessment;

  /// No description provided for @mCourseNoContentsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No contents available'**
  String get mCourseNoContentsAvailable;

  /// No description provided for @mCourseTapOnSurveyToSTart.
  ///
  /// In en, this message translates to:
  /// **'Tap on the survey to start'**
  String get mCourseTapOnSurveyToSTart;

  /// No description provided for @mEditProfessionalDetailsInReview.
  ///
  /// In en, this message translates to:
  /// **'In review'**
  String get mEditProfessionalDetailsInReview;

  /// No description provided for @mErrorSavingProfile.
  ///
  /// In en, this message translates to:
  /// **'Error in saving profile details'**
  String get mErrorSavingProfile;

  /// No description provided for @mCertificateDownloadCompleted.
  ///
  /// In en, this message translates to:
  /// **'File downloading completed.'**
  String get mCertificateDownloadCompleted;

  /// No description provided for @mCourseCertificateCompletion.
  ///
  /// In en, this message translates to:
  /// **' Certificate of completion'**
  String get mCourseCertificateCompletion;

  /// No description provided for @mCompetencyAssociatedCertificate.
  ///
  /// In en, this message translates to:
  /// **'Associated certificates'**
  String get mCompetencyAssociatedCertificate;

  /// No description provided for @mCompetencySubTheme.
  ///
  /// In en, this message translates to:
  /// **'Competency sub-theme'**
  String get mCompetencySubTheme;

  /// No description provided for @mDiscussionQuestion.
  ///
  /// In en, this message translates to:
  /// **'Question ?'**
  String get mDiscussionQuestion;

  /// No description provided for @mVisualizationTotalViews.
  ///
  /// In en, this message translates to:
  /// **'Total views'**
  String get mVisualizationTotalViews;

  /// No description provided for @mStaticUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get mStaticUsername;

  /// No description provided for @mDashboardYourProfileViewed.
  ///
  /// In en, this message translates to:
  /// **'Your profile was viewed 24 times last week'**
  String get mDashboardYourProfileViewed;

  /// No description provided for @mDashboardUniqueVisitorNumber.
  ///
  /// In en, this message translates to:
  /// **'Number of unique visitors to your profile'**
  String get mDashboardUniqueVisitorNumber;

  /// No description provided for @mDashboardProfileViews.
  ///
  /// In en, this message translates to:
  /// **'Profile views'**
  String get mDashboardProfileViews;

  /// No description provided for @mDashboardPlatformUsage.
  ///
  /// In en, this message translates to:
  /// **'Platform usage'**
  String get mDashboardPlatformUsage;

  /// No description provided for @mDashboardUsageDays.
  ///
  /// In en, this message translates to:
  /// **'Usage over last 30 days'**
  String get mDashboardUsageDays;

  /// No description provided for @mDashboardUsageHours.
  ///
  /// In en, this message translates to:
  /// **'Usage in hours'**
  String get mDashboardUsageHours;

  /// No description provided for @mTopicsNoTopicsOfInterest.
  ///
  /// In en, this message translates to:
  /// **'Not finding a topic of your interest?'**
  String get mTopicsNoTopicsOfInterest;

  /// No description provided for @mTopicsAddTopic.
  ///
  /// In en, this message translates to:
  /// **'Add topic'**
  String get mTopicsAddTopic;

  /// No description provided for @mTopicsUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Updated successfully'**
  String get mTopicsUpdatedSuccessfully;

  /// No description provided for @mCustomDrawerViewprofile.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get mCustomDrawerViewprofile;

  /// No description provided for @mCustomDrawerRateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate us'**
  String get mCustomDrawerRateUs;

  /// No description provided for @mRolesDoYouWantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete this role and associated activities?'**
  String get mRolesDoYouWantToDelete;

  /// No description provided for @mRolesPleaseListRoles.
  ///
  /// In en, this message translates to:
  /// **'Please list down your roles & activities as part of your position'**
  String get mRolesPleaseListRoles;

  /// No description provided for @mRolesAddRole.
  ///
  /// In en, this message translates to:
  /// **'Add a role'**
  String get mRolesAddRole;

  /// No description provided for @mRolesWhatIsRole.
  ///
  /// In en, this message translates to:
  /// **'What is a role?'**
  String get mRolesWhatIsRole;

  /// No description provided for @mRoleIsMandatory.
  ///
  /// In en, this message translates to:
  /// **'Role is mandatory'**
  String get mRoleIsMandatory;

  /// No description provided for @mRoleAlreadyExist.
  ///
  /// In en, this message translates to:
  /// **'Role already exist'**
  String get mRoleAlreadyExist;

  /// No description provided for @mRolesTypeRoleName.
  ///
  /// In en, this message translates to:
  /// **'Type the role name'**
  String get mRolesTypeRoleName;

  /// No description provided for @mRolesAddActivities.
  ///
  /// In en, this message translates to:
  /// **'Add activities'**
  String get mRolesAddActivities;

  /// No description provided for @mRolesWhatIsActivity.
  ///
  /// In en, this message translates to:
  /// **'What is activity?'**
  String get mRolesWhatIsActivity;

  /// No description provided for @mRolesActivityAlreadyExist.
  ///
  /// In en, this message translates to:
  /// **'Activity already exist'**
  String get mRolesActivityAlreadyExist;

  /// No description provided for @mRolesPleaseAddValidActivityName.
  ///
  /// In en, this message translates to:
  /// **'Please add a valid activity name'**
  String get mRolesPleaseAddValidActivityName;

  /// No description provided for @mRolesActivityIsMandatory.
  ///
  /// In en, this message translates to:
  /// **'Activity is mandatory'**
  String get mRolesActivityIsMandatory;

  /// No description provided for @mRolesTypeActivity.
  ///
  /// In en, this message translates to:
  /// **'Type the activity and press Add'**
  String get mRolesTypeActivity;

  /// No description provided for @mRoleStartAddingActivities.
  ///
  /// In en, this message translates to:
  /// **'Start adding activities'**
  String get mRoleStartAddingActivities;

  /// No description provided for @mRolesPleaseAddRole.
  ///
  /// In en, this message translates to:
  /// **'Please add a role'**
  String get mRolesPleaseAddRole;

  /// No description provided for @mRolesSelectionsAutomaticallySaved.
  ///
  /// In en, this message translates to:
  /// **'Your selections are automatically saved.'**
  String get mRolesSelectionsAutomaticallySaved;

  /// No description provided for @mCourseYouCanUpdateRating.
  ///
  /// In en, this message translates to:
  /// **'You can update your rating at anytime.'**
  String get mCourseYouCanUpdateRating;

  /// No description provided for @mMatchCaseHoldANdDragItems.
  ///
  /// In en, this message translates to:
  /// **'Hold and drag items on right side to reorder'**
  String get mMatchCaseHoldANdDragItems;

  /// No description provided for @mMatchCaseLongPressOnItems.
  ///
  /// In en, this message translates to:
  /// **'Long press on the items on the right side to show the correct answer'**
  String get mMatchCaseLongPressOnItems;

  /// No description provided for @mWelcomeLetsTakeYouThrough.
  ///
  /// In en, this message translates to:
  /// **'\'\'Let us take you through a quick guided onboarding to understand your interests at work. Knowing you better helps us give you a more personalized experience on the platform. This way you discover relevant and useful learning content in the easiest way possible. And don’t worry, you can always update your interests later!\'\''**
  String get mWelcomeLetsTakeYouThrough;

  /// No description provided for @mWelcomeLetsGo.
  ///
  /// In en, this message translates to:
  /// **'Let’s go'**
  String get mWelcomeLetsGo;

  /// No description provided for @mBrowseLearnExploreAllCBP.
  ///
  /// In en, this message translates to:
  /// **'Explore all CBP\'s within the \'Learn hub\' '**
  String get mBrowseLearnExploreAllCBP;

  /// No description provided for @mTopicBackToAllTopics.
  ///
  /// In en, this message translates to:
  /// **'Back to \'All topics\''**
  String get mTopicBackToAllTopics;

  /// No description provided for @mTopicTop.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get mTopicTop;

  /// No description provided for @mTopicPicksForYou.
  ///
  /// In en, this message translates to:
  /// **'picks for you'**
  String get mTopicPicksForYou;

  /// No description provided for @mTopicExploreUnder.
  ///
  /// In en, this message translates to:
  /// **'Explore topics under'**
  String get mTopicExploreUnder;

  /// No description provided for @mStaticQuestion.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get mStaticQuestion;

  /// No description provided for @mStaticQuestions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get mStaticQuestions;

  /// No description provided for @mStaticOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get mStaticOf;

  /// No description provided for @mNewAssessmentTimeLimit.
  ///
  /// In en, this message translates to:
  /// **'Your time limit has exceeded'**
  String get mNewAssessmentTimeLimit;

  /// No description provided for @mNewAssessmentNextSection.
  ///
  /// In en, this message translates to:
  /// **'Next section'**
  String get mNewAssessmentNextSection;

  /// No description provided for @mCourseAssessmentExceeded.
  ///
  /// In en, this message translates to:
  /// **'Your attempts are exceeded'**
  String get mCourseAssessmentExceeded;

  /// No description provided for @mCertificateNotIssuedBy.
  ///
  /// In en, this message translates to:
  /// **'The certificate is not issued by the trusted certificate authority. Once issued you will be able to download it'**
  String get mCertificateNotIssuedBy;

  /// No description provided for @mStaticOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get mStaticOverdue;

  /// No description provided for @mCoursesBackToProviders.
  ///
  /// In en, this message translates to:
  /// **'Back to \'All providers\''**
  String get mCoursesBackToProviders;

  /// No description provided for @mCoursesBackToCollections.
  ///
  /// In en, this message translates to:
  /// **'Back to \'All collections\''**
  String get mCoursesBackToCollections;

  /// No description provided for @mStaticBackToExploreBy.
  ///
  /// In en, this message translates to:
  /// **'Back to \'Explore by\''**
  String get mStaticBackToExploreBy;

  /// No description provided for @mStaticLoadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get mStaticLoadMore;

  /// No description provided for @mStaticExploreAllProviders.
  ///
  /// In en, this message translates to:
  /// **'Explore all providers within the learn hub'**
  String get mStaticExploreAllProviders;

  /// No description provided for @mStaticNoProvidersFound.
  ///
  /// In en, this message translates to:
  /// **'No providers found!'**
  String get mStaticNoProvidersFound;

  /// No description provided for @mStaticNoCuratedCollections.
  ///
  /// In en, this message translates to:
  /// **'No curated collections found!'**
  String get mStaticNoCuratedCollections;

  /// No description provided for @mStaticPopularProviders.
  ///
  /// In en, this message translates to:
  /// **'Popular providers'**
  String get mStaticPopularProviders;

  /// No description provided for @mStaticAllProviders.
  ///
  /// In en, this message translates to:
  /// **'All providers'**
  String get mStaticAllProviders;

  /// No description provided for @mStaticUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get mStaticUpcoming;

  /// No description provided for @mStaticDueDateWithin30DaysMessage.
  ///
  /// In en, this message translates to:
  /// **'You will see all the content for which the due date is within 30 days.'**
  String get mStaticDueDateWithin30DaysMessage;

  /// No description provided for @mStaticSeeContentForWhichDueDatePassed.
  ///
  /// In en, this message translates to:
  /// **'You will see all the content for which the due date has passed here.'**
  String get mStaticSeeContentForWhichDueDatePassed;

  /// No description provided for @mStaticSeeCompletedContent.
  ///
  /// In en, this message translates to:
  /// **'You will see all the content that are completed.'**
  String get mStaticSeeCompletedContent;

  /// No description provided for @mStaticSeeAllUpcoming.
  ///
  /// In en, this message translates to:
  /// **'You will see all the content which are due for completion here.'**
  String get mStaticSeeAllUpcoming;

  /// No description provided for @mStaticFilterResults.
  ///
  /// In en, this message translates to:
  /// **'Filter results'**
  String get mStaticFilterResults;

  /// No description provided for @mStaticClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get mStaticClearAll;

  /// No description provided for @mStaticCompetencyPassbookTabBehavioural.
  ///
  /// In en, this message translates to:
  /// **'Behavioural'**
  String get mStaticCompetencyPassbookTabBehavioural;

  /// No description provided for @mStaticCompetencyPassbookTabFunctional.
  ///
  /// In en, this message translates to:
  /// **'Functional'**
  String get mStaticCompetencyPassbookTabFunctional;

  /// No description provided for @mStaticCompetencyPassbookTabDomain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get mStaticCompetencyPassbookTabDomain;

  /// No description provided for @mStaticCompetencyNotFound.
  ///
  /// In en, this message translates to:
  /// **'No competency found'**
  String get mStaticCompetencyNotFound;

  /// No description provided for @mStaticGoBackToWelcome.
  ///
  /// In en, this message translates to:
  /// **'Go back to Welcome'**
  String get mStaticGoBackToWelcome;

  /// No description provided for @mStaticWhatAreCompetencies.
  ///
  /// In en, this message translates to:
  /// **'What are competencies?'**
  String get mStaticWhatAreCompetencies;

  /// No description provided for @mStaticSelectLevel.
  ///
  /// In en, this message translates to:
  /// **'Select level'**
  String get mStaticSelectLevel;

  /// No description provided for @mStaticCbpPlanDeadline.
  ///
  /// In en, this message translates to:
  /// **'CBP plan deadline'**
  String get mStaticCbpPlanDeadline;

  /// No description provided for @mStaticClaim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get mStaticClaim;

  /// No description provided for @mCourseRatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Congrats! You\'ve rated the course and earned'**
  String get mCourseRatedMessage;

  /// No description provided for @mStaticEarn.
  ///
  /// In en, this message translates to:
  /// **'Earn'**
  String get mStaticEarn;

  /// No description provided for @mStaticMoreKarmaPoints.
  ///
  /// In en, this message translates to:
  /// **'more Karma Points'**
  String get mStaticMoreKarmaPoints;

  /// No description provided for @mCourseRatingInfo.
  ///
  /// In en, this message translates to:
  /// **'Your {course} rating serves as a valuable recommendation to Karmayogis, so go ahead and RATE.'**
  String mCourseRatingInfo(Object course, Object rating);

  /// No description provided for @mStaticCourseCompletion.
  ///
  /// In en, this message translates to:
  /// **'Course completion'**
  String get mStaticCourseCompletion;

  /// No description provided for @mStaticFirstEnrolment.
  ///
  /// In en, this message translates to:
  /// **'First enrolment'**
  String get mStaticFirstEnrolment;

  /// No description provided for @mStaticFirstLogin.
  ///
  /// In en, this message translates to:
  /// **'First login'**
  String get mStaticFirstLogin;

  /// No description provided for @mCourseRating.
  ///
  /// In en, this message translates to:
  /// **'Course Rating'**
  String get mCourseRating;

  /// No description provided for @mStaticBonus.
  ///
  /// In en, this message translates to:
  /// **'Bonus'**
  String get mStaticBonus;

  /// No description provided for @mStaticCompletingCourse.
  ///
  /// In en, this message translates to:
  /// **'by completing this course'**
  String get mStaticCompletingCourse;

  /// No description provided for @mStaticAcbpCourseCompletionInfo.
  ///
  /// In en, this message translates to:
  /// **'Additionally, passing all final assessments will earn you an extra 5 Karma Points. Remember, it\'s essential to stick to the schedule outlined in your Capacity Building Plan, as it directly impacts your Karma Points. For further details, please refer to the FAQs'**
  String get mStaticAcbpCourseCompletionInfo;

  /// No description provided for @mStaticCourseCompletionInfo.
  ///
  /// In en, this message translates to:
  /// **'Every course completion automatically gets you 5 Karma Points.'**
  String get mStaticCourseCompletionInfo;

  /// No description provided for @mCourseCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'for each course you complete, with a limit of four non-My iGOT courses per month.'**
  String get mCourseCompletedMessage;

  /// No description provided for @mStaticCourseCompletedInfo.
  ///
  /// In en, this message translates to:
  /// **'For every My iGOT course you complete (as per ACBP), you will earn 15 Karma Points. For every other course you complete, you will earn 5 Karma Points, up to a maximum of four courses per month. Start learning and watch your Karma grow!'**
  String get mStaticCourseCompletedInfo;

  /// No description provided for @mStaticFirstCourseEnrolment.
  ///
  /// In en, this message translates to:
  /// **'for your 1st course enrolment!'**
  String get mStaticFirstCourseEnrolment;

  /// No description provided for @mCompetencyPassbookSubtitle.
  ///
  /// In en, this message translates to:
  /// **'My Competency'**
  String get mCompetencyPassbookSubtitle;

  /// No description provided for @mCompetencyPassbookListTitle.
  ///
  /// In en, this message translates to:
  /// **'Recently associated competencies'**
  String get mCompetencyPassbookListTitle;

  /// No description provided for @mCompetencyViewMoreTxt.
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get mCompetencyViewMoreTxt;

  /// No description provided for @mCompetencyViewLessTxt.
  ///
  /// In en, this message translates to:
  /// **'View Less'**
  String get mCompetencyViewLessTxt;

  /// No description provided for @mCompetencyCertificateGeneration.
  ///
  /// In en, this message translates to:
  /// **'Kindly be patient. The certificate generation normally takes up to 24 hours, however, it might take longer sometimes. If the issue persists, please mail us at mission.karmayogi@gov.in'**
  String get mCompetencyCertificateGeneration;

  /// No description provided for @mStaticAdjustSearch.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search to find what you are looking for'**
  String get mStaticAdjustSearch;

  /// No description provided for @mStaticKarmapointAppbarInfo.
  ///
  /// In en, this message translates to:
  /// **'Karma points measure and map your engagement at iGOT. Points are updated within 4 hours'**
  String get mStaticKarmapointAppbarInfo;

  /// No description provided for @mStaticCantVoteMsg.
  ///
  /// In en, this message translates to:
  /// **'Can\'t vote on your own post.'**
  String get mStaticCantVoteMsg;

  /// No description provided for @mStaticKarmaPointInfo.
  ///
  /// In en, this message translates to:
  /// **' Karma points are a reward for high learning engagement in iGOT. For more information, visit Karma Points FAQ. '**
  String get mStaticKarmaPointInfo;

  /// No description provided for @mStaticRequiresApproval.
  ///
  /// In en, this message translates to:
  /// **'Requires Approval'**
  String get mStaticRequiresApproval;

  /// No description provided for @mStaticSentForApproval.
  ///
  /// In en, this message translates to:
  /// **'Sent for approval'**
  String get mStaticSentForApproval;

  /// No description provided for @mSurveyAssessmentTime.
  ///
  /// In en, this message translates to:
  /// **'Assessment time'**
  String get mSurveyAssessmentTime;

  /// No description provided for @mSurveyStart.
  ///
  /// In en, this message translates to:
  /// **'Start survey'**
  String get mSurveyStart;

  /// No description provided for @mStaticShareCertificate.
  ///
  /// In en, this message translates to:
  /// **'Share certificate'**
  String get mStaticShareCertificate;

  /// No description provided for @mStaticLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get mStaticLinkedIn;

  /// No description provided for @mStaticOtherApps.
  ///
  /// In en, this message translates to:
  /// **'Other apps'**
  String get mStaticOtherApps;

  /// No description provided for @mStaticEnrollmentSentForReview.
  ///
  /// In en, this message translates to:
  /// **'Your Enrollment is sent for review'**
  String get mStaticEnrollmentSentForReview;

  /// No description provided for @mStaticStar.
  ///
  /// In en, this message translates to:
  /// **'star'**
  String get mStaticStar;

  /// No description provided for @mStaticMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'minutes ago'**
  String get mStaticMinutesAgo;

  /// No description provided for @mStaticHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'hours ago'**
  String get mStaticHoursAgo;

  /// No description provided for @mStaticDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'days ago'**
  String get mStaticDaysAgo;

  /// No description provided for @mStaticMonthsAgo.
  ///
  /// In en, this message translates to:
  /// **'months ago'**
  String get mStaticMonthsAgo;

  /// No description provided for @mStaticDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get mStaticDays;

  /// No description provided for @mStaticHours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get mStaticHours;

  /// No description provided for @mStaticCertificateEarned.
  ///
  /// In en, this message translates to:
  /// **'Certificate earned'**
  String get mStaticCertificateEarned;

  /// No description provided for @mStaticOverallProgress.
  ///
  /// In en, this message translates to:
  /// **'Overall progress'**
  String get mStaticOverallProgress;

  /// No description provided for @mStaticRateNow.
  ///
  /// In en, this message translates to:
  /// **'Rate now'**
  String get mStaticRateNow;

  /// No description provided for @mStaticViewMore.
  ///
  /// In en, this message translates to:
  /// **'view more'**
  String get mStaticViewMore;

  /// No description provided for @mStaticViewLess.
  ///
  /// In en, this message translates to:
  /// **'view less'**
  String get mStaticViewLess;

  /// No description provided for @mStaticRateThisCourse.
  ///
  /// In en, this message translates to:
  /// **'rate this {course}'**
  String mStaticRateThisCourse(Object course);

  /// No description provided for @mStaticLinkNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Link not available'**
  String get mStaticLinkNotAvailable;

  /// No description provided for @mStaticcourseRatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Congrats! You\'ve rated the {course} and earned'**
  String mStaticcourseRatedMessage(Object course);

  /// No description provided for @mStaticcourseCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Congrats! You\'ve completed the {course} and earned'**
  String mStaticcourseCompletedMessage(Object course);

  /// No description provided for @mratingCourseMessage.
  ///
  /// In en, this message translates to:
  /// **'rate this content!'**
  String get mratingCourseMessage;

  /// No description provided for @mcourseRatingInfo.
  ///
  /// In en, this message translates to:
  /// **'Your {course} rating serves as a valuable recommendation to Karmayogis, so go ahead and RATE.'**
  String mcourseRatingInfo(Object course, Object rating);

  /// No description provided for @mStaticItems.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get mStaticItems;

  /// No description provided for @mCourseNoCourse.
  ///
  /// In en, this message translates to:
  /// **'No course'**
  String get mCourseNoCourse;

  /// No description provided for @mStaticNoReviewsToShow.
  ///
  /// In en, this message translates to:
  /// **'No reviews to show'**
  String get mStaticNoReviewsToShow;

  /// No description provided for @mStaticYouCompletedThisCourseOn.
  ///
  /// In en, this message translates to:
  /// **'You completed this {course} on'**
  String mStaticYouCompletedThisCourseOn(Object course);

  /// No description provided for @mStaticYouEventCertificateCompleted.
  ///
  /// In en, this message translates to:
  /// **'You completed this event on'**
  String get mStaticYouEventCertificateCompleted;

  /// No description provided for @mStaticLastEnrollDate.
  ///
  /// In en, this message translates to:
  /// **'Last enroll date'**
  String get mStaticLastEnrollDate;

  /// No description provided for @mRatingHowLikelyAreYouToRecommed.
  ///
  /// In en, this message translates to:
  /// **'How likely are you to recommend '**
  String get mRatingHowLikelyAreYouToRecommed;

  /// No description provided for @mRatingIgotToColleagues.
  ///
  /// In en, this message translates to:
  /// **'iGOT Karmayogi to your colleagues?'**
  String get mRatingIgotToColleagues;

  /// No description provided for @mRatingNotLikely.
  ///
  /// In en, this message translates to:
  /// **'Not likely'**
  String get mRatingNotLikely;

  /// No description provided for @mRatingExtremelyLikely.
  ///
  /// In en, this message translates to:
  /// **'Extremely likely'**
  String get mRatingExtremelyLikely;

  /// No description provided for @mRatingHowCanWeMakeItBetter.
  ///
  /// In en, this message translates to:
  /// **'How can we make it better for next time?'**
  String get mRatingHowCanWeMakeItBetter;

  /// No description provided for @mRatingInspireOthers.
  ///
  /// In en, this message translates to:
  /// **'Inspire others by sharing your experience'**
  String get mRatingInspireOthers;

  /// No description provided for @mRatingThanksForFeedBack.
  ///
  /// In en, this message translates to:
  /// **'Thanks for the feedback. We are committed to consistently enhancing your learning experience'**
  String get mRatingThanksForFeedBack;

  /// No description provided for @mLastUpdatedOn.
  ///
  /// In en, this message translates to:
  /// **'Last updated on'**
  String get mLastUpdatedOn;

  /// No description provided for @mIssuedOn.
  ///
  /// In en, this message translates to:
  /// **'Issued on'**
  String get mIssuedOn;

  /// No description provided for @mDesignationMandatory.
  ///
  /// In en, this message translates to:
  /// **'Designation is mandatory'**
  String get mDesignationMandatory;

  /// No description provided for @mGroupMandatory.
  ///
  /// In en, this message translates to:
  /// **'Group is mandatory'**
  String get mGroupMandatory;

  /// No description provided for @mEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get mEditProfile;

  /// No description provided for @mEditProfileOrganisationDetails.
  ///
  /// In en, this message translates to:
  /// **'Organisation details'**
  String get mEditProfileOrganisationDetails;

  /// No description provided for @mEditProfileAcademicDetails.
  ///
  /// In en, this message translates to:
  /// **'Academics details'**
  String get mEditProfileAcademicDetails;

  /// No description provided for @mEditProfileAddAnotherQualification.
  ///
  /// In en, this message translates to:
  /// **'Add another qualification'**
  String get mEditProfileAddAnotherQualification;

  /// No description provided for @mEditProfileDeleteDegree.
  ///
  /// In en, this message translates to:
  /// **'Delete degree'**
  String get mEditProfileDeleteDegree;

  /// No description provided for @mEditProfileFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get mEditProfileFullName;

  /// No description provided for @mEditProfileDob.
  ///
  /// In en, this message translates to:
  /// **'Date of birth (dd-mm-yyyy)'**
  String get mEditProfileDob;

  /// No description provided for @mEditProfileGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get mEditProfileGender;

  /// No description provided for @mEditProfileCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get mEditProfileCategory;

  /// No description provided for @mEditProfilePrimaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Primary email'**
  String get mEditProfilePrimaryEmail;

  /// No description provided for @mEditProfileGroup.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get mEditProfileGroup;

  /// No description provided for @mEditProfileDesignation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get mEditProfileDesignation;

  /// No description provided for @mEditProfilePinCode.
  ///
  /// In en, this message translates to:
  /// **'Pin code'**
  String get mEditProfilePinCode;

  /// No description provided for @mEditProfileSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get mEditProfileSave;

  /// No description provided for @mEditProfileSubmitChanges.
  ///
  /// In en, this message translates to:
  /// **'Submit changes'**
  String get mEditProfileSubmitChanges;

  /// No description provided for @mEditProfileEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get mEditProfileEdit;

  /// No description provided for @mEditProfilePleaseAddValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10 digit number'**
  String get mEditProfilePleaseAddValidNumber;

  /// No description provided for @mEditProfilePleaseVerifyYourNumber.
  ///
  /// In en, this message translates to:
  /// **'Please verify your mobile number'**
  String get mEditProfilePleaseVerifyYourNumber;

  /// No description provided for @mEditProfileSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get mEditProfileSendOtp;

  /// No description provided for @mEditProfileResendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get mEditProfileResendOtp;

  /// No description provided for @mEditProfilePleaseVerifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email'**
  String get mEditProfilePleaseVerifyYourEmail;

  /// No description provided for @mEditProfileOtherLangs.
  ///
  /// In en, this message translates to:
  /// **'Other languages known'**
  String get mEditProfileOtherLangs;

  /// No description provided for @mEditProfileAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get mEditProfileAdd;

  /// No description provided for @mEditProfileTypeHere.
  ///
  /// In en, this message translates to:
  /// **'Type here'**
  String get mEditProfileTypeHere;

  /// No description provided for @mEditProfileTelephoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Telephone number'**
  String get mEditProfileTelephoneNumber;

  /// No description provided for @mEditProfileTelephoneNumberExample.
  ///
  /// In en, this message translates to:
  /// **'Example  0123-26104183 or 012327204281'**
  String get mEditProfileTelephoneNumberExample;

  /// No description provided for @mEditProfileSecondaryEmail.
  ///
  /// In en, this message translates to:
  /// **'Secondary email'**
  String get mEditProfileSecondaryEmail;

  /// No description provided for @mEditProfilePostalAddress.
  ///
  /// In en, this message translates to:
  /// **'Postal Address'**
  String get mEditProfilePostalAddress;

  /// No description provided for @mEditProfileEnterResidenceAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your residence address here'**
  String get mEditProfileEnterResidenceAddress;

  /// No description provided for @mEditProfileNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get mEditProfileNationality;

  /// No description provided for @mEditProfileDomicileMeduium.
  ///
  /// In en, this message translates to:
  /// **'Domicile medium (Mother tongue)'**
  String get mEditProfileDomicileMeduium;

  /// No description provided for @mEditProfileMaritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Marital status'**
  String get mEditProfileMaritalStatus;

  /// No description provided for @mEditProfileTypeOfOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Type of organisation'**
  String get mEditProfileTypeOfOrganisation;

  /// No description provided for @mEditProfileOrganisationName.
  ///
  /// In en, this message translates to:
  /// **'Organisation name'**
  String get mEditProfileOrganisationName;

  /// No description provided for @mEditProfileIndustry.
  ///
  /// In en, this message translates to:
  /// **'Industry'**
  String get mEditProfileIndustry;

  /// No description provided for @mEditProfileLocation.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get mEditProfileLocation;

  /// No description provided for @mEditProfileDoj.
  ///
  /// In en, this message translates to:
  /// **'Date of joining'**
  String get mEditProfileDoj;

  /// No description provided for @mEditProfileChooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get mEditProfileChooseDate;

  /// No description provided for @mEditProfileDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get mEditProfileDescription;

  /// No description provided for @mEditProfileEnterOrgDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter your Organisation description here'**
  String get mEditProfileEnterOrgDescription;

  /// No description provided for @mEditProfileOtherDetailsOfGovtEmployees.
  ///
  /// In en, this message translates to:
  /// **'Other details for government employees(If applicable)'**
  String get mEditProfileOtherDetailsOfGovtEmployees;

  /// No description provided for @mEditProfilePayBand.
  ///
  /// In en, this message translates to:
  /// **'Pay band(grade pay)'**
  String get mEditProfilePayBand;

  /// No description provided for @mEditProfileService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get mEditProfileService;

  /// No description provided for @mEditProfileCadre.
  ///
  /// In en, this message translates to:
  /// **'Cadre'**
  String get mEditProfileCadre;

  /// No description provided for @mEditProfileAllotmentYearOfService.
  ///
  /// In en, this message translates to:
  /// **'Allotment year of service'**
  String get mEditProfileAllotmentYearOfService;

  /// No description provided for @mEditProfileCivilListNumber.
  ///
  /// In en, this message translates to:
  /// **'Civil list number'**
  String get mEditProfileCivilListNumber;

  /// No description provided for @mEditProfileEmployeeCode.
  ///
  /// In en, this message translates to:
  /// **'Employee code'**
  String get mEditProfileEmployeeCode;

  /// No description provided for @mEditProfileOfficePostalAddress.
  ///
  /// In en, this message translates to:
  /// **'Office postal address'**
  String get mEditProfileOfficePostalAddress;

  /// No description provided for @mEditProfileOfficePinCode.
  ///
  /// In en, this message translates to:
  /// **'Office pin code'**
  String get mEditProfileOfficePinCode;

  /// No description provided for @mEditProfileTagsText.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get mEditProfileTagsText;

  /// No description provided for @mEditProfileStandardTenth.
  ///
  /// In en, this message translates to:
  /// **'10th Standard'**
  String get mEditProfileStandardTenth;

  /// No description provided for @mEditProfileSchoolName.
  ///
  /// In en, this message translates to:
  /// **'School name'**
  String get mEditProfileSchoolName;

  /// No description provided for @mEditProfileYearOfPassing.
  ///
  /// In en, this message translates to:
  /// **'Year of passing'**
  String get mEditProfileYearOfPassing;

  /// No description provided for @mEditProfileStandardTwelth.
  ///
  /// In en, this message translates to:
  /// **'12th Standard'**
  String get mEditProfileStandardTwelth;

  /// No description provided for @mEditProfileGradDetails.
  ///
  /// In en, this message translates to:
  /// **'Graduation details'**
  String get mEditProfileGradDetails;

  /// No description provided for @mEditProfilePostGradDetails.
  ///
  /// In en, this message translates to:
  /// **'Post graduation details'**
  String get mEditProfilePostGradDetails;

  /// No description provided for @mEditProfileDegres.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get mEditProfileDegres;

  /// No description provided for @mEditProfileInstituteName.
  ///
  /// In en, this message translates to:
  /// **'Institute name'**
  String get mEditProfileInstituteName;

  /// No description provided for @mEditProfileEnterYourFullname.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get mEditProfileEnterYourFullname;

  /// No description provided for @mEditProfileOtpSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'An OTP has been sent to your email address (valid for 15 minutes)'**
  String get mEditProfileOtpSentToEmail;

  /// No description provided for @mEditProfileOtpSentToMobile.
  ///
  /// In en, this message translates to:
  /// **'An OTP has been sent to your mobile number (valid for 5 minutes)'**
  String get mEditProfileOtpSentToMobile;

  /// No description provided for @mEditProfileEmailVerifiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Email address verified successfully'**
  String get mEditProfileEmailVerifiedMessage;

  /// No description provided for @mEditProfileMobileVerifiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Mobile number verified successfully'**
  String get mEditProfileMobileVerifiedMessage;

  /// No description provided for @mEditProfileMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mEditProfileMobileNumber;

  /// No description provided for @mEditProfileAddValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please add a valid email address'**
  String get mEditProfileAddValidEmail;

  /// No description provided for @mEditProfileEnterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get mEditProfileEnterOtp;

  /// No description provided for @mEditProfileVerifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get mEditProfileVerifyOtp;

  /// No description provided for @mEditProfileDetailsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile details updated'**
  String get mEditProfileDetailsUpdated;

  /// No description provided for @mBlendedSelfPaced.
  ///
  /// In en, this message translates to:
  /// **'Self-paced'**
  String get mBlendedSelfPaced;

  /// No description provided for @mBlendedInstructorLed.
  ///
  /// In en, this message translates to:
  /// **'Instructor-led'**
  String get mBlendedInstructorLed;

  /// No description provided for @mContentSharePageHeading.
  ///
  /// In en, this message translates to:
  /// **'Share with Karmayogis'**
  String get mContentSharePageHeading;

  /// No description provided for @mContentSharePageNote.
  ///
  /// In en, this message translates to:
  /// **'Note: Emails will be sent only to registered Karmayogis.'**
  String get mContentSharePageNote;

  /// No description provided for @mContentSharePageEmailLimitWarning.
  ///
  /// In en, this message translates to:
  /// **'Maximum email limit reached'**
  String get mContentSharePageEmailLimitWarning;

  /// No description provided for @mContentSharePageInvalidEmailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get mContentSharePageInvalidEmailError;

  /// No description provided for @mContentSharePageSharingError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again'**
  String get mContentSharePageSharingError;

  /// No description provided for @mContentSharePageSimilarEmailWarning.
  ///
  /// In en, this message translates to:
  /// **'Already selected'**
  String get mContentSharePageSimilarEmailWarning;

  /// No description provided for @mContentSharePageEmptyEmailWarning.
  ///
  /// In en, this message translates to:
  /// **'Please add an email'**
  String get mContentSharePageEmptyEmailWarning;

  /// No description provided for @mContentSharePageSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Emails successfully shared with registered Karmayogis'**
  String get mContentSharePageSuccessMessage;

  /// No description provided for @mContentSharePageLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get mContentSharePageLinkCopied;

  /// No description provided for @mStaticEnrolledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Enrolled successfully'**
  String get mStaticEnrolledSuccessfully;

  /// No description provided for @mStaticEnrollmentFailed.
  ///
  /// In en, this message translates to:
  /// **'Enrollment failed'**
  String get mStaticEnrollmentFailed;

  /// No description provided for @mStaticCongratulationsOnCompleting.
  ///
  /// In en, this message translates to:
  /// **'Congratulations on completing'**
  String get mStaticCongratulationsOnCompleting;

  /// No description provided for @mStaticYourCertificateWillBeGeneratedWithin48Hrs.
  ///
  /// In en, this message translates to:
  /// **'Your certificate will be generated within 48hrs'**
  String get mStaticYourCertificateWillBeGeneratedWithin48Hrs;

  /// No description provided for @mStaticReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get mStaticReviews;

  /// No description provided for @mLearnTotalEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Total enrolled'**
  String get mLearnTotalEnrolled;

  /// No description provided for @mBlendedMarkAttendenceDescription.
  ///
  /// In en, this message translates to:
  /// **'After the batch starts, you will be able to mark the attendace'**
  String get mBlendedMarkAttendenceDescription;

  /// No description provided for @mFullScreenMessage.
  ///
  /// In en, this message translates to:
  /// **'This is a full-screen bottom sheet!'**
  String get mFullScreenMessage;

  /// No description provided for @mStaticSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get mStaticSend;

  /// No description provided for @mCopyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get mCopyLink;

  /// No description provided for @mShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get mShare;

  /// No description provided for @mDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get mDownload;

  /// No description provided for @mNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get mNext;

  /// No description provided for @mOpenresource.
  ///
  /// In en, this message translates to:
  /// **'Open {resource}'**
  String mOpenresource(Object resource);

  /// No description provided for @mMarkAsComplete.
  ///
  /// In en, this message translates to:
  /// **'Mark as complete'**
  String get mMarkAsComplete;

  /// No description provided for @mUpNext.
  ///
  /// In en, this message translates to:
  /// **'Up Next'**
  String get mUpNext;

  /// No description provided for @mReplay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get mReplay;

  /// No description provided for @mShareCertificate.
  ///
  /// In en, this message translates to:
  /// **'Share this certificate'**
  String get mShareCertificate;

  /// No description provided for @mLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get mLinkedIn;

  /// No description provided for @mOtherApps.
  ///
  /// In en, this message translates to:
  /// **'Other apps'**
  String get mOtherApps;

  /// No description provided for @mDoSignInOrRegisterMessage.
  ///
  /// In en, this message translates to:
  /// **'If you are a government official, register or sign in and get your certificate.'**
  String get mDoSignInOrRegisterMessage;

  /// No description provided for @mBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get mBack;

  /// No description provided for @mStartAssessment.
  ///
  /// In en, this message translates to:
  /// **'Start assessment'**
  String get mStartAssessment;

  /// No description provided for @mAssessmentAttemptsExceededMessage.
  ///
  /// In en, this message translates to:
  /// **'Your attempts are exceeded'**
  String get mAssessmentAttemptsExceededMessage;

  /// No description provided for @mStaticNotAnswered.
  ///
  /// In en, this message translates to:
  /// **'Not answered'**
  String get mStaticNotAnswered;

  /// No description provided for @mStaticAnswered.
  ///
  /// In en, this message translates to:
  /// **'Answered'**
  String get mStaticAnswered;

  /// No description provided for @mStaticSubmitAssessment.
  ///
  /// In en, this message translates to:
  /// **'Submit assessment'**
  String get mStaticSubmitAssessment;

  /// No description provided for @mRetakeAssessment.
  ///
  /// In en, this message translates to:
  /// **'Retake assessment'**
  String get mRetakeAssessment;

  /// No description provided for @mTimeLimitExceeded.
  ///
  /// In en, this message translates to:
  /// **'Your time limit has exceeded'**
  String get mTimeLimitExceeded;

  /// No description provided for @mOutOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get mOutOf;

  /// No description provided for @mShowAnswer.
  ///
  /// In en, this message translates to:
  /// **'Show answer'**
  String get mShowAnswer;

  /// No description provided for @mNextQuestion.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get mNextQuestion;

  /// No description provided for @mNextSection.
  ///
  /// In en, this message translates to:
  /// **'Next section'**
  String get mNextSection;

  /// No description provided for @mDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get mDone;

  /// No description provided for @mStaticFlagged.
  ///
  /// In en, this message translates to:
  /// **'Flagged'**
  String get mStaticFlagged;

  /// No description provided for @mPass.
  ///
  /// In en, this message translates to:
  /// **'Pass'**
  String get mPass;

  /// No description provided for @mFail.
  ///
  /// In en, this message translates to:
  /// **'Fail'**
  String get mFail;

  /// No description provided for @mStaticTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get mStaticTryAgain;

  /// No description provided for @mFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get mFinish;

  /// No description provided for @mTotalQuestion.
  ///
  /// In en, this message translates to:
  /// **'Total questions'**
  String get mTotalQuestion;

  /// No description provided for @mYourPerformanceSummary.
  ///
  /// In en, this message translates to:
  /// **'Your Performance Summary'**
  String get mYourPerformanceSummary;

  /// No description provided for @mStaticCalculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating'**
  String get mStaticCalculating;

  /// No description provided for @mAssessmentResultWaitingMessage.
  ///
  /// In en, this message translates to:
  /// **'Be patient please, while we calculate your result'**
  String get mAssessmentResultWaitingMessage;

  /// No description provided for @mShowAnswerErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please give your answer before showing the answer'**
  String get mShowAnswerErrorMessage;

  /// No description provided for @mPracticeAssessmentRetakeMessage.
  ///
  /// In en, this message translates to:
  /// **'We do not record these scores in our system. \\n Retake as many times as you want'**
  String get mPracticeAssessmentRetakeMessage;

  /// No description provided for @mAssessmentSubmit.
  ///
  /// In en, this message translates to:
  /// **'No, submit'**
  String get mAssessmentSubmit;

  /// No description provided for @mAssessmentTakeBack.
  ///
  /// In en, this message translates to:
  /// **'Yes, take me back'**
  String get mAssessmentTakeBack;

  /// No description provided for @mClickToSeeTheResults.
  ///
  /// In en, this message translates to:
  /// **'Click to see the results'**
  String get mClickToSeeTheResults;

  /// No description provided for @mGiveYourAnswerBeforeShowingAnswer.
  ///
  /// In en, this message translates to:
  /// **'Please give your answer before showing the answer'**
  String get mGiveYourAnswerBeforeShowingAnswer;

  /// No description provided for @mStartAgain.
  ///
  /// In en, this message translates to:
  /// **'Start Again'**
  String get mStartAgain;

  /// No description provided for @mEnroll.
  ///
  /// In en, this message translates to:
  /// **'Enroll'**
  String get mEnroll;

  /// No description provided for @mLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get mLeaderboard;

  /// No description provided for @mRank.
  ///
  /// In en, this message translates to:
  /// **'Rank'**
  String get mRank;

  /// No description provided for @mMyActivityLeaderboardHeading.
  ///
  /// In en, this message translates to:
  /// **'Top Karmayogis in your department:'**
  String get mMyActivityLeaderboardHeading;

  /// No description provided for @mMyActivityLeaderboardTooltipInfo.
  ///
  /// In en, this message translates to:
  /// **'The learner leaderboard is calculated based on the Karma Points earned in a month and updated on the 1st of every month.'**
  String get mMyActivityLeaderboardTooltipInfo;

  /// No description provided for @mStaticIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get mStaticIncomplete;

  /// No description provided for @mStaticSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get mStaticSelected;

  /// No description provided for @mStaticToPass.
  ///
  /// In en, this message translates to:
  /// **'To pass -'**
  String get mStaticToPass;

  /// No description provided for @mStaticTotalQuestions.
  ///
  /// In en, this message translates to:
  /// **'Total questions -'**
  String get mStaticTotalQuestions;

  /// No description provided for @mStaticFillInTheBlanks.
  ///
  /// In en, this message translates to:
  /// **'Fill in the blank with the best word'**
  String get mStaticFillInTheBlanks;

  /// No description provided for @mStaticCorrectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Correct answer: '**
  String get mStaticCorrectAnswer;

  /// No description provided for @mStaticYouGotRight.
  ///
  /// In en, this message translates to:
  /// **'You got 2/3 right'**
  String get mStaticYouGotRight;

  /// No description provided for @mStaticMorePowerToYou.
  ///
  /// In en, this message translates to:
  /// **'More power to you!'**
  String get mStaticMorePowerToYou;

  /// No description provided for @mStaticQuestionOf.
  ///
  /// In en, this message translates to:
  /// **'Question {questionIndex} of '**
  String mStaticQuestionOf(Object questionIndex);

  /// No description provided for @mSurveyFormOneStepAwayFromEnroll.
  ///
  /// In en, this message translates to:
  /// **'You are one step away from enrolling!'**
  String get mSurveyFormOneStepAwayFromEnroll;

  /// No description provided for @mThisBatchStarting.
  ///
  /// In en, this message translates to:
  /// **'This batch starting on'**
  String get mThisBatchStarting;

  /// No description provided for @mBatchStartConsent.
  ///
  /// In en, this message translates to:
  /// **'kindly go through the content and be prepared.'**
  String get mBatchStartConsent;

  /// No description provided for @mAssessmentCheckYourKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Check your knowledge'**
  String get mAssessmentCheckYourKnowledge;

  /// No description provided for @mAssessmentAssessmentResults.
  ///
  /// In en, this message translates to:
  /// **'Assessment results'**
  String get mAssessmentAssessmentResults;

  /// No description provided for @mAssessmentTakeTestAgain.
  ///
  /// In en, this message translates to:
  /// **'Take test again'**
  String get mAssessmentTakeTestAgain;

  /// No description provided for @mStaticOneCorrect.
  ///
  /// In en, this message translates to:
  /// **'question correct answered'**
  String get mStaticOneCorrect;

  /// No description provided for @mStaticOneIncorrect.
  ///
  /// In en, this message translates to:
  /// **'question wrong answered'**
  String get mStaticOneIncorrect;

  /// No description provided for @mStaticMaximum.
  ///
  /// In en, this message translates to:
  /// **'Maximum'**
  String get mStaticMaximum;

  /// No description provided for @mStaticRetakeAssesmentMessage.
  ///
  /// In en, this message translates to:
  /// **'retake(s) are allowed, and you already attempted'**
  String get mStaticRetakeAssesmentMessage;

  /// No description provided for @mStaticTime.
  ///
  /// In en, this message translates to:
  /// **'time(s)'**
  String get mStaticTime;

  /// No description provided for @mStaticUnlimitedRetakes.
  ///
  /// In en, this message translates to:
  /// **'Unlimited retakes allowed'**
  String get mStaticUnlimitedRetakes;

  /// No description provided for @mRateOnWeeklyClapCongratsText.
  ///
  /// In en, this message translates to:
  /// **'Congratulations on your weekly clap!'**
  String get mRateOnWeeklyClapCongratsText;

  /// No description provided for @mRateOnWeeklyClapCongratsDescription.
  ///
  /// In en, this message translates to:
  /// **'Enjoying the iGOT experience? Rate us!'**
  String get mRateOnWeeklyClapCongratsDescription;

  /// No description provided for @mRateOnWeeklyClapRateText.
  ///
  /// In en, this message translates to:
  /// **'Rate Now'**
  String get mRateOnWeeklyClapRateText;

  /// No description provided for @mRateOnWeeklyClapLaterText.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get mRateOnWeeklyClapLaterText;

  /// No description provided for @mEhrmsSalutation.
  ///
  /// In en, this message translates to:
  /// **'Salutation'**
  String get mEhrmsSalutation;

  /// No description provided for @mEhrmsFirstname.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get mEhrmsFirstname;

  /// No description provided for @mEhrmsMiddlename.
  ///
  /// In en, this message translates to:
  /// **'Middle Name'**
  String get mEhrmsMiddlename;

  /// No description provided for @mEhrmsLastname.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get mEhrmsLastname;

  /// No description provided for @mEhrmsDob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get mEhrmsDob;

  /// No description provided for @mEhrmsGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get mEhrmsGender;

  /// No description provided for @mEhrmsCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get mEhrmsCategory;

  /// No description provided for @mEhrmsDifferentlyAbled.
  ///
  /// In en, this message translates to:
  /// **'Differently Abled'**
  String get mEhrmsDifferentlyAbled;

  /// No description provided for @mEhrmsMaritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Marital Status'**
  String get mEhrmsMaritalStatus;

  /// No description provided for @mEhrmsEmployeeCode.
  ///
  /// In en, this message translates to:
  /// **'Employee Code'**
  String get mEhrmsEmployeeCode;

  /// No description provided for @mEhrmsService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get mEhrmsService;

  /// No description provided for @mEhrmsDesignation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get mEhrmsDesignation;

  /// No description provided for @mEhrmsMinistryDepartmentOffice.
  ///
  /// In en, this message translates to:
  /// **'Ministry/Department/Office'**
  String get mEhrmsMinistryDepartmentOffice;

  /// No description provided for @mEhrmsCurrentPlaceOfPosting.
  ///
  /// In en, this message translates to:
  /// **'Current Place of Posting'**
  String get mEhrmsCurrentPlaceOfPosting;

  /// No description provided for @mEhrmsEmailId.
  ///
  /// In en, this message translates to:
  /// **'Email Id (gov/nic)'**
  String get mEhrmsEmailId;

  /// No description provided for @mEhrmsMobileNo.
  ///
  /// In en, this message translates to:
  /// **'Mobile No.'**
  String get mEhrmsMobileNo;

  /// No description provided for @mEhrmsAddress1.
  ///
  /// In en, this message translates to:
  /// **'Address 1'**
  String get mEhrmsAddress1;

  /// No description provided for @mEhrmsAddress2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get mEhrmsAddress2;

  /// No description provided for @mEhrmsState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get mEhrmsState;

  /// No description provided for @mEhrmsDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get mEhrmsDistrict;

  /// No description provided for @mEhrmsPincode.
  ///
  /// In en, this message translates to:
  /// **'Pincode'**
  String get mEhrmsPincode;

  /// No description provided for @mEhrmsId.
  ///
  /// In en, this message translates to:
  /// **'eHRMS ID'**
  String get mEhrmsId;

  /// No description provided for @mEhrmsSystem.
  ///
  /// In en, this message translates to:
  /// **'eHRMS System'**
  String get mEhrmsSystem;

  /// No description provided for @mProfileNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Not verified'**
  String get mProfileNotVerified;

  /// No description provided for @mProfileWithdrawTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Transfer Request'**
  String get mProfileWithdrawTransferRequest;

  /// No description provided for @mProfileMakeTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'Make Transfer Request'**
  String get mProfileMakeTransferRequest;

  /// No description provided for @mProfileWithdrawTransferRequestConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to withdraw your transfer request?'**
  String get mProfileWithdrawTransferRequestConfirm;

  /// No description provided for @mProfileMessageBeforeTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'You need to withdraw the Primary Details request before making a Transfer Request'**
  String get mProfileMessageBeforeTransferRequest;

  /// No description provided for @mProfileTransferRequestInfo.
  ///
  /// In en, this message translates to:
  /// **'Press on the button to request a transfer to another MDO, but first, withdraw any pending fields awaiting approval from your current MDO'**
  String get mProfileTransferRequestInfo;

  /// No description provided for @mProfileWithdrawRequestInfo.
  ///
  /// In en, this message translates to:
  /// **'If you choose to withdraw your transfer request, your transfer request will get cancelled.'**
  String get mProfileWithdrawRequestInfo;

  /// No description provided for @mProfileWithdrawRequest.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get mProfileWithdrawRequest;

  /// No description provided for @mProfileSelectAllFieldsTransferRequest.
  ///
  /// In en, this message translates to:
  /// **'Select all the fields to make transfer request.'**
  String get mProfileSelectAllFieldsTransferRequest;

  /// No description provided for @mProfileOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get mProfileOrganisation;

  /// No description provided for @mProfileTransferRequestInstruction.
  ///
  /// In en, this message translates to:
  /// **'If you make a transfer request, your profile will be unverified again'**
  String get mProfileTransferRequestInstruction;

  /// No description provided for @mProfileSubmitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get mProfileSubmitRequest;

  /// No description provided for @mProfilePrimaryDetails.
  ///
  /// In en, this message translates to:
  /// **'Primary Details'**
  String get mProfilePrimaryDetails;

  /// No description provided for @mProfileMdoApprovalInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'These details go to your MDO Admin for approval'**
  String get mProfileMdoApprovalInfoMessage;

  /// No description provided for @mProfileMessageBeforeWithdrawPrimaryDetails.
  ///
  /// In en, this message translates to:
  /// **'You can\'t edit when you requested for Transfer request'**
  String get mProfileMessageBeforeWithdrawPrimaryDetails;

  /// No description provided for @mProfileWithdrawRequestConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to withdraw your request?'**
  String get mProfileWithdrawRequestConfirm;

  /// No description provided for @mProfileSendForApproval.
  ///
  /// In en, this message translates to:
  /// **'Send For Approval'**
  String get mProfileSendForApproval;

  /// No description provided for @mProfileOtherDetails.
  ///
  /// In en, this message translates to:
  /// **'Other Details'**
  String get mProfileOtherDetails;

  /// No description provided for @mProfileEmployeeId.
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get mProfileEmployeeId;

  /// No description provided for @mProfileOfficePincode.
  ///
  /// In en, this message translates to:
  /// **'Office Pin Code'**
  String get mProfileOfficePincode;

  /// No description provided for @mProfileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get mProfileSaveChanges;

  /// No description provided for @mProfileProvideValidDetails.
  ///
  /// In en, this message translates to:
  /// **'Please provide valid details.'**
  String get mProfileProvideValidDetails;

  /// No description provided for @mProfileEnterOtpForEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP Sent to Your Email'**
  String get mProfileEnterOtpForEmail;

  /// No description provided for @mProfileEnterOtpForMobile.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP Sent to Your Mobile Number'**
  String get mProfileEnterOtpForMobile;

  /// No description provided for @mProfileWithdrawalRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Your withdrawal request has been successfully sent'**
  String get mProfileWithdrawalRequestSent;

  /// No description provided for @mProfileNotRecievedOtp.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the OTP?'**
  String get mProfileNotRecievedOtp;

  /// No description provided for @mProfileDetailsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile details updated.'**
  String get mProfileDetailsUpdated;

  /// No description provided for @mProfileSaveProfileErrorText.
  ///
  /// In en, this message translates to:
  /// **'Error in saving profile details.'**
  String get mProfileSaveProfileErrorText;

  /// No description provided for @mProfileSentForApprovalMsg.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been sent for approval'**
  String get mProfileSentForApprovalMsg;

  /// No description provided for @mProfileSentForApproval.
  ///
  /// In en, this message translates to:
  /// **'Sent For Approval'**
  String get mProfileSentForApproval;

  /// No description provided for @mProfileUserNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Profile Not Verified'**
  String get mProfileUserNotVerified;

  /// No description provided for @mProfileRequestSentSuccessMsg.
  ///
  /// In en, this message translates to:
  /// **'Request Sent Successfully'**
  String get mProfileRequestSentSuccessMsg;

  /// No description provided for @mProfileEmployeeIdNotValidMsg.
  ///
  /// In en, this message translates to:
  /// **'Please enter your valid Employee ID'**
  String get mProfileEmployeeIdNotValidMsg;

  /// No description provided for @mProfileViewApprovalStatus.
  ///
  /// In en, this message translates to:
  /// **'View Approval Status'**
  String get mProfileViewApprovalStatus;

  /// No description provided for @mProfileApprovalStatus.
  ///
  /// In en, this message translates to:
  /// **'Approval Status'**
  String get mProfileApprovalStatus;

  /// No description provided for @mProfilePending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get mProfilePending;

  /// No description provided for @mProfileRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get mProfileRejected;

  /// No description provided for @mProfileApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get mProfileApproved;

  /// No description provided for @mProfileViewReason.
  ///
  /// In en, this message translates to:
  /// **'View reason'**
  String get mProfileViewReason;

  /// No description provided for @mProfileNoComments.
  ///
  /// In en, this message translates to:
  /// **'No comments'**
  String get mProfileNoComments;

  /// No description provided for @mProfileTransferRequestSuccessMsg.
  ///
  /// In en, this message translates to:
  /// **'Your transfer request has been sent for approval'**
  String get mProfileTransferRequestSuccessMsg;

  /// No description provided for @mProfileWithdrawTransferPopupDetailsText.
  ///
  /// In en, this message translates to:
  /// **'You requested for transfer with the following details:'**
  String get mProfileWithdrawTransferPopupDetailsText;

  /// No description provided for @mProfileWithdrawPopupDetailsText.
  ///
  /// In en, this message translates to:
  /// **'You requested for the following details:'**
  String get mProfileWithdrawPopupDetailsText;

  /// No description provided for @mProfileUnderReviewInfo.
  ///
  /// In en, this message translates to:
  /// **'This field is under review'**
  String get mProfileUnderReviewInfo;

  /// No description provided for @mPdfPlayerMarkAsComplete.
  ///
  /// In en, this message translates to:
  /// **'Mark as complete'**
  String get mPdfPlayerMarkAsComplete;

  /// No description provided for @mPdfPlayerNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get mPdfPlayerNext;

  /// No description provided for @mPdfPlayerPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get mPdfPlayerPrevious;

  /// No description provided for @mErrorSomethingIsNotRight.
  ///
  /// In en, this message translates to:
  /// **'Something is not right!'**
  String get mErrorSomethingIsNotRight;

  /// No description provided for @mErrorThereIsConnectionError.
  ///
  /// In en, this message translates to:
  /// **'There’s a connection error right now'**
  String get mErrorThereIsConnectionError;

  /// No description provided for @mErrorWeAreSorry.
  ///
  /// In en, this message translates to:
  /// **'We are sorry for the inconvenience \n    Please come back after a while.'**
  String get mErrorWeAreSorry;

  /// No description provided for @mErrorGoBack.
  ///
  /// In en, this message translates to:
  /// **'GO BACK'**
  String get mErrorGoBack;

  /// No description provided for @mErrorOops.
  ///
  /// In en, this message translates to:
  /// **'OOPS!'**
  String get mErrorOops;

  /// No description provided for @mStaticViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get mStaticViewAll;

  /// No description provided for @mSearchInAmritGyaanKosh.
  ///
  /// In en, this message translates to:
  /// **'Search in Amrit Gyaan Kosh'**
  String get mSearchInAmritGyaanKosh;

  /// No description provided for @mStaticSector.
  ///
  /// In en, this message translates to:
  /// **'Sector'**
  String get mStaticSector;

  /// No description provided for @mStaticSubSector.
  ///
  /// In en, this message translates to:
  /// **'Sub-sector'**
  String get mStaticSubSector;

  /// No description provided for @mSearchSector.
  ///
  /// In en, this message translates to:
  /// **'Search sectors'**
  String get mSearchSector;

  /// No description provided for @mSearchSubSector.
  ///
  /// In en, this message translates to:
  /// **'Search sub-sectors'**
  String get mSearchSubSector;

  /// No description provided for @mSearchCategory.
  ///
  /// In en, this message translates to:
  /// **'Search categories'**
  String get mSearchCategory;

  /// No description provided for @mRelatedResources.
  ///
  /// In en, this message translates to:
  /// **'Related resources'**
  String get mRelatedResources;

  /// No description provided for @mPublishedOn.
  ///
  /// In en, this message translates to:
  /// **'Published on'**
  String get mPublishedOn;

  /// No description provided for @mResourceType.
  ///
  /// In en, this message translates to:
  /// **'Resource type'**
  String get mResourceType;

  /// No description provided for @mStaticSectors.
  ///
  /// In en, this message translates to:
  /// **'Sectors'**
  String get mStaticSectors;

  /// No description provided for @mStaticSubSectors.
  ///
  /// In en, this message translates to:
  /// **'Sub-Sectors'**
  String get mStaticSubSectors;

  /// No description provided for @mNoResourcesFound.
  ///
  /// In en, this message translates to:
  /// **'No resources found'**
  String get mNoResourcesFound;

  /// No description provided for @mViewAllCategories.
  ///
  /// In en, this message translates to:
  /// **'View all categories'**
  String get mViewAllCategories;

  /// No description provided for @mGyaanKarmayogiDescription.
  ///
  /// In en, this message translates to:
  /// **'Knowledge repository of policy documents, case studies, best practices, and other learning resources from various stakeholders in the field of governance and public services.'**
  String get mGyaanKarmayogiDescription;

  /// No description provided for @mEnterYourText.
  ///
  /// In en, this message translates to:
  /// **'Enter your text'**
  String get mEnterYourText;

  /// No description provided for @mStaticQuestionNo.
  ///
  /// In en, this message translates to:
  /// **'Question No.'**
  String get mStaticQuestionNo;

  /// No description provided for @mStaticMarks.
  ///
  /// In en, this message translates to:
  /// **'Marks'**
  String get mStaticMarks;

  /// No description provided for @mStaticMark.
  ///
  /// In en, this message translates to:
  /// **'Mark'**
  String get mStaticMark;

  /// No description provided for @mStaticNotVisited.
  ///
  /// In en, this message translates to:
  /// **'Not Visited'**
  String get mStaticNotVisited;

  /// No description provided for @mStaticLegend.
  ///
  /// In en, this message translates to:
  /// **'Legend'**
  String get mStaticLegend;

  /// No description provided for @mStaticMarkForReviewAndNext.
  ///
  /// In en, this message translates to:
  /// **'Mark for review & next'**
  String get mStaticMarkForReviewAndNext;

  /// No description provided for @mStaticClearResponse.
  ///
  /// In en, this message translates to:
  /// **'Clear Response'**
  String get mStaticClearResponse;

  /// No description provided for @mStaticSavenNext.
  ///
  /// In en, this message translates to:
  /// **'Save & Next'**
  String get mStaticSavenNext;

  /// No description provided for @mHomeMdoUpdatedDetailsMsg.
  ///
  /// In en, this message translates to:
  /// **'MDO has updated your details.'**
  String get mHomeMdoUpdatedDetailsMsg;

  /// No description provided for @mHomeMdoRejectedRequestMsg.
  ///
  /// In en, this message translates to:
  /// **'MDO has rejected your request.'**
  String get mHomeMdoRejectedRequestMsg;

  /// No description provided for @mHomeMdoApprovedRequestMsg.
  ///
  /// In en, this message translates to:
  /// **'MDO has approved your request.'**
  String get mHomeMdoApprovedRequestMsg;

  /// No description provided for @mProfileUserNameUpdatedMsg.
  ///
  /// In en, this message translates to:
  /// **'Username updated successfully'**
  String get mProfileUserNameUpdatedMsg;

  /// No description provided for @mSurveyThanksForSubmitting.
  ///
  /// In en, this message translates to:
  /// **'Thanks for submitting the survey'**
  String get mSurveyThanksForSubmitting;

  /// No description provided for @mStaticSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get mStaticSelect;

  /// No description provided for @mStaticJanKarmayogi.
  ///
  /// In en, this message translates to:
  /// **'Jan Karmayogi'**
  String get mStaticJanKarmayogi;

  /// No description provided for @mStaticJanKarmayogiDescription.
  ///
  /// In en, this message translates to:
  /// **'To enhance the capacity of government officials at the last mile through functional, behavioral and domain competency courses, and other learning resources, to ensure efficient, transparent, and responsive services to citizens.'**
  String get mStaticJanKarmayogiDescription;

  /// No description provided for @mCommonNoCourseFound.
  ///
  /// In en, this message translates to:
  /// **'No course found'**
  String get mCommonNoCourseFound;

  /// No description provided for @mSecondsPerQuestion.
  ///
  /// In en, this message translates to:
  /// **'seconds per question'**
  String get mSecondsPerQuestion;

  /// No description provided for @mTimeRunsOut.
  ///
  /// In en, this message translates to:
  /// **'If the given time runs out, the answer will be auto-submitted'**
  String get mTimeRunsOut;

  /// No description provided for @mSkippedQuestionsAttemptedBeforeSubmiting.
  ///
  /// In en, this message translates to:
  /// **'Skipped questions can be attempted again before submitting'**
  String get mSkippedQuestionsAttemptedBeforeSubmiting;

  /// No description provided for @mNoNegativeMarking.
  ///
  /// In en, this message translates to:
  /// **'No negative marking'**
  String get mNoNegativeMarking;

  /// No description provided for @mUnansweredConsideredIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Unanswered will be considered as incorrect'**
  String get mUnansweredConsideredIncorrect;

  /// No description provided for @mScoresWillNotBeStored.
  ///
  /// In en, this message translates to:
  /// **'The scores will not be stored or shared'**
  String get mScoresWillNotBeStored;

  /// No description provided for @mStaticSaveAndSubmit.
  ///
  /// In en, this message translates to:
  /// **'Save & Submit'**
  String get mStaticSaveAndSubmit;

  /// No description provided for @mAssessmentMyOverallPerformanceSummary.
  ///
  /// In en, this message translates to:
  /// **'My Overall performance summary'**
  String get mAssessmentMyOverallPerformanceSummary;

  /// No description provided for @mAssessmentCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get mAssessmentCorrect;

  /// No description provided for @mAssessmentAttempted.
  ///
  /// In en, this message translates to:
  /// **'Attempted'**
  String get mAssessmentAttempted;

  /// No description provided for @mAssessmentAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get mAssessmentAccuracy;

  /// No description provided for @mAssessmentSubmitTest.
  ///
  /// In en, this message translates to:
  /// **'Submit Test'**
  String get mAssessmentSubmitTest;

  /// No description provided for @mAssessmentNoOfQuestions.
  ///
  /// In en, this message translates to:
  /// **'No of Questions'**
  String get mAssessmentNoOfQuestions;

  /// No description provided for @mAssessmentMarkedForReview.
  ///
  /// In en, this message translates to:
  /// **'Marked for Review'**
  String get mAssessmentMarkedForReview;

  /// No description provided for @mAssessmentSection.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get mAssessmentSection;

  /// No description provided for @mAssessmentSubmitTheTest.
  ///
  /// In en, this message translates to:
  /// **'Submit the test'**
  String get mAssessmentSubmitTheTest;

  /// No description provided for @mAssessmentTimeTaken.
  ///
  /// In en, this message translates to:
  /// **'Time Taken'**
  String get mAssessmentTimeTaken;

  /// No description provided for @mAssessmentCollapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get mAssessmentCollapse;

  /// No description provided for @mAssessmentMySectionWiseSummary.
  ///
  /// In en, this message translates to:
  /// **'My Section wise summary'**
  String get mAssessmentMySectionWiseSummary;

  /// No description provided for @mAssessmentCompetitiveAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Competitive Analysis'**
  String get mAssessmentCompetitiveAnalysis;

  /// No description provided for @mAssessmentScore.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get mAssessmentScore;

  /// No description provided for @mAssessmentReattemptTest.
  ///
  /// In en, this message translates to:
  /// **'Reattempt Test'**
  String get mAssessmentReattemptTest;

  /// No description provided for @mAssessmentInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get mAssessmentInsights;

  /// No description provided for @mAssessmentTopperScore.
  ///
  /// In en, this message translates to:
  /// **'Topper Score'**
  String get mAssessmentTopperScore;

  /// No description provided for @mAssessmentWrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong'**
  String get mAssessmentWrong;

  /// No description provided for @mAssessmentUnattempted.
  ///
  /// In en, this message translates to:
  /// **'Unattempted'**
  String get mAssessmentUnattempted;

  /// No description provided for @mAssessmentStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get mAssessmentStatus;

  /// No description provided for @mAssessmentQuestionTagging.
  ///
  /// In en, this message translates to:
  /// **'Question Tagging'**
  String get mAssessmentQuestionTagging;

  /// No description provided for @mStaticContent.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get mStaticContent;

  /// No description provided for @mStaticContents.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get mStaticContents;

  /// No description provided for @mStaticExploreByAllProviders.
  ///
  /// In en, this message translates to:
  /// **'Explore By All Providers'**
  String get mStaticExploreByAllProviders;

  /// No description provided for @mStaticSearchProviders.
  ///
  /// In en, this message translates to:
  /// **'Search Providers'**
  String get mStaticSearchProviders;

  /// No description provided for @mStaticAllContents.
  ///
  /// In en, this message translates to:
  /// **'All Contents'**
  String get mStaticAllContents;

  /// No description provided for @mMicroSiteForTheContent.
  ///
  /// In en, this message translates to:
  /// **'For The Content'**
  String get mMicroSiteForTheContent;

  /// No description provided for @mStaticViewAllContents.
  ///
  /// In en, this message translates to:
  /// **'View All Contents'**
  String get mStaticViewAllContents;

  /// No description provided for @mStaticViewFullCalender.
  ///
  /// In en, this message translates to:
  /// **'View Full Calendar'**
  String get mStaticViewFullCalender;

  /// No description provided for @mStaticNoTraining.
  ///
  /// In en, this message translates to:
  /// **'No trainings.'**
  String get mStaticNoTraining;

  /// No description provided for @mMicroSiteMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get mMicroSiteMonth;

  /// No description provided for @mMicroSiteTrainingCalendar.
  ///
  /// In en, this message translates to:
  /// **'Training calendar'**
  String get mMicroSiteTrainingCalendar;

  /// No description provided for @mMicroSiteNoMonthFound.
  ///
  /// In en, this message translates to:
  /// **'No month found'**
  String get mMicroSiteNoMonthFound;

  /// No description provided for @mMicroSiteFeaturedProviders.
  ///
  /// In en, this message translates to:
  /// **'Featured Providers'**
  String get mMicroSiteFeaturedProviders;

  /// No description provided for @mCommonNoContentsFound.
  ///
  /// In en, this message translates to:
  /// **'No contents found'**
  String get mCommonNoContentsFound;

  /// No description provided for @mCommonAllContentType.
  ///
  /// In en, this message translates to:
  /// **'All Content Type'**
  String get mCommonAllContentType;

  /// No description provided for @mHomeToSeeChanges.
  ///
  /// In en, this message translates to:
  /// **' to see the changes.'**
  String get mHomeToSeeChanges;

  /// No description provided for @mCompatibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Compatibility Warning!'**
  String get mCompatibilityTitle;

  /// No description provided for @mCompatibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Oops! It seems like this resource isn\'t compatible with the current version of the app. Please update your app to access this resource, or check back later if the update isn\'t available right now.'**
  String get mCompatibilityDescription;

  /// No description provided for @mStaticUpdateApp.
  ///
  /// In en, this message translates to:
  /// **'Update app'**
  String get mStaticUpdateApp;

  /// No description provided for @mTipsForLearners.
  ///
  /// In en, this message translates to:
  /// **'Tips for Learners'**
  String get mTipsForLearners;

  /// No description provided for @mDisableTipsText.
  ///
  /// In en, this message translates to:
  /// **'Tips for Learners will be hidden. If you want to access visit profile.'**
  String get mDisableTipsText;

  /// No description provided for @mStaticHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get mStaticHide;

  /// No description provided for @mStaticMins.
  ///
  /// In en, this message translates to:
  /// **'mins'**
  String get mStaticMins;

  /// No description provided for @mMySpace.
  ///
  /// In en, this message translates to:
  /// **'My Space'**
  String get mMySpace;

  /// No description provided for @mScheduledAssesment.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Assessment'**
  String get mScheduledAssesment;

  /// No description provided for @mRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently Added'**
  String get mRecentlyAdded;

  /// No description provided for @mTrendingAcrossDepartment.
  ///
  /// In en, this message translates to:
  /// **'Trending Across Department'**
  String get mTrendingAcrossDepartment;

  /// No description provided for @mIgotPlans.
  ///
  /// In en, this message translates to:
  /// **'iGOT plans'**
  String get mIgotPlans;

  /// No description provided for @mAssesmentStartsIn.
  ///
  /// In en, this message translates to:
  /// **'Assessment starts in'**
  String get mAssesmentStartsIn;

  /// No description provided for @mViewProvider.
  ///
  /// In en, this message translates to:
  /// **'View Provider'**
  String get mViewProvider;

  /// No description provided for @mAssessmentInstructionAgreeStatemet.
  ///
  /// In en, this message translates to:
  /// **'I have read and understood all the instructions. I understand that using unfair means of any sort for any advantage will lead to immediate disqualification. The decision of iGOTkarmayogi.gov.in  will be final in these matters.'**
  String get mAssessmentInstructionAgreeStatemet;

  /// No description provided for @mAssessmentInstructionAgreeStatemetPrefix.
  ///
  /// In en, this message translates to:
  /// **'I have read and understood all the instructions. I understand that using unfair means of any sort for any advantage will lead to immediate disqualification. The decision of '**
  String get mAssessmentInstructionAgreeStatemetPrefix;

  /// No description provided for @mAssessmentInstructionAgreeStatemetMiddle.
  ///
  /// In en, this message translates to:
  /// **'iGOTkarmayogi.gov.in  '**
  String get mAssessmentInstructionAgreeStatemetMiddle;

  /// No description provided for @mAssessmentInstructionAgreeStatemetSuffix.
  ///
  /// In en, this message translates to:
  /// **'will be final in these matters.'**
  String get mAssessmentInstructionAgreeStatemetSuffix;

  /// No description provided for @mAssessmentSubmitWarning.
  ///
  /// In en, this message translates to:
  /// **'Do you want to submit your test finally. After submitting test, you will have to start the test from beginning.'**
  String get mAssessmentSubmitWarning;

  /// No description provided for @mAssessmentRetakeLimitExceed.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded the maximum allowed attemept'**
  String get mAssessmentRetakeLimitExceed;

  /// No description provided for @mAssessmentPleaseAttemptAndMoveNext.
  ///
  /// In en, this message translates to:
  /// **'Please attempt the current question to move on next question'**
  String get mAssessmentPleaseAttemptAndMoveNext;

  /// No description provided for @mAssessmentThankYouMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for taking the test'**
  String get mAssessmentThankYouMessage;

  /// No description provided for @mAssessmentDetailedAnalysisWillShare.
  ///
  /// In en, this message translates to:
  /// **'Your detailed analysis will be shared with you soon.'**
  String get mAssessmentDetailedAnalysisWillShare;

  /// No description provided for @mHomeKarmaPrograms.
  ///
  /// In en, this message translates to:
  /// **'Karma Programs'**
  String get mHomeKarmaPrograms;

  /// No description provided for @mLearnKarmaProgramDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore all karma programs'**
  String get mLearnKarmaProgramDescription;

  /// No description provided for @mLearnExploreAllKarmaPrograms.
  ///
  /// In en, this message translates to:
  /// **'Explore All Karma Programs'**
  String get mLearnExploreAllKarmaPrograms;

  /// No description provided for @mLearnSearchKarmaPrograms.
  ///
  /// In en, this message translates to:
  /// **'Search Karma Programs'**
  String get mLearnSearchKarmaPrograms;

  /// No description provided for @mStaticExploreByAllChannels.
  ///
  /// In en, this message translates to:
  /// **'Explore All Channels'**
  String get mStaticExploreByAllChannels;

  /// No description provided for @mStaticSearchChannels.
  ///
  /// In en, this message translates to:
  /// **'Search Channels'**
  String get mStaticSearchChannels;

  /// No description provided for @mMdoChannelKeyAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Key Announcements'**
  String get mMdoChannelKeyAnnouncements;

  /// No description provided for @mStaticChannels.
  ///
  /// In en, this message translates to:
  /// **'MDO Channels'**
  String get mStaticChannels;

  /// No description provided for @mMdoChannelCompetenciesDescription.
  ///
  /// In en, this message translates to:
  /// **'This section shows the list of top competencies users in this MDO are learning, based on the courses they\'ve completed and enrolled in.'**
  String get mMdoChannelCompetenciesDescription;

  /// No description provided for @mAssessmentResponseAddedMsg.
  ///
  /// In en, this message translates to:
  /// **'Selected section response is already submitted'**
  String get mAssessmentResponseAddedMsg;

  /// No description provided for @mAssessmentGoBackToToc.
  ///
  /// In en, this message translates to:
  /// **'Go back to TOC'**
  String get mAssessmentGoBackToToc;

  /// No description provided for @mAssessmentNotAllowedToSwitchSection.
  ///
  /// In en, this message translates to:
  /// **'You are not allowed to move to the next section until the current section is submitted.'**
  String get mAssessmentNotAllowedToSwitchSection;

  /// No description provided for @mLearnObjectives.
  ///
  /// In en, this message translates to:
  /// **'Objectives'**
  String get mLearnObjectives;

  /// No description provided for @mLearnRedirect.
  ///
  /// In en, this message translates to:
  /// **'Redirect'**
  String get mLearnRedirect;

  /// No description provided for @mExploreDiscoverMentors.
  ///
  /// In en, this message translates to:
  /// **'Discover Mentors'**
  String get mExploreDiscoverMentors;

  /// No description provided for @mExploreDiscoverMentorsDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect with mentors who will guide your learning journey'**
  String get mExploreDiscoverMentorsDescription;

  /// No description provided for @mKarmayogiSurvey.
  ///
  /// In en, this message translates to:
  /// **'Karmayogi Survey'**
  String get mKarmayogiSurvey;

  /// No description provided for @mProfileMentor.
  ///
  /// In en, this message translates to:
  /// **'Mentor'**
  String get mProfileMentor;

  /// No description provided for @mLearnMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get mLearnMarketplace;

  /// No description provided for @mStaticEnrolledSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Successfully enrolled in the course.'**
  String get mStaticEnrolledSuccessMessage;

  /// No description provided for @mStaticPartners.
  ///
  /// In en, this message translates to:
  /// **'Partners'**
  String get mStaticPartners;

  /// No description provided for @mStaticTrainingInstitutions.
  ///
  /// In en, this message translates to:
  /// **'Training Institutions'**
  String get mStaticTrainingInstitutions;

  /// No description provided for @mExternalCourseMessage.
  ///
  /// In en, this message translates to:
  /// **'Progress and certificates for {course} course are visible only after you complete the course and pass the assessment'**
  String mExternalCourseMessage(Object course);

  /// No description provided for @mStaticNoContent.
  ///
  /// In en, this message translates to:
  /// **'Content will be available soon.'**
  String get mStaticNoContent;

  /// No description provided for @mStaticAtiNoFutureCourses.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no featured courses available. Please check back later for updates on our upcoming courses.'**
  String get mStaticAtiNoFutureCourses;

  /// No description provided for @mStaticAtiNoFuturePrograms.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no featured programs available. Please check back later for updates on our upcoming programs.'**
  String get mStaticAtiNoFuturePrograms;

  /// No description provided for @mStaticAtiNoFutureAssessments.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no featured assessments available. Please check back later for updates on our upcoming assessments'**
  String get mStaticAtiNoFutureAssessments;

  /// No description provided for @mStaticNoTopCourses.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no top courses available. Please check back later for updates on our upcoming courses.'**
  String get mStaticNoTopCourses;

  /// No description provided for @mStaticNoTopPrograms.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no top programs available. Please check back later for updates on our upcoming programs.'**
  String get mStaticNoTopPrograms;

  /// No description provided for @mStaticNoTopAssessments.
  ///
  /// In en, this message translates to:
  /// **'Currently, there are no top assessments available. Please check back later for updates on our upcoming assessments.'**
  String get mStaticNoTopAssessments;

  /// No description provided for @mStaticAlreadyEntered.
  ///
  /// In en, this message translates to:
  /// **'You already entered that'**
  String get mStaticAlreadyEntered;

  /// No description provided for @mStaticNoCbpData.
  ///
  /// In en, this message translates to:
  /// **'No capacity building plans yet.'**
  String get mStaticNoCbpData;

  /// No description provided for @mDearKarmayogi.
  ///
  /// In en, this message translates to:
  /// **'Dear Karmayogi,'**
  String get mDearKarmayogi;

  /// No description provided for @mBackSoon.
  ///
  /// In en, this message translates to:
  /// **'We\'ll Be Back Soon!'**
  String get mBackSoon;

  /// No description provided for @mMaintenanceMessage.
  ///
  /// In en, this message translates to:
  /// **'Our website is currently undergoing scheduled maintenance to bring you a better experience, to enhance your learning journey at iGOT Karmayogi.'**
  String get mMaintenanceMessage;

  /// No description provided for @mAppreciateYourPatience.
  ///
  /// In en, this message translates to:
  /// **'We appreciate your patience.'**
  String get mAppreciateYourPatience;

  /// No description provided for @mStayConnectedMessage.
  ///
  /// In en, this message translates to:
  /// **'In the meantime, stay connected with us on:'**
  String get mStayConnectedMessage;

  /// No description provided for @mJoinConferenceMessage.
  ///
  /// In en, this message translates to:
  /// **'For any queries\nplease join our conference call'**
  String get mJoinConferenceMessage;

  /// No description provided for @mCallNow.
  ///
  /// In en, this message translates to:
  /// **'Call Now'**
  String get mCallNow;

  /// No description provided for @mEmailUs.
  ///
  /// In en, this message translates to:
  /// **'Email us at'**
  String get mEmailUs;

  /// No description provided for @mStaticNoTrainingInstitutionsFound.
  ///
  /// In en, this message translates to:
  /// **'No training institutions found!'**
  String get mStaticNoTrainingInstitutionsFound;

  /// No description provided for @mStaticClickToSeeVideo.
  ///
  /// In en, this message translates to:
  /// **'Click Here to see Video'**
  String get mStaticClickToSeeVideo;

  /// No description provided for @mStaticClickToSeeAudio.
  ///
  /// In en, this message translates to:
  /// **'Click Here to see Audio'**
  String get mStaticClickToSeeAudio;

  /// No description provided for @mLearnYouAreNotInvited.
  ///
  /// In en, this message translates to:
  /// **'You are not invited for this Program.'**
  String get mLearnYouAreNotInvited;

  /// No description provided for @mAssesmentEndsIn.
  ///
  /// In en, this message translates to:
  /// **'Assessment ends on'**
  String get mAssesmentEndsIn;

  /// No description provided for @mStaticIsCadreEmployee.
  ///
  /// In en, this message translates to:
  /// **'Are you a Cadre Employee?'**
  String get mStaticIsCadreEmployee;

  /// No description provided for @mStaticTypeOfCivilService.
  ///
  /// In en, this message translates to:
  /// **'Type of Civil Service'**
  String get mStaticTypeOfCivilService;

  /// No description provided for @mStaticBatch.
  ///
  /// In en, this message translates to:
  /// **'Batch'**
  String get mStaticBatch;

  /// No description provided for @mProfileCadreControllingAuthority.
  ///
  /// In en, this message translates to:
  /// **'Cadre Controlling Authority'**
  String get mProfileCadreControllingAuthority;

  /// No description provided for @mStaticRequestForService.
  ///
  /// In en, this message translates to:
  /// **'Request for service'**
  String get mStaticRequestForService;

  /// No description provided for @mStaticRequestToAddService.
  ///
  /// In en, this message translates to:
  /// **'Request to add Service'**
  String get mStaticRequestToAddService;

  /// No description provided for @mProfileServiceMandatory.
  ///
  /// In en, this message translates to:
  /// **'Service is mandatory'**
  String get mProfileServiceMandatory;

  /// No description provided for @mAssessmentReportCard.
  ///
  /// In en, this message translates to:
  /// **'Report Card'**
  String get mAssessmentReportCard;

  /// No description provided for @mProfileProvideValidCadreDetails.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all mandatory cadre information to update your profile.'**
  String get mProfileProvideValidCadreDetails;

  /// No description provided for @mAssessmentQuestionsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Questions not found'**
  String get mAssessmentQuestionsNotFound;

  /// No description provided for @mFontSettings.
  ///
  /// In en, this message translates to:
  /// **'Font Settings'**
  String get mFontSettings;

  /// No description provided for @mHomeSubDiscussPopularDiscuss.
  ///
  /// In en, this message translates to:
  /// **'Popular discussions'**
  String get mHomeSubDiscussPopularDiscuss;

  /// No description provided for @mStaticComment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get mStaticComment;

  /// No description provided for @mNotMyUserTimeAlertMsg.
  ///
  /// In en, this message translates to:
  /// **'You are no longer recognized as a user by your current organization, and access to the platform will end in 48 hours. If you believe this is incorrect, contact your MDO or make a \"Transfer Request\" to select your proper organization.'**
  String get mNotMyUserTimeAlertMsg;

  /// No description provided for @mNotMyUserAlertMsg.
  ///
  /// In en, this message translates to:
  /// **'Your access has been revoked because your organization no longer identifies you as a user. To regain access, please submit a \"Transfer Request\" and choose the correct organization.'**
  String get mNotMyUserAlertMsg;

  /// No description provided for @mAssessmentParagraphQustionDescription.
  ///
  /// In en, this message translates to:
  /// **'Read the paragraph and answer the question below'**
  String get mAssessmentParagraphQustionDescription;

  /// No description provided for @mMotherTongueIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Mother tongue is required'**
  String get mMotherTongueIsRequired;

  /// No description provided for @mSearchMinistry.
  ///
  /// In en, this message translates to:
  /// **'Search Ministry'**
  String get mSearchMinistry;

  /// No description provided for @mChooseByOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Choose by organisation'**
  String get mChooseByOrganisation;

  /// No description provided for @mNationalLearningWeek.
  ///
  /// In en, this message translates to:
  /// **'National Learning Week'**
  String get mNationalLearningWeek;

  /// No description provided for @mEventsTabKarmayogiSaptah.
  ///
  /// In en, this message translates to:
  /// **'Karmayogi Saptah'**
  String get mEventsTabKarmayogiSaptah;

  /// No description provided for @mEventsTabKarmayogiTalks.
  ///
  /// In en, this message translates to:
  /// **'Karmayogi Talks'**
  String get mEventsTabKarmayogiTalks;

  /// No description provided for @mEventEnrollKarmaPoints.
  ///
  /// In en, this message translates to:
  /// **'Earn 10 Karma Points'**
  String get mEventEnrollKarmaPoints;

  /// No description provided for @mEventEnrollEarnedKarmaPoints.
  ///
  /// In en, this message translates to:
  /// **'Congrats! You\'ve completed the event and earned 10 karma points'**
  String get mEventEnrollEarnedKarmaPoints;

  /// No description provided for @mEventEnrollKarmaPointsMessage.
  ///
  /// In en, this message translates to:
  /// **'by completing this event.'**
  String get mEventEnrollKarmaPointsMessage;

  /// No description provided for @mEventEnrollPendingCertificateMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Certificate will be generated within 1 week.'**
  String get mEventEnrollPendingCertificateMessage;

  /// No description provided for @completingCourseMessage.
  ///
  /// In en, this message translates to:
  /// **'by completing this {course}'**
  String completingCourseMessage(Object course);

  /// No description provided for @mRegisterWithQRorLink.
  ///
  /// In en, this message translates to:
  /// **'Register with QR Scan or with Link'**
  String get mRegisterWithQRorLink;

  /// No description provided for @mRegisterLinkRegistration.
  ///
  /// In en, this message translates to:
  /// **'Link Registration'**
  String get mRegisterLinkRegistration;

  /// No description provided for @mRegisterPasteYourLinkHere.
  ///
  /// In en, this message translates to:
  /// **'Paste your link here'**
  String get mRegisterPasteYourLinkHere;

  /// No description provided for @mRegisterPleaseEnterLink.
  ///
  /// In en, this message translates to:
  /// **'Please enter the link'**
  String get mRegisterPleaseEnterLink;

  /// No description provided for @mRegisterScanQR.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get mRegisterScanQR;

  /// No description provided for @mRegisterRegisterFor.
  ///
  /// In en, this message translates to:
  /// **'Register for'**
  String get mRegisterRegisterFor;

  /// No description provided for @mRegisterConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'I confirm that the above provided information is accurate & I agree to the iGOT karmayogi\'s '**
  String get mRegisterConfirmationMessage;

  /// No description provided for @mRegisterSignInHere.
  ///
  /// In en, this message translates to:
  /// **'Sign in here'**
  String get mRegisterSignInHere;

  /// No description provided for @mRegisterScanCorrectQR.
  ///
  /// In en, this message translates to:
  /// **'Please scan the correct QR code'**
  String get mRegisterScanCorrectQR;

  /// No description provided for @mRegisterIcorrectLinkFormat.
  ///
  /// In en, this message translates to:
  /// **'Incorrect URL format'**
  String get mRegisterIcorrectLinkFormat;

  /// No description provided for @mRegisterAlreadyLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'You\'re already signed In.'**
  String get mRegisterAlreadyLoggedIn;

  /// No description provided for @mStaticCommentError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your suggestion'**
  String get mStaticCommentError;

  /// No description provided for @mStaticReplyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your reply'**
  String get mStaticReplyError;

  /// No description provided for @mStaticPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get mStaticPost;

  /// No description provided for @mStaticAddAComment.
  ///
  /// In en, this message translates to:
  /// **'Add a comment'**
  String get mStaticAddAComment;

  /// No description provided for @mStaticReplyToThisComment.
  ///
  /// In en, this message translates to:
  /// **'Reply to this comment'**
  String get mStaticReplyToThisComment;

  /// No description provided for @mStaticAddAReply.
  ///
  /// In en, this message translates to:
  /// **'Add a reply'**
  String get mStaticAddAReply;

  /// No description provided for @mStaticReplyPostedText.
  ///
  /// In en, this message translates to:
  /// **'Reply successfully posted!'**
  String get mStaticReplyPostedText;

  /// No description provided for @mStaticLiked.
  ///
  /// In en, this message translates to:
  /// **'Liked'**
  String get mStaticLiked;

  /// No description provided for @mStaticLike.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get mStaticLike;

  /// No description provided for @mStaticLikes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get mStaticLikes;

  /// No description provided for @mStaticReportedMsg.
  ///
  /// In en, this message translates to:
  /// **'Reported successfully! Thank you for reporting.'**
  String get mStaticReportedMsg;

  /// No description provided for @mBlendedProgramExpired.
  ///
  /// In en, this message translates to:
  /// **' Expired'**
  String get mBlendedProgramExpired;

  /// No description provided for @mStaticEnterDetailsToEnrol.
  ///
  /// In en, this message translates to:
  /// **'Enter the details to enroll'**
  String get mStaticEnterDetailsToEnrol;

  /// No description provided for @mEventsKeySpeakersEvents.
  ///
  /// In en, this message translates to:
  /// **'Key Speakers Events'**
  String get mEventsKeySpeakersEvents;

  /// No description provided for @mScrollToTop.
  ///
  /// In en, this message translates to:
  /// **'Scroll to top'**
  String get mScrollToTop;

  /// No description provided for @mAllSectors.
  ///
  /// In en, this message translates to:
  /// **'All Sectors'**
  String get mAllSectors;

  /// No description provided for @mAllSubSectors.
  ///
  /// In en, this message translates to:
  /// **'All Sub-Sectors'**
  String get mAllSubSectors;

  /// No description provided for @mAllCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get mAllCategories;

  /// No description provided for @mEventSearchResults.
  ///
  /// In en, this message translates to:
  /// **'Event search results'**
  String get mEventSearchResults;

  /// No description provided for @mLearnNoEventInProgress.
  ///
  /// In en, this message translates to:
  /// **'No event in progress'**
  String get mLearnNoEventInProgress;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'to explore'**
  String get explore;

  /// No description provided for @mRegisterScanQRToRegister.
  ///
  /// In en, this message translates to:
  /// **'Scan QR for Registeration'**
  String get mRegisterScanQRToRegister;

  /// No description provided for @mDateOfRetirement.
  ///
  /// In en, this message translates to:
  /// **'Date of retirement'**
  String get mDateOfRetirement;

  /// No description provided for @mCompetencyTheme.
  ///
  /// In en, this message translates to:
  /// **'Competency theme'**
  String get mCompetencyTheme;

  /// No description provided for @mRegisterRecieveMessageOnWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Receive messages on WhatsApp'**
  String get mRegisterRecieveMessageOnWhatsapp;

  /// No description provided for @mStaticEnrollToComment.
  ///
  /// In en, this message translates to:
  /// **'Enrol to add your comments'**
  String get mStaticEnrollToComment;

  /// No description provided for @mStaticEnrollToReply.
  ///
  /// In en, this message translates to:
  /// **'Enrol to add your reply'**
  String get mStaticEnrollToReply;

  /// No description provided for @mStaticDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get mStaticDelete;

  /// No description provided for @mStaticFlag.
  ///
  /// In en, this message translates to:
  /// **'Flag'**
  String get mStaticFlag;

  /// No description provided for @mStaticReadLess.
  ///
  /// In en, this message translates to:
  /// **'Read less'**
  String get mStaticReadLess;

  /// No description provided for @mStaticReplyingTo.
  ///
  /// In en, this message translates to:
  /// **'Replying to'**
  String get mStaticReplyingTo;

  /// No description provided for @mStaticReporting.
  ///
  /// In en, this message translates to:
  /// **'Reporting'**
  String get mStaticReporting;

  /// No description provided for @mStaticWhatHappened.
  ///
  /// In en, this message translates to:
  /// **'What happened?'**
  String get mStaticWhatHappened;

  /// No description provided for @mStaticTellUsWhatHappened.
  ///
  /// In en, this message translates to:
  /// **'Tell us what happened?'**
  String get mStaticTellUsWhatHappened;

  /// No description provided for @mCommentReportChoices.
  ///
  /// In en, this message translates to:
  /// **'We\'ll check for all Community Guidelines, so don\'t worry about making the perfect choice.'**
  String get mCommentReportChoices;

  /// No description provided for @mCommentReportReasonLimitExceeds.
  ///
  /// In en, this message translates to:
  /// **'Comment exceeds 200-word limit, please shorten it.'**
  String get mCommentReportReasonLimitExceeds;

  /// No description provided for @mCommentDeleteAlertMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this comment?'**
  String get mCommentDeleteAlertMsg;

  /// No description provided for @mCommentDeletedText.
  ///
  /// In en, this message translates to:
  /// **'Comment deleted successfully!'**
  String get mCommentDeletedText;

  /// No description provided for @mCommentUpdatedText.
  ///
  /// In en, this message translates to:
  /// **'Comment updated successfully!'**
  String get mCommentUpdatedText;

  /// No description provided for @mCommentEdited.
  ///
  /// In en, this message translates to:
  /// **'Edited'**
  String get mCommentEdited;

  /// No description provided for @mAmritGyaanKoshTitle.
  ///
  /// In en, this message translates to:
  /// **'AGK'**
  String get mAmritGyaanKoshTitle;

  /// No description provided for @mAmritGyaanKosh.
  ///
  /// In en, this message translates to:
  /// **'Amrit Gyaan Kosh'**
  String get mAmritGyaanKosh;

  /// No description provided for @mStatesAndUts.
  ///
  /// In en, this message translates to:
  /// **'States and UTs'**
  String get mStatesAndUts;

  /// No description provided for @mSustainableDevelopmentGoals.
  ///
  /// In en, this message translates to:
  /// **'Sustainable Development Goals'**
  String get mSustainableDevelopmentGoals;

  /// No description provided for @mYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get mYear;

  /// No description provided for @mSearchSdgs.
  ///
  /// In en, this message translates to:
  /// **'Search SDGs'**
  String get mSearchSdgs;

  /// No description provided for @mSearchStates.
  ///
  /// In en, this message translates to:
  /// **'Search states and UTs'**
  String get mSearchStates;

  /// No description provided for @mDownloadAll.
  ///
  /// In en, this message translates to:
  /// **'Download all'**
  String get mDownloadAll;

  /// No description provided for @mDownloadPdf.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get mDownloadPdf;

  /// No description provided for @mViewPdf.
  ///
  /// In en, this message translates to:
  /// **'View PDF'**
  String get mViewPdf;

  /// No description provided for @mTeachersNotesDescription.
  ///
  /// In en, this message translates to:
  /// **'Essential insights and guidance to enrich and standardize your teaching experience.'**
  String get mTeachersNotesDescription;

  /// No description provided for @mAllFilesDownloadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All files downloaded successfully'**
  String get mAllFilesDownloadedSuccessfully;

  /// No description provided for @mTeachersNotes.
  ///
  /// In en, this message translates to:
  /// **'Teacher\'s Notes'**
  String get mTeachersNotes;

  /// No description provided for @mAGKCaseStudies.
  ///
  /// In en, this message translates to:
  /// **'AGK Case Studies'**
  String get mAGKCaseStudies;

  /// No description provided for @mOtherResources.
  ///
  /// In en, this message translates to:
  /// **'Other Resources'**
  String get mOtherResources;

  /// No description provided for @mAgkCaseStudyDescription.
  ///
  /// In en, this message translates to:
  /// **'The cases in this section are developed and thoroughly vetted by the Capacity Building Commission to ensure quality and relevance.'**
  String get mAgkCaseStudyDescription;

  /// No description provided for @mOtherResourcesDescription.
  ///
  /// In en, this message translates to:
  /// **'The resources in this section are developed by external institutions and have not been vetted by the Capacity Building Commission.'**
  String get mOtherResourcesDescription;

  /// No description provided for @mMySpacePeerLearning.
  ///
  /// In en, this message translates to:
  /// **'Peer Learning'**
  String get mMySpacePeerLearning;

  /// No description provided for @mMySpaceIgotAI.
  ///
  /// In en, this message translates to:
  /// **'iGOT AI'**
  String get mMySpaceIgotAI;

  /// No description provided for @mCourseAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get mCourseAvailable;

  /// No description provided for @mCourseAvailableMessage.
  ///
  /// In en, this message translates to:
  /// **'You will see all the content that are available'**
  String get mCourseAvailableMessage;

  /// No description provided for @mCourseInprogressMessage.
  ///
  /// In en, this message translates to:
  /// **'You will see all the content that are in-progress'**
  String get mCourseInprogressMessage;

  /// No description provided for @mStaticHello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get mStaticHello;

  /// No description provided for @mProfileDesignationNotVerified.
  ///
  /// In en, this message translates to:
  /// **'We found that your designation is marked as non-verified by your MDO. Please update your designation as soon as possible.'**
  String get mProfileDesignationNotVerified;

  /// No description provided for @mProfileSelectDesignation.
  ///
  /// In en, this message translates to:
  /// **'Select Designation'**
  String get mProfileSelectDesignation;

  /// No description provided for @mMoreFilters.
  ///
  /// In en, this message translates to:
  /// **'More Filters'**
  String get mMoreFilters;

  /// No description provided for @mSelfReistrationUploadFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from gallery'**
  String get mSelfReistrationUploadFromGallery;

  /// No description provided for @mSelfRegisterKnowOrganisationMessage.
  ///
  /// In en, this message translates to:
  /// **'If you know your organisation name correctly please'**
  String get mSelfRegisterKnowOrganisationMessage;

  /// No description provided for @mSelfRegisterToRegister.
  ///
  /// In en, this message translates to:
  /// **'to register'**
  String get mSelfRegisterToRegister;

  /// No description provided for @mSelfRegisterRegistrationClosed.
  ///
  /// In en, this message translates to:
  /// **'Registrations are closed'**
  String get mSelfRegisterRegistrationClosed;

  /// No description provided for @mSelfRegisterRegistrationClosedDescription.
  ///
  /// In en, this message translates to:
  /// **'Registrations are closed as of now. You may reach out to your respective nodal officer for assistance. Click on the below link to get the name and email of your respective Nodal officer.'**
  String get mSelfRegisterRegistrationClosedDescription;

  /// No description provided for @mThisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get mThisFieldIsRequired;

  /// No description provided for @mSelectAnOption.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get mSelectAnOption;

  /// No description provided for @mDoptBlendedProgramEligibilityMessage1.
  ///
  /// In en, this message translates to:
  /// **'You are not eligible for the'**
  String get mDoptBlendedProgramEligibilityMessage1;

  /// No description provided for @mDoptBlendedProgramEligibilityMessage2.
  ///
  /// In en, this message translates to:
  /// **'with the current service in your profile. If your service details are incorrect, please update your profile and apply'**
  String get mDoptBlendedProgramEligibilityMessage2;

  /// No description provided for @mDoptBlendedProgramEligibilityMessage.
  ///
  /// In en, this message translates to:
  /// **'You are not eligible for the IST Blended Program of DoPT with the current service in your profile. If your service details are incorrect, please update your profile and apply'**
  String get mDoptBlendedProgramEligibilityMessage;

  /// No description provided for @mSearchResultFor.
  ///
  /// In en, this message translates to:
  /// **'Results for '**
  String get mSearchResultFor;

  /// No description provided for @mSearchSort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get mSearchSort;

  /// No description provided for @mSearchFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get mSearchFilter;

  /// No description provided for @mSearchShowAllResults.
  ///
  /// In en, this message translates to:
  /// **'Show all results'**
  String get mSearchShowAllResults;

  /// No description provided for @mSearchCommunities.
  ///
  /// In en, this message translates to:
  /// **'Communities'**
  String get mSearchCommunities;

  /// No description provided for @mSearchRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get mSearchRecentSearches;

  /// No description provided for @mSearchSeeAllTheResults.
  ///
  /// In en, this message translates to:
  /// **'See all the results…'**
  String get mSearchSeeAllTheResults;

  /// No description provided for @mSearchInprogress.
  ///
  /// In en, this message translates to:
  /// **'In - Progress'**
  String get mSearchInprogress;

  /// No description provided for @mSearchMostRelevant.
  ///
  /// In en, this message translates to:
  /// **'Most Relevant'**
  String get mSearchMostRelevant;

  /// No description provided for @mSearchRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently Added [Newest]'**
  String get mSearchRecentlyAdded;

  /// No description provided for @mSearchHighestRated.
  ///
  /// In en, this message translates to:
  /// **'Highest Rated'**
  String get mSearchHighestRated;

  /// No description provided for @mSearchCloseFilter.
  ///
  /// In en, this message translates to:
  /// **'Close Filter'**
  String get mSearchCloseFilter;

  /// No description provided for @mSearchApplyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get mSearchApplyFilter;

  /// No description provided for @mSearchSorryMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we couldn\'t find any results for {searchText} so please Try adjusting your search.'**
  String mSearchSorryMessage(Object searchText);

  /// No description provided for @mSearchBackToHomePage.
  ///
  /// In en, this message translates to:
  /// **'Back to Homepage'**
  String get mSearchBackToHomePage;

  /// No description provided for @mSearchNinetyminAndAbove.
  ///
  /// In en, this message translates to:
  /// **'90 mins and above'**
  String get mSearchNinetyminAndAbove;

  /// No description provided for @mSearchSixtyToNinetymin.
  ///
  /// In en, this message translates to:
  /// **'60-90 mins'**
  String get mSearchSixtyToNinetymin;

  /// No description provided for @mSearchThirtyToSixtymin.
  ///
  /// In en, this message translates to:
  /// **'30 -60 Mins'**
  String get mSearchThirtyToSixtymin;

  /// No description provided for @mSearchZeroToThirtymin.
  ///
  /// In en, this message translates to:
  /// **'0-30 Mins'**
  String get mSearchZeroToThirtymin;

  /// No description provided for @mSearchRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get mSearchRating;

  /// No description provided for @mSearchFournHalfAndUp.
  ///
  /// In en, this message translates to:
  /// **'4.5 & up'**
  String get mSearchFournHalfAndUp;

  /// No description provided for @mSearchFourAndUp.
  ///
  /// In en, this message translates to:
  /// **'4.0 & up'**
  String get mSearchFourAndUp;

  /// No description provided for @mSearchThreenHalfAndUp.
  ///
  /// In en, this message translates to:
  /// **'3.5 & up'**
  String get mSearchThreenHalfAndUp;

  /// No description provided for @mSearchThreeAndUp.
  ///
  /// In en, this message translates to:
  /// **'3.0 & up'**
  String get mSearchThreeAndUp;

  /// No description provided for @mSearchLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get mSearchLanguages;

  /// No description provided for @mSearchHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get mSearchHindi;

  /// No description provided for @mSearchTamil.
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get mSearchTamil;

  /// No description provided for @mSearchTelugu.
  ///
  /// In en, this message translates to:
  /// **'Telugu'**
  String get mSearchTelugu;

  /// No description provided for @mSearchOdia.
  ///
  /// In en, this message translates to:
  /// **'Odia'**
  String get mSearchOdia;

  /// No description provided for @mSearchCategoryType.
  ///
  /// In en, this message translates to:
  /// **'Category Type'**
  String get mSearchCategoryType;

  /// No description provided for @mSearchInviteOnlyProgram.
  ///
  /// In en, this message translates to:
  /// **'Invite only Program'**
  String get mSearchInviteOnlyProgram;

  /// No description provided for @mSearchModeratedProgram.
  ///
  /// In en, this message translates to:
  /// **'Moderated Program'**
  String get mSearchModeratedProgram;

  /// No description provided for @mSearchTypeOfEvent.
  ///
  /// In en, this message translates to:
  /// **'Type of Events'**
  String get mSearchTypeOfEvent;

  /// No description provided for @mSearchLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get mSearchLive;

  /// No description provided for @mSearchPastEvents.
  ///
  /// In en, this message translates to:
  /// **'Past Events'**
  String get mSearchPastEvents;

  /// No description provided for @mSearchHumanCapitalAndSkillDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Human Capital And Skill Development'**
  String get mSearchHumanCapitalAndSkillDevelopment;

  /// No description provided for @mSearchScienceTechnologyAndInnovations.
  ///
  /// In en, this message translates to:
  /// **'Science, Technology, And Innovation'**
  String get mSearchScienceTechnologyAndInnovations;

  /// No description provided for @mSearchAgricultureAndNaturalResource.
  ///
  /// In en, this message translates to:
  /// **'Agriculture And Natural Resources'**
  String get mSearchAgricultureAndNaturalResource;

  /// No description provided for @mSearchGovernanceAndPublicAdministration.
  ///
  /// In en, this message translates to:
  /// **'Governance And Public Administration'**
  String get mSearchGovernanceAndPublicAdministration;

  /// No description provided for @mSearchInfrastructureAndTransportation.
  ///
  /// In en, this message translates to:
  /// **'Infrastructure And Transportation'**
  String get mSearchInfrastructureAndTransportation;

  /// No description provided for @mSearchEconomicDevelopmentAndIndustry.
  ///
  /// In en, this message translates to:
  /// **'Economic Development And Industry'**
  String get mSearchEconomicDevelopmentAndIndustry;

  /// No description provided for @mSearchCultureMediaAndCommunication.
  ///
  /// In en, this message translates to:
  /// **'Culture, Media, And Communication'**
  String get mSearchCultureMediaAndCommunication;

  /// No description provided for @mSearchSocialDevelopmentAndWelfare.
  ///
  /// In en, this message translates to:
  /// **'Social Development And Welfare'**
  String get mSearchSocialDevelopmentAndWelfare;

  /// No description provided for @mSearchModeratedCourse.
  ///
  /// In en, this message translates to:
  /// **'Moderated Course'**
  String get mSearchModeratedCourse;

  /// No description provided for @mSearchExternalCourse.
  ///
  /// In en, this message translates to:
  /// **'External Course'**
  String get mSearchExternalCourse;

  /// No description provided for @mSearchInviteOnlyAssessment.
  ///
  /// In en, this message translates to:
  /// **'Invite-Only Assessment'**
  String get mSearchInviteOnlyAssessment;

  /// No description provided for @mSearchModeratedAssessment.
  ///
  /// In en, this message translates to:
  /// **'Moderated Assessment'**
  String get mSearchModeratedAssessment;

  /// No description provided for @mNonEligibleServiceMessageForDoptBlendedProgram.
  ///
  /// In en, this message translates to:
  /// **'This program has eligibility criteria. Please update your service details in your profile before requesting to enroll.'**
  String get mNonEligibleServiceMessageForDoptBlendedProgram;

  /// No description provided for @mAreYouFromOrganizedService.
  ///
  /// In en, this message translates to:
  /// **'Are you from any organized service of the government?'**
  String get mAreYouFromOrganizedService;

  /// No description provided for @mNoteForDoptBlendedProgramGroup.
  ///
  /// In en, this message translates to:
  /// **'Note: The group value you provide is only for this enrollment and won\'t affect your profile. To change them in your profile, go to the profile section'**
  String get mNoteForDoptBlendedProgramGroup;

  /// No description provided for @mNoteForDoptBlendedProgramDesignation.
  ///
  /// In en, this message translates to:
  /// **'Note: The designation value you provide is only for this enrollment and won\'t affect your profile. To change them in your profile, go to the profile section'**
  String get mNoteForDoptBlendedProgramDesignation;

  /// No description provided for @mPresentMinistryDepartmentStateUT.
  ///
  /// In en, this message translates to:
  /// **'Present Ministry/Department/State/UT'**
  String get mPresentMinistryDepartmentStateUT;

  /// No description provided for @mProfileNotApprovedDomain.
  ///
  /// In en, this message translates to:
  /// **'Not an approved domain'**
  String get mProfileNotApprovedDomain;

  /// No description provided for @mLearnBatchNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Batch not started'**
  String get mLearnBatchNotStarted;

  /// No description provided for @mReferenceNotes.
  ///
  /// In en, this message translates to:
  /// **'Reference Notes'**
  String get mReferenceNotes;

  /// No description provided for @mStaticNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get mStaticNeedHelp;

  /// No description provided for @mStaticCompetencyDrivenCapacityBuilding.
  ///
  /// In en, this message translates to:
  /// **'COMPETENCY-DRIVEN CAPACITY BUILDING OF OFFICIALS'**
  String get mStaticCompetencyDrivenCapacityBuilding;

  /// No description provided for @mStaticVisionToMission.
  ///
  /// In en, this message translates to:
  /// **'FROM VISION TO MISSION MODE FOR A NAYA BHARAT'**
  String get mStaticVisionToMission;

  /// No description provided for @mStaticTransGovtOfficails.
  ///
  /// In en, this message translates to:
  /// **'TRANSFORMING GOVERNMENT OFFICIALS, TRANSFORMING INDIA'**
  String get mStaticTransGovtOfficails;

  /// No description provided for @mStaticRuleBasedToRoleBasedGovernance.
  ///
  /// In en, this message translates to:
  /// **'\'RULE-BASED\' TO \'ROLE-BASED\' GOVERNANCE'**
  String get mStaticRuleBasedToRoleBasedGovernance;

  /// No description provided for @mStaticTransformingAndEmpoweringOfficials.
  ///
  /// In en, this message translates to:
  /// **'TRANSFORMING & EMPOWERING CIVIL SERVANTS'**
  String get mStaticTransformingAndEmpoweringOfficials;

  /// No description provided for @mStaticKarmachariToKarmayogi.
  ///
  /// In en, this message translates to:
  /// **'\'KARMACHARI\' TO A \'KARMAYOGI\''**
  String get mStaticKarmachariToKarmayogi;

  /// No description provided for @mDiscussionCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get mDiscussionCommunity;

  /// No description provided for @mDiscussionCommunities.
  ///
  /// In en, this message translates to:
  /// **'Communities'**
  String get mDiscussionCommunities;

  /// No description provided for @mDiscussionDescriptionHintText.
  ///
  /// In en, this message translates to:
  /// **'What you want to say?'**
  String get mDiscussionDescriptionHintText;

  /// No description provided for @mDiscussionUpvote.
  ///
  /// In en, this message translates to:
  /// **'Upvote'**
  String get mDiscussionUpvote;

  /// No description provided for @mDiscussionDeletedText.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully!'**
  String get mDiscussionDeletedText;

  /// No description provided for @mDiscussionCreatePost.
  ///
  /// In en, this message translates to:
  /// **'Create a post'**
  String get mDiscussionCreatePost;

  /// No description provided for @mDiscussionPopularCommunities.
  ///
  /// In en, this message translates to:
  /// **'Popular Communities'**
  String get mDiscussionPopularCommunities;

  /// No description provided for @mDiscussionMember.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get mDiscussionMember;

  /// No description provided for @mDiscussionMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get mDiscussionMembers;

  /// No description provided for @mDiscussionPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get mDiscussionPost;

  /// No description provided for @mDiscussionPosts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get mDiscussionPosts;

  /// No description provided for @mDiscussionDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get mDiscussionDiscover;

  /// No description provided for @mDiscussionMyCommunities.
  ///
  /// In en, this message translates to:
  /// **'My Communities'**
  String get mDiscussionMyCommunities;

  /// No description provided for @mDiscussionAllCommunities.
  ///
  /// In en, this message translates to:
  /// **'All Communities'**
  String get mDiscussionAllCommunities;

  /// No description provided for @mDiscussionAboutTheCommunity.
  ///
  /// In en, this message translates to:
  /// **'About the community'**
  String get mDiscussionAboutTheCommunity;

  /// No description provided for @mDiscussionFeeds.
  ///
  /// In en, this message translates to:
  /// **'Feeds'**
  String get mDiscussionFeeds;

  /// No description provided for @mDiscussionFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get mDiscussionFeed;

  /// No description provided for @mDiscussionPinned.
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get mDiscussionPinned;

  /// No description provided for @mDiscussionLinks.
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get mDiscussionLinks;

  /// No description provided for @mDiscussionDocs.
  ///
  /// In en, this message translates to:
  /// **'Docs'**
  String get mDiscussionDocs;

  /// No description provided for @mDiscussionYourPost.
  ///
  /// In en, this message translates to:
  /// **'Your Post'**
  String get mDiscussionYourPost;

  /// No description provided for @mDiscussionBookmarked.
  ///
  /// In en, this message translates to:
  /// **'Bookmarked'**
  String get mDiscussionBookmarked;

  /// No description provided for @mDiscussionSearchCommunities.
  ///
  /// In en, this message translates to:
  /// **'Search Communities'**
  String get mDiscussionSearchCommunities;

  /// No description provided for @mDiscussionPinnedBy.
  ///
  /// In en, this message translates to:
  /// **'Pinned by'**
  String get mDiscussionPinnedBy;

  /// No description provided for @mDiscussionCommunityJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get mDiscussionCommunityJoin;

  /// No description provided for @mDiscussionCommunityJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get mDiscussionCommunityJoined;

  /// No description provided for @mDiscussionCommunityLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get mDiscussionCommunityLeave;

  /// No description provided for @mDiscussionCommunityJoinedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You’ve successfully joined the community.'**
  String get mDiscussionCommunityJoinedSuccessfully;

  /// No description provided for @mDiscussionCommunityLeftSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You\'ve successfully left the community'**
  String get mDiscussionCommunityLeftSuccessfully;

  /// No description provided for @mDiscussionNoCommunityFound.
  ///
  /// In en, this message translates to:
  /// **'No community found!'**
  String get mDiscussionNoCommunityFound;

  /// No description provided for @mDiscussionNoCommunityComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon!'**
  String get mDiscussionNoCommunityComingSoon;

  /// No description provided for @mDiscussionNoJoinedCommunityFound.
  ///
  /// In en, this message translates to:
  /// **'Join a community to get started!'**
  String get mDiscussionNoJoinedCommunityFound;

  /// No description provided for @mDiscussionNoCommunityTopicsFound.
  ///
  /// In en, this message translates to:
  /// **'No Topics found'**
  String get mDiscussionNoCommunityTopicsFound;

  /// No description provided for @mDiscussionUpdatesOnYourPosts.
  ///
  /// In en, this message translates to:
  /// **'Updates On Your Posts'**
  String get mDiscussionUpdatesOnYourPosts;

  /// No description provided for @mDiscussionCommentOnYourPost.
  ///
  /// In en, this message translates to:
  /// **'comment on your post'**
  String get mDiscussionCommentOnYourPost;

  /// No description provided for @mDiscussionCommunityGuidelines.
  ///
  /// In en, this message translates to:
  /// **'Community Guidelines'**
  String get mDiscussionCommunityGuidelines;

  /// No description provided for @mDiscussionDefaultCommunityGuidelines.
  ///
  /// In en, this message translates to:
  /// **'Communicate respectfully; no hate speech, harassment, or personal attacks. \nMaintain a positive and constructive tone. \nStay on topic, avoid misinformation, and share only verified information with proper credit. \nRefrain from excessive self-promotion, advertisements, or irrelevant content unless approved by moderators. \nDo not share personal or sensitive information, respect intellectual property, and follow platform policies. \nReport violations, engage thoughtfully, and foster a collaborative, solution-oriented environment.'**
  String get mDiscussionDefaultCommunityGuidelines;

  /// No description provided for @mDiscussionSelectCommunity.
  ///
  /// In en, this message translates to:
  /// **'Select Community'**
  String get mDiscussionSelectCommunity;

  /// No description provided for @mDiscussionYourCommunities.
  ///
  /// In en, this message translates to:
  /// **'All Your Communities'**
  String get mDiscussionYourCommunities;

  /// No description provided for @mDiscussionViewCommunity.
  ///
  /// In en, this message translates to:
  /// **'View Community'**
  String get mDiscussionViewCommunity;

  /// No description provided for @mDiscussionPleaseSelectCommunity.
  ///
  /// In en, this message translates to:
  /// **'Please Select Community'**
  String get mDiscussionPleaseSelectCommunity;

  /// No description provided for @mDiscussionPostingIn.
  ///
  /// In en, this message translates to:
  /// **'Posting in'**
  String get mDiscussionPostingIn;

  /// No description provided for @mDiscussionSelectCommunityHelperText.
  ///
  /// In en, this message translates to:
  /// **'Select a community where your post will be visible. Only communities you have joined will appear in the dropdown.'**
  String get mDiscussionSelectCommunityHelperText;

  /// No description provided for @mDiscussionCommunityAgree.
  ///
  /// In en, this message translates to:
  /// **'Agree & Continue'**
  String get mDiscussionCommunityAgree;

  /// No description provided for @mDiscussionCommunityAgreeToFollowing.
  ///
  /// In en, this message translates to:
  /// **'Agree to the following:'**
  String get mDiscussionCommunityAgreeToFollowing;

  /// No description provided for @mDiscussionCommunityStats.
  ///
  /// In en, this message translates to:
  /// **'Community Stats'**
  String get mDiscussionCommunityStats;

  /// No description provided for @mDiscussionWantToSeeMore.
  ///
  /// In en, this message translates to:
  /// **'Want to see the more?'**
  String get mDiscussionWantToSeeMore;

  /// No description provided for @mDiscussionClosedCommunityMsg.
  ///
  /// In en, this message translates to:
  /// **'This is a closed community, if you want to see the content of the community please request to join the community'**
  String get mDiscussionClosedCommunityMsg;

  /// No description provided for @mDiscussionPostMinLengthText.
  ///
  /// In en, this message translates to:
  /// **'Post should contain at least 3 characters.'**
  String get mDiscussionPostMinLengthText;

  /// No description provided for @mDiscussionPostMaxLengthText.
  ///
  /// In en, this message translates to:
  /// **'Post should contain at most 3000 characters.'**
  String get mDiscussionPostMaxLengthText;

  /// No description provided for @mDiscussionAllTopics.
  ///
  /// In en, this message translates to:
  /// **'All Topics'**
  String get mDiscussionAllTopics;

  /// No description provided for @mDiscussionSearchTopic.
  ///
  /// In en, this message translates to:
  /// **'Search Topic'**
  String get mDiscussionSearchTopic;

  /// No description provided for @mDiscussionLeaveCommunityAlert.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave this community?'**
  String get mDiscussionLeaveCommunityAlert;

  /// No description provided for @mDiscussionPostUploadError.
  ///
  /// In en, this message translates to:
  /// **'Error to upload media file:'**
  String get mDiscussionPostUploadError;

  /// No description provided for @mDiscussionUploadingMedia.
  ///
  /// In en, this message translates to:
  /// **'Post created. Uploading media files...'**
  String get mDiscussionUploadingMedia;

  /// No description provided for @mDiscussionDeletePostAlertMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this post?'**
  String get mDiscussionDeletePostAlertMsg;

  /// No description provided for @mDiscussionDeleteReplyAlertMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this reply?'**
  String get mDiscussionDeleteReplyAlertMsg;

  /// No description provided for @mDiscussionPostBookmarked.
  ///
  /// In en, this message translates to:
  /// **'Post bookmarked successfully!'**
  String get mDiscussionPostBookmarked;

  /// No description provided for @mDiscussionPostUnBookmarked.
  ///
  /// In en, this message translates to:
  /// **'Post un-bookmarked successfully!'**
  String get mDiscussionPostUnBookmarked;

  /// No description provided for @mDiscussionPostErrorToUploadFile.
  ///
  /// In en, this message translates to:
  /// **'Error upload file. Please try again with a different one.'**
  String get mDiscussionPostErrorToUploadFile;

  /// No description provided for @mDiscussionPostAddLink.
  ///
  /// In en, this message translates to:
  /// **'Add a link'**
  String get mDiscussionPostAddLink;

  /// No description provided for @mDiscussionPostEnterLink.
  ///
  /// In en, this message translates to:
  /// **'Enter link'**
  String get mDiscussionPostEnterLink;

  /// No description provided for @mDiscussionPostEnterValidLink.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid link'**
  String get mDiscussionPostEnterValidLink;

  /// No description provided for @mDiscussionNoCommunityMemberFound.
  ///
  /// In en, this message translates to:
  /// **'No member found!'**
  String get mDiscussionNoCommunityMemberFound;

  /// No description provided for @mDiscussionNoCommunityPostFound.
  ///
  /// In en, this message translates to:
  /// **'No data found!'**
  String get mDiscussionNoCommunityPostFound;

  /// No description provided for @mDiscussionNoGlobalFeedFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing Here… Yet!'**
  String get mDiscussionNoGlobalFeedFoundTitle;

  /// No description provided for @mDiscussionNoGlobalFeedFound.
  ///
  /// In en, this message translates to:
  /// **'Join a community to start exploring discussions, share your thoughts, and engage with like-minded learners. Visit the \"All Communities\" section to find and join communities.'**
  String get mDiscussionNoGlobalFeedFound;

  /// No description provided for @mDiscussionJoinCommunityToPost.
  ///
  /// In en, this message translates to:
  /// **'Join the community to start posting'**
  String get mDiscussionJoinCommunityToPost;

  /// No description provided for @mDiscussionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Have a thought to share? Join with your community! Share your ideas, ask for advice, or discuss topics that matter to you.'**
  String get mDiscussionSubtitle;

  /// No description provided for @mDiscussionMediaSizeError.
  ///
  /// In en, this message translates to:
  /// **'Media is too large, must be under {size}MB'**
  String mDiscussionMediaSizeError(Object size);

  /// No description provided for @mDiscussionFileSizeError.
  ///
  /// In en, this message translates to:
  /// **'File is too large, must be under {size}MB'**
  String mDiscussionFileSizeError(Object size);

  /// No description provided for @mDiscussionReported.
  ///
  /// In en, this message translates to:
  /// **'Thanks for reporting!'**
  String get mDiscussionReported;

  /// No description provided for @mDiscussionReportedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your report is under review. We will take action if it goes against our guidelines.'**
  String get mDiscussionReportedMessage;

  /// No description provided for @mDiscussionShowPost.
  ///
  /// In en, this message translates to:
  /// **'Show post'**
  String get mDiscussionShowPost;

  /// No description provided for @mDiscussionPostModerationInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'This content is being moderated and may be removed if it violates community guidelines.'**
  String get mDiscussionPostModerationInfoMessage;

  /// No description provided for @mCommonRelevant.
  ///
  /// In en, this message translates to:
  /// **'Relevant'**
  String get mCommonRelevant;

  /// No description provided for @mIgotAIGeneratedRecommendation.
  ///
  /// In en, this message translates to:
  /// **'These are AI generated recommendations'**
  String get mIgotAIGeneratedRecommendation;

  /// No description provided for @mIgotAICuratingSuitableLearningCourse.
  ///
  /// In en, this message translates to:
  /// **'Curating the most suitable learning course recommendations tailored just for you'**
  String get mIgotAICuratingSuitableLearningCourse;

  /// No description provided for @mIgotAIExploreMessage.
  ///
  /// In en, this message translates to:
  /// **'Dear Karmayogi ! Explore your personalized course recommendations and share your feedback to enhance your learning experience.'**
  String get mIgotAIExploreMessage;

  /// No description provided for @mIgotAIThanksForFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your feedback.'**
  String get mIgotAIThanksForFeedback;

  /// No description provided for @mIgotAILetUsKnowWhatToLearnToday.
  ///
  /// In en, this message translates to:
  /// **'Let us know what do you want to learn today!'**
  String get mIgotAILetUsKnowWhatToLearnToday;

  /// No description provided for @mIgotAIAddInterest.
  ///
  /// In en, this message translates to:
  /// **'Add Interest'**
  String get mIgotAIAddInterest;

  /// No description provided for @mIgotAISelectSkillToLearn.
  ///
  /// In en, this message translates to:
  /// **'Select skills which you want to learn'**
  String get mIgotAISelectSkillToLearn;

  /// No description provided for @mIgotAIBasedOnChoiceRecommendBestSuitable.
  ///
  /// In en, this message translates to:
  /// **'Based on you choice, We will recommend best suitable content for you'**
  String get mIgotAIBasedOnChoiceRecommendBestSuitable;

  /// No description provided for @mIgotAIFeedbackIsImportant.
  ///
  /// In en, this message translates to:
  /// **'Your feedback is very important to serve you better.'**
  String get mIgotAIFeedbackIsImportant;

  /// No description provided for @mIgotAIEnterFeedback.
  ///
  /// In en, this message translates to:
  /// **'Enter your feedback...'**
  String get mIgotAIEnterFeedback;

  /// No description provided for @mIgotAIIsThisRelevantCourse.
  ///
  /// In en, this message translates to:
  /// **'Is this a relevant course?'**
  String get mIgotAIIsThisRelevantCourse;

  /// No description provided for @mIgotAIPleaseShareFeedback.
  ///
  /// In en, this message translates to:
  /// **'Please share your feedback to help us refine the AI driven recommendation model.'**
  String get mIgotAIPleaseShareFeedback;

  /// No description provided for @mIgotAIDrivenRecommendation.
  ///
  /// In en, this message translates to:
  /// **'AI Driven recommendation for you'**
  String get mIgotAIDrivenRecommendation;

  /// No description provided for @mRajyaKarmayogiSaptah.
  ///
  /// In en, this message translates to:
  /// **'Rajya Karmayogi Saptah'**
  String get mRajyaKarmayogiSaptah;

  /// No description provided for @mSearchNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get mSearchNew;

  /// No description provided for @mSearchSearchForAnything.
  ///
  /// In en, this message translates to:
  /// **'Search for Anything'**
  String get mSearchSearchForAnything;

  /// No description provided for @mContentLocked.
  ///
  /// In en, this message translates to:
  /// **'The content is locked. Complete program or all courses to view this module'**
  String get mContentLocked;

  /// No description provided for @mStaticToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get mStaticToday;

  /// No description provided for @mStaticPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get mStaticPast;

  /// No description provided for @mTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get mTomorrow;

  /// No description provided for @mSpeakers.
  ///
  /// In en, this message translates to:
  /// **'Speakers'**
  String get mSpeakers;

  /// No description provided for @mEventInformation.
  ///
  /// In en, this message translates to:
  /// **'Event Information'**
  String get mEventInformation;

  /// No description provided for @mlive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get mlive;

  /// No description provided for @mDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get mDocuments;

  /// No description provided for @mCompetencyOverview.
  ///
  /// In en, this message translates to:
  /// **'Competency overview'**
  String get mCompetencyOverview;

  /// No description provided for @mMyEvents.
  ///
  /// In en, this message translates to:
  /// **'My events'**
  String get mMyEvents;

  /// No description provided for @mBrowseEvents.
  ///
  /// In en, this message translates to:
  /// **'Browse events'**
  String get mBrowseEvents;

  /// No description provided for @mEventSchedule.
  ///
  /// In en, this message translates to:
  /// **'Events schedule'**
  String get mEventSchedule;

  /// No description provided for @mEventStatus.
  ///
  /// In en, this message translates to:
  /// **'Event status'**
  String get mEventStatus;

  /// No description provided for @mEventDateTime.
  ///
  /// In en, this message translates to:
  /// **'Event date & time'**
  String get mEventDateTime;

  /// No description provided for @mChooseDateRange.
  ///
  /// In en, this message translates to:
  /// **'Choose date range'**
  String get mChooseDateRange;

  /// No description provided for @mFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get mFrom;

  /// No description provided for @mTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get mTo;

  /// No description provided for @mSearchEvent.
  ///
  /// In en, this message translates to:
  /// **'Search event'**
  String get mSearchEvent;

  /// No description provided for @mEventEngagement.
  ///
  /// In en, this message translates to:
  /// **'Event engagement'**
  String get mEventEngagement;

  /// No description provided for @mEventsAttended.
  ///
  /// In en, this message translates to:
  /// **'Events attended'**
  String get mEventsAttended;

  /// No description provided for @mEventsEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Events enrolled'**
  String get mEventsEnrolled;

  /// No description provided for @mHoursWatched.
  ///
  /// In en, this message translates to:
  /// **'Hours watched'**
  String get mHoursWatched;

  /// No description provided for @mNoEventsFound.
  ///
  /// In en, this message translates to:
  /// **'No events found'**
  String get mNoEventsFound;

  /// No description provided for @mCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get mCopy;

  /// No description provided for @mMsgSeeLess.
  ///
  /// In en, this message translates to:
  /// **'See Less'**
  String get mMsgSeeLess;

  /// No description provided for @mStaticNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get mStaticNew;

  /// No description provided for @mStaticOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get mStaticOffline;

  /// No description provided for @mStaticOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get mStaticOnline;

  /// No description provided for @mBlendedProgramMarkAttendance.
  ///
  /// In en, this message translates to:
  /// **'After the batch starts, you will be able to mark the attendance'**
  String get mBlendedProgramMarkAttendance;

  /// No description provided for @mBlendedProgramAttendanceMarked.
  ///
  /// In en, this message translates to:
  /// **'Attendance marked @ {date}'**
  String mBlendedProgramAttendanceMarked(Object date);

  /// No description provided for @mTranscription.
  ///
  /// In en, this message translates to:
  /// **'Transcription'**
  String get mTranscription;

  /// No description provided for @migotAiTutor.
  ///
  /// In en, this message translates to:
  /// **'iGOT AI Tutor'**
  String get migotAiTutor;

  /// No description provided for @mCLickToView.
  ///
  /// In en, this message translates to:
  /// **'Click to view'**
  String get mCLickToView;

  /// No description provided for @mAiTutorWelcomeText.
  ///
  /// In en, this message translates to:
  /// **'Get instant explanations, step-by-step learning guidance, and customised learning tailored just for you.'**
  String get mAiTutorWelcomeText;

  /// No description provided for @mAiChatBotWelcomeText.
  ///
  /// In en, this message translates to:
  /// **'Get instant explanations, step-by-step learning guidance, and customised learning tailored just for you.'**
  String get mAiChatBotWelcomeText;

  /// No description provided for @mChatBotGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started with Ai Tutor'**
  String get mChatBotGetStarted;

  /// No description provided for @mAiTutor.
  ///
  /// In en, this message translates to:
  /// **'AI Tutor'**
  String get mAiTutor;

  /// No description provided for @mRememberToUseAiTutor.
  ///
  /// In en, this message translates to:
  /// **'Hey, it seems you are not enrolled. Do you want to enroll?'**
  String get mRememberToUseAiTutor;

  /// No description provided for @mEnrollNow.
  ///
  /// In en, this message translates to:
  /// **'Enroll Now'**
  String get mEnrollNow;

  /// No description provided for @mAiGeneratedMessage.
  ///
  /// In en, this message translates to:
  /// **'These are AI generated results'**
  String get mAiGeneratedMessage;

  /// No description provided for @mIgotAi.
  ///
  /// In en, this message translates to:
  /// **'iGOT AI'**
  String get mIgotAi;

  /// No description provided for @mAiIntro.
  ///
  /// In en, this message translates to:
  /// **'Your assistant for iGOT Karmayogi Platform'**
  String get mAiIntro;

  /// No description provided for @mSurveySubmitted.
  ///
  /// In en, this message translates to:
  /// **'Survey is submitted'**
  String get mSurveySubmitted;

  /// No description provided for @mCSRRegistrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get mCSRRegistrationFailed;

  /// No description provided for @mProfileEditCoverPhoto.
  ///
  /// In en, this message translates to:
  /// **'Edit Cover Photo'**
  String get mProfileEditCoverPhoto;

  /// No description provided for @mProfileChangeCoverPhoto.
  ///
  /// In en, this message translates to:
  /// **'Change Cover Photo'**
  String get mProfileChangeCoverPhoto;

  /// No description provided for @mnProfileDeleteCoverPhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete Cover Photo'**
  String get mnProfileDeleteCoverPhoto;

  /// No description provided for @mProfileViewMyMentorProfile.
  ///
  /// In en, this message translates to:
  /// **'View My Mentor Profile'**
  String get mProfileViewMyMentorProfile;

  /// No description provided for @mProfileMyKarmaPoints.
  ///
  /// In en, this message translates to:
  /// **'My Karma Points'**
  String get mProfileMyKarmaPoints;

  /// No description provided for @mProfileMyCertificates.
  ///
  /// In en, this message translates to:
  /// **'My Certificates'**
  String get mProfileMyCertificates;

  /// No description provided for @mProfileMyPosts.
  ///
  /// In en, this message translates to:
  /// **'My Posts'**
  String get mProfileMyPosts;

  /// No description provided for @mProfileAboutMe.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get mProfileAboutMe;

  /// No description provided for @mProfileSelectState.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get mProfileSelectState;

  /// No description provided for @mProfileSelectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select District'**
  String get mProfileSelectDistrict;

  /// No description provided for @mProfileDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get mProfileDistrict;

  /// No description provided for @mProfileDeletePhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete Photo'**
  String get mProfileDeletePhoto;

  /// No description provided for @mProfileChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get mProfileChangePhoto;

  /// No description provided for @mProfileSavePhoto.
  ///
  /// In en, this message translates to:
  /// **'Save Photo'**
  String get mProfileSavePhoto;

  /// No description provided for @mProfileProfileImageError.
  ///
  /// In en, this message translates to:
  /// **'File exceeds the maximum file size of {size}MB'**
  String mProfileProfileImageError(Object size);

  /// No description provided for @mProfileInvalidFileFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid File format'**
  String get mProfileInvalidFileFormat;

  /// No description provided for @mStaticOnlyAlphabetAllowed.
  ///
  /// In en, this message translates to:
  /// **'Only alphabets are allowed'**
  String get mStaticOnlyAlphabetAllowed;

  /// No description provided for @mStaticOnlyOneSpaceAllowed.
  ///
  /// In en, this message translates to:
  /// **'Please avoid using multiple spaces in a row.'**
  String get mStaticOnlyOneSpaceAllowed;

  /// No description provided for @mStaticNoSpaceAllowedInfront.
  ///
  /// In en, this message translates to:
  /// **'No space is allowed at the beggining of the name'**
  String get mStaticNoSpaceAllowedInfront;

  /// No description provided for @mStaticMinimumCharacterLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters long.'**
  String get mStaticMinimumCharacterLength;

  /// No description provided for @mProfilePrimaryDetailsEditDescription.
  ///
  /// In en, this message translates to:
  /// **'These details go to your MDO for approval. Please fill these details to view your iGOT plan.'**
  String get mProfilePrimaryDetailsEditDescription;

  /// No description provided for @mProfileNotAbleToFindDesignation.
  ///
  /// In en, this message translates to:
  /// **'Not able to find your designation? Please write us at {supportEmail} with the organization and designation name.'**
  String mProfileNotAbleToFindDesignation(Object supportEmail);

  /// No description provided for @mProfileServiceHistory.
  ///
  /// In en, this message translates to:
  /// **'Service History'**
  String get mProfileServiceHistory;

  /// No description provided for @mProfileEducationQualification.
  ///
  /// In en, this message translates to:
  /// **'Education Qualification'**
  String get mProfileEducationQualification;

  /// No description provided for @mProfileAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get mProfileAchievements;

  /// No description provided for @mProfileViewCertification.
  ///
  /// In en, this message translates to:
  /// **'View Certification'**
  String get mProfileViewCertification;

  /// No description provided for @mProfileEhrmsIdOrExternalSystemId.
  ///
  /// In en, this message translates to:
  /// **'eHRMS ID/External System ID'**
  String get mProfileEhrmsIdOrExternalSystemId;

  /// No description provided for @mProfileStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get mProfileStartDate;

  /// No description provided for @mProfileEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get mProfileEndDate;

  /// No description provided for @mProfileSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get mProfileSelectDate;

  /// No description provided for @mProfielAddYourDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your description'**
  String get mProfielAddYourDescription;

  /// No description provided for @mProfielSelectOrganizatinMinistry.
  ///
  /// In en, this message translates to:
  /// **'Select Organisation/Ministry'**
  String get mProfielSelectOrganizatinMinistry;

  /// No description provided for @mProfileCurrentlyWorking.
  ///
  /// In en, this message translates to:
  /// **'Currently Working'**
  String get mProfileCurrentlyWorking;

  /// No description provided for @mContentUnLocked.
  ///
  /// In en, this message translates to:
  /// **'This content is unlocked'**
  String get mContentUnLocked;

  /// No description provided for @mSearchSubsector.
  ///
  /// In en, this message translates to:
  /// **'Sub Sector'**
  String get mSearchSubsector;

  /// No description provided for @mSearchYears.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get mSearchYears;

  /// No description provided for @mSearchResources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get mSearchResources;

  /// No description provided for @mSearchExploreAllTheContent.
  ///
  /// In en, this message translates to:
  /// **'Explore all the content'**
  String get mSearchExploreAllTheContent;

  /// No description provided for @mSearchTopic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get mSearchTopic;

  /// No description provided for @meventArchivedMessage.
  ///
  /// In en, this message translates to:
  /// **'This event has been archived and is no longer available.'**
  String get meventArchivedMessage;

  /// No description provided for @mExploreContentSorryMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we couldn\'t find any results, so please Try adjusting your filters'**
  String get mExploreContentSorryMessage;

  /// No description provided for @mSearchExploreContents.
  ///
  /// In en, this message translates to:
  /// **'Explore Content'**
  String get mSearchExploreContents;

  /// No description provided for @mSearchFilterAppliedMessage.
  ///
  /// In en, this message translates to:
  /// **'Filter active. Clear the selection to view all options.'**
  String get mSearchFilterAppliedMessage;

  /// No description provided for @mNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get mNone;

  /// No description provided for @mLearnWithNaturalQueryProvess.
  ///
  /// In en, this message translates to:
  /// **'Learn with Natural query process'**
  String get mLearnWithNaturalQueryProvess;

  /// No description provided for @mSocratic.
  ///
  /// In en, this message translates to:
  /// **'Socratic Style'**
  String get mSocratic;

  /// No description provided for @mExploreIdeasThroughThoughtfulQuestions.
  ///
  /// In en, this message translates to:
  /// **'Explore ideas through thoughtful questions'**
  String get mExploreIdeasThroughThoughtfulQuestions;

  /// No description provided for @mAskAnything.
  ///
  /// In en, this message translates to:
  /// **'Ask Anything'**
  String get mAskAnything;

  /// No description provided for @mStaticCertificateDownloadError.
  ///
  /// In en, this message translates to:
  /// **'Unable to download your certificate this moment.'**
  String get mStaticCertificateDownloadError;

  /// No description provided for @mNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get mNotifications;

  /// No description provided for @mMarkAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All As Read'**
  String get mMarkAllAsRead;

  /// No description provided for @mProfileDistrictDisable.
  ///
  /// In en, this message translates to:
  /// **'Choose a state to proceed to district selection'**
  String get mProfileDistrictDisable;

  /// No description provided for @mProfileAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Added successfully!'**
  String get mProfileAddedSuccessfully;

  /// No description provided for @mProfileEducationalQualifications.
  ///
  /// In en, this message translates to:
  /// **'Educational qualifications'**
  String get mProfileEducationalQualifications;

  /// No description provided for @mProfileStartYear.
  ///
  /// In en, this message translates to:
  /// **'Start Year'**
  String get mProfileStartYear;

  /// No description provided for @mProfileEndYear.
  ///
  /// In en, this message translates to:
  /// **'End Year'**
  String get mProfileEndYear;

  /// No description provided for @mProfileSelectYear.
  ///
  /// In en, this message translates to:
  /// **'Select Year'**
  String get mProfileSelectYear;

  /// No description provided for @mProfileFieldOfStudy.
  ///
  /// In en, this message translates to:
  /// **'Field of Study'**
  String get mProfileFieldOfStudy;

  /// No description provided for @mProfileFieldOfStudyPlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'Enter your specialization(e.g., IT, Civil)'**
  String get mProfileFieldOfStudyPlaceHolder;

  /// No description provided for @mProfileInstitutePlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'Name of the University/College/Institute/School'**
  String get mProfileInstitutePlaceHolder;

  /// No description provided for @mProfileIssuingOrg.
  ///
  /// In en, this message translates to:
  /// **'Issuing Organisation'**
  String get mProfileIssuingOrg;

  /// No description provided for @mProfileIssueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get mProfileIssueDate;

  /// No description provided for @mProfileUploadFromSystem.
  ///
  /// In en, this message translates to:
  /// **'Upload from System'**
  String get mProfileUploadFromSystem;

  /// No description provided for @mProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get mProfileUrl;

  /// No description provided for @mProfileAchievementTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'e.g. Excel beginner'**
  String get mProfileAchievementTitleLabel;

  /// No description provided for @mProfileAchievementIssueOrgLabel.
  ///
  /// In en, this message translates to:
  /// **'e.g. Microsoft'**
  String get mProfileAchievementIssueOrgLabel;

  /// No description provided for @mProfileAchievementDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Describe about the skills that you have gained from this learning'**
  String get mProfileAchievementDescriptionLabel;

  /// No description provided for @mProfileDragFileToUpload.
  ///
  /// In en, this message translates to:
  /// **'Drag file to upload'**
  String get mProfileDragFileToUpload;

  /// No description provided for @mProfileProvideLinkForAchievement.
  ///
  /// In en, this message translates to:
  /// **'You may provide the link for the achievement'**
  String get mProfileProvideLinkForAchievement;

  /// No description provided for @mProfileAboutHelperText.
  ///
  /// In en, this message translates to:
  /// **'You can write about your years of experience, Skills, Current job role and Responsibilities.'**
  String get mProfileAboutHelperText;

  /// No description provided for @mProfileAboutMaxLengthText.
  ///
  /// In en, this message translates to:
  /// **'About should contain at most 2000 characters.'**
  String get mProfileAboutMaxLengthText;

  /// No description provided for @mProfileUploadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Uploaded Successfully'**
  String get mProfileUploadedSuccessfully;

  /// No description provided for @mProfileEnterInstituteName.
  ///
  /// In en, this message translates to:
  /// **'Enter institute name'**
  String get mProfileEnterInstituteName;

  /// No description provided for @mProfileEnterDegree.
  ///
  /// In en, this message translates to:
  /// **'Enter degree'**
  String get mProfileEnterDegree;

  /// No description provided for @mProfileSpecialCharacterNotApplowed.
  ///
  /// In en, this message translates to:
  /// **'Special characters are not allowed in this field'**
  String get mProfileSpecialCharacterNotApplowed;

  /// No description provided for @mProfilePleaseSelectOrg.
  ///
  /// In en, this message translates to:
  /// **'Please select an organization'**
  String get mProfilePleaseSelectOrg;

  /// No description provided for @mProfileDesignationRequired.
  ///
  /// In en, this message translates to:
  /// **'Designation is required'**
  String get mProfileDesignationRequired;

  /// No description provided for @mProfileSelectStateFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a state first'**
  String get mProfileSelectStateFirst;

  /// No description provided for @mProfileServiceDescriptionMsg.
  ///
  /// In en, this message translates to:
  /// **'Responsibilities and accomplishments in the role.'**
  String get mProfileServiceDescriptionMsg;

  /// No description provided for @mProfileSuccessfullyUploaded.
  ///
  /// In en, this message translates to:
  /// **'Successfully uploaded'**
  String get mProfileSuccessfullyUploaded;

  /// No description provided for @mStaticPresent.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get mStaticPresent;

  /// No description provided for @mStaticMonths.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get mStaticMonths;

  /// No description provided for @mSearchSearchCharacterLimit.
  ///
  /// In en, this message translates to:
  /// **'Oops, too short! Type at least {characterLimit} characters'**
  String mSearchSearchCharacterLimit(Object characterLimit);

  /// No description provided for @mSearchExternalContents.
  ///
  /// In en, this message translates to:
  /// **'External Contents'**
  String get mSearchExternalContents;

  /// No description provided for @mSearchContentPartner.
  ///
  /// In en, this message translates to:
  /// **'Content Patner'**
  String get mSearchContentPartner;

  /// No description provided for @mStaticUserDataError.
  ///
  /// In en, this message translates to:
  /// **'We\'re having trouble accessing your account details. Try signing out and logging back to resolve the issue.'**
  String get mStaticUserDataError;

  /// No description provided for @mSearchSearchResultEmpty.
  ///
  /// In en, this message translates to:
  /// **'Sorry, Search result is empty'**
  String get mSearchSearchResultEmpty;

  /// No description provided for @mNoNotificationsFound.
  ///
  /// In en, this message translates to:
  /// **'No notifications found'**
  String get mNoNotificationsFound;

  /// No description provided for @mNotificationOnHandleError.
  ///
  /// In en, this message translates to:
  /// **'This feature isn’t available in your app version'**
  String get mNotificationOnHandleError;

  /// No description provided for @mProfileCopyProfileLink.
  ///
  /// In en, this message translates to:
  /// **'Copy this profile link'**
  String get mProfileCopyProfileLink;

  /// No description provided for @mStaticFillUpTheDetails.
  ///
  /// In en, this message translates to:
  /// **'Fill up the details'**
  String get mStaticFillUpTheDetails;

  /// No description provided for @mStaticLoginToAccessContent.
  ///
  /// In en, this message translates to:
  /// **'You need to log in to access this content.'**
  String get mStaticLoginToAccessContent;

  /// No description provided for @mAssessmentAlreadySubmittedGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'You have successfully completed the assessment! If you have not received your certificate yet, don’t worry—we will resend them shortly.'**
  String get mAssessmentAlreadySubmittedGuestMessage;

  /// No description provided for @mAssessmentGuestCongratulationMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your certificate will be sent to your email soon.'**
  String get mAssessmentGuestCongratulationMessage;

  /// No description provided for @mTranscript.
  ///
  /// In en, this message translates to:
  /// **'Transcript'**
  String get mTranscript;

  /// No description provided for @mMarkedAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Marked all notifications as read'**
  String get mMarkedAllAsRead;

  /// No description provided for @mStoryTelling.
  ///
  /// In en, this message translates to:
  /// **'Storytelling'**
  String get mStoryTelling;

  /// No description provided for @mStoryTellingDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn through relatable narratives and real-life examples.'**
  String get mStoryTellingDescription;

  /// No description provided for @mInternetMessage.
  ///
  /// In en, this message translates to:
  /// **'These are Internet generated results'**
  String get mInternetMessage;

  /// No description provided for @mRetrievingResult.
  ///
  /// In en, this message translates to:
  /// **'Retrieving results'**
  String get mRetrievingResult;

  /// No description provided for @mIgotAiErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I am unable to process your request at the moment. Please try again.'**
  String get mIgotAiErrorMessage;

  /// No description provided for @mFeedbackSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Feedback submitted successfully'**
  String get mFeedbackSubmitted;

  /// No description provided for @mProfileNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get mProfileNameRequired;

  /// No description provided for @mProfileNumbersNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Name cannot contain numbers'**
  String get mProfileNumbersNotAllowed;

  /// No description provided for @mProfileNoSpecialCharacterAllowed.
  ///
  /// In en, this message translates to:
  /// **'Special characters are not allowed in the name'**
  String get mProfileNoSpecialCharacterAllowed;

  /// No description provided for @mProfileInvalidNameFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid name format'**
  String get mProfileInvalidNameFormat;

  /// No description provided for @mOrgSpecificDetails.
  ///
  /// In en, this message translates to:
  /// **'Organisation Specific Details'**
  String get mOrgSpecificDetails;

  /// No description provided for @mEditOrgSpecificDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Organisation Specific Details'**
  String get mEditOrgSpecificDetails;

  /// No description provided for @mFillRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all the required fields'**
  String get mFillRequiredFields;

  /// No description provided for @mProfileUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get mProfileUpdatedSuccessfully;

  /// No description provided for @mInvalidValue.
  ///
  /// In en, this message translates to:
  /// **'Invalid Value'**
  String get mInvalidValue;

  /// No description provided for @mIsRequired.
  ///
  /// In en, this message translates to:
  /// **'is required'**
  String get mIsRequired;

  /// No description provided for @mOrgDetailsWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the organization-specific details to continue using the app as requested by your organization.'**
  String get mOrgDetailsWarningMessage;

  /// No description provided for @mContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get mContinue;

  /// No description provided for @mLoginToMDOPortalToViewTheNotification.
  ///
  /// In en, this message translates to:
  /// **'Log in to your MDO portal to view the notification.'**
  String get mLoginToMDOPortalToViewTheNotification;

  /// No description provided for @mLoginToContentPortalToViewNotification.
  ///
  /// In en, this message translates to:
  /// **'Log in to your Content portal to view the notification'**
  String get mLoginToContentPortalToViewNotification;

  /// No description provided for @mBrokenDeepLinkError.
  ///
  /// In en, this message translates to:
  /// **'This request has been resolved or is no longer available.'**
  String get mBrokenDeepLinkError;

  /// No description provided for @mProfileNoSpaceInStartOrEnd.
  ///
  /// In en, this message translates to:
  /// **'Name cannot start or end with spaces.'**
  String get mProfileNoSpaceInStartOrEnd;

  /// No description provided for @mProfileAchievementError.
  ///
  /// In en, this message translates to:
  /// **'Special characters are not allowed, except for: {symbols}'**
  String mProfileAchievementError(Object symbols);

  /// No description provided for @mStaticInvalidLink.
  ///
  /// In en, this message translates to:
  /// **'Invalid link'**
  String get mStaticInvalidLink;

  /// No description provided for @mStaticTitleIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Title should not be empty'**
  String get mStaticTitleIsEmpty;

  /// No description provided for @mExploreNetwork.
  ///
  /// In en, this message translates to:
  /// **'Explore\nNetwork'**
  String get mExploreNetwork;

  /// No description provided for @mRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get mRecommendation;

  /// No description provided for @mMentors.
  ///
  /// In en, this message translates to:
  /// **'Mentors'**
  String get mMentors;

  /// No description provided for @mMyConnections.
  ///
  /// In en, this message translates to:
  /// **'My Connections'**
  String get mMyConnections;

  /// No description provided for @mSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get mSent;

  /// No description provided for @mUnblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get mUnblock;

  /// No description provided for @mUnblockConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unblock this user?'**
  String get mUnblockConfirmationMessage;

  /// No description provided for @mBlockedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User unblocked successfully'**
  String get mBlockedSuccessfully;

  /// No description provided for @mUnBlocked.
  ///
  /// In en, this message translates to:
  /// **'Unblocked'**
  String get mUnBlocked;

  /// No description provided for @mBlocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get mBlocked;

  /// No description provided for @mWithdrawConnectionRequest.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to withdraw this request?'**
  String get mWithdrawConnectionRequest;

  /// No description provided for @mRequestWithdrawnSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Request withdrawn successfully'**
  String get mRequestWithdrawnSuccessfully;

  /// No description provided for @mWithdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get mWithdraw;

  /// No description provided for @mWithdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get mWithdrawn;

  /// No description provided for @mRemoved.
  ///
  /// In en, this message translates to:
  /// **'Removed'**
  String get mRemoved;

  /// No description provided for @mBlockUser.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get mBlockUser;

  /// No description provided for @mRemoveConnection.
  ///
  /// In en, this message translates to:
  /// **'Remove Connection'**
  String get mRemoveConnection;

  /// No description provided for @mConnectionRemoved.
  ///
  /// In en, this message translates to:
  /// **'Connection removed'**
  String get mConnectionRemoved;

  /// No description provided for @mConnectionBlocked.
  ///
  /// In en, this message translates to:
  /// **'Connection blocked'**
  String get mConnectionBlocked;

  /// No description provided for @mAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get mAccepted;

  /// No description provided for @mRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get mRejected;

  /// No description provided for @mBlendedPreEnrollmentRequisites.
  ///
  /// In en, this message translates to:
  /// **'Pre-Enrollment Requisites'**
  String get mBlendedPreEnrollmentRequisites;

  /// No description provided for @mBlendedPreEnrollmentRequisitesCompleted.
  ///
  /// In en, this message translates to:
  /// **'Pre-Enrollment Requisites Completed'**
  String get mBlendedPreEnrollmentRequisitesCompleted;

  /// No description provided for @mBlendedPreEnrollmentOptionalResourceMsg.
  ///
  /// In en, this message translates to:
  /// **'OPTIONAL (The progress of this resource will be tracked).'**
  String get mBlendedPreEnrollmentOptionalResourceMsg;

  /// No description provided for @mBlendedPreEnrollmentMandatoryResourceMsg.
  ///
  /// In en, this message translates to:
  /// **'MANDATORY (The progress of this resource will be tracked).'**
  String get mBlendedPreEnrollmentMandatoryResourceMsg;

  /// No description provided for @mStaticInAppNotifications.
  ///
  /// In en, this message translates to:
  /// **'In-App Notification'**
  String get mStaticInAppNotifications;

  /// No description provided for @mStaticKeepReceivingInAppNotification.
  ///
  /// In en, this message translates to:
  /// **'Keep receiving notifications on the platform.'**
  String get mStaticKeepReceivingInAppNotification;

  /// No description provided for @mStaticEmailNotifications.
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get mStaticEmailNotifications;

  /// No description provided for @mStaticKeepReceivingEmailNotification.
  ///
  /// In en, this message translates to:
  /// **'Keep receiving notifications through email.'**
  String get mStaticKeepReceivingEmailNotification;

  /// No description provided for @mStaticPushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications.'**
  String get mStaticPushNotifications;

  /// No description provided for @mStaticKeepReceivingPushNotification.
  ///
  /// In en, this message translates to:
  /// **'Keep receiving push notifications on mobile.'**
  String get mStaticKeepReceivingPushNotification;

  /// No description provided for @mStaticSmsNotification.
  ///
  /// In en, this message translates to:
  /// **'SMS Notifications'**
  String get mStaticSmsNotification;

  /// No description provided for @mStaticKeepReceivingSmsNotification.
  ///
  /// In en, this message translates to:
  /// **'Keep receiving SMS notification.'**
  String get mStaticKeepReceivingSmsNotification;

  /// No description provided for @mStaticNoSettingFound.
  ///
  /// In en, this message translates to:
  /// **'No setting found'**
  String get mStaticNoSettingFound;

  /// No description provided for @mProfileEnterDesignation.
  ///
  /// In en, this message translates to:
  /// **'Enter your Designation'**
  String get mProfileEnterDesignation;

  /// No description provided for @mProfileDegreeName.
  ///
  /// In en, this message translates to:
  /// **'Degree name'**
  String get mProfileDegreeName;

  /// No description provided for @mProfileOtherInstituteName.
  ///
  /// In en, this message translates to:
  /// **'Other Institute name'**
  String get mProfileOtherInstituteName;

  /// No description provided for @mKarmapointEnrollTooltipMsg.
  ///
  /// In en, this message translates to:
  /// **'Note: This is only applicable for your first enrolment.'**
  String get mKarmapointEnrollTooltipMsg;

  /// No description provided for @mAboutLanguagesAvailable.
  ///
  /// In en, this message translates to:
  /// **'Languages available'**
  String get mAboutLanguagesAvailable;

  /// No description provided for @mTocSelectContentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Content Language'**
  String get mTocSelectContentLanguage;

  /// No description provided for @mTocContinueWhereyouLeftOff.
  ///
  /// In en, this message translates to:
  /// **'Continue where you left off in {lang}?'**
  String mTocContinueWhereyouLeftOff(Object lang);

  /// No description provided for @mTocYouHaveMadeProgress.
  ///
  /// In en, this message translates to:
  /// **'You\'ve already made some progress in this language.'**
  String get mTocYouHaveMadeProgress;

  /// No description provided for @mTocContinueFromLeftOff.
  ///
  /// In en, this message translates to:
  /// **'If you continue it will resume from where you left off.'**
  String get mTocContinueFromLeftOff;

  /// No description provided for @mTocWantToChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change the language?'**
  String get mTocWantToChangeLanguage;

  /// No description provided for @mTocSwitchingLangWillResetProgress.
  ///
  /// In en, this message translates to:
  /// **'Switching the language will reset your progress.'**
  String get mTocSwitchingLangWillResetProgress;

  /// No description provided for @mTocChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get mTocChangeLanguage;

  /// No description provided for @mTocCourseRestartFromBeginning.
  ///
  /// In en, this message translates to:
  /// **'The course will restart from the beginning in the selected language.'**
  String get mTocCourseRestartFromBeginning;

  /// No description provided for @mTocChoosPreferredLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Preferred Language'**
  String get mTocChoosPreferredLanguage;

  /// No description provided for @mTocChoosPreferredLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'This course is available in multiple languages. You can select one to begin.'**
  String get mTocChoosPreferredLanguageDescription;

  /// No description provided for @mTocConfirmStartCourse.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Start Course'**
  String get mTocConfirmStartCourse;

  /// No description provided for @mRequestRejectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to ignore this request?'**
  String get mRequestRejectedMessage;

  /// No description provided for @mRemoveConnectionConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you want to remove this connection?'**
  String get mRemoveConnectionConfirmationMessage;

  /// No description provided for @mBlockUserMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to block this user?'**
  String get mBlockUserMessage;

  /// No description provided for @mDiscoverMentorMessage.
  ///
  /// In en, this message translates to:
  /// **'Connect with mentors who will guide your learning journey'**
  String get mDiscoverMentorMessage;

  /// No description provided for @mNoMentorsFound.
  ///
  /// In en, this message translates to:
  /// **'No Mentors Found'**
  String get mNoMentorsFound;

  /// No description provided for @mConnectionRequestSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Connection request sent successfully'**
  String get mConnectionRequestSentSuccessfully;

  /// No description provided for @mIgnored.
  ///
  /// In en, this message translates to:
  /// **'Ignored'**
  String get mIgnored;

  /// No description provided for @mCopyProfileLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Profile Link'**
  String get mCopyProfileLink;

  /// No description provided for @mBlock.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get mBlock;

  /// No description provided for @mIgnore.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get mIgnore;

  /// No description provided for @mAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get mAccept;

  /// No description provided for @mEmptyConnectionsStateMessage.
  ///
  /// In en, this message translates to:
  /// **'You do not have any connections, Send connection requests from the home tab.'**
  String get mEmptyConnectionsStateMessage;

  /// No description provided for @mNoRequestSent.
  ///
  /// In en, this message translates to:
  /// **'No requests sent'**
  String get mNoRequestSent;

  /// No description provided for @mNoTranscriptAvailable.
  ///
  /// In en, this message translates to:
  /// **'No transcript available for this resource'**
  String get mNoTranscriptAvailable;

  /// No description provided for @mTranscriptDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer : These transcripts and subtitles are AI-generated and may contain errors.'**
  String get mTranscriptDisclaimer;

  /// No description provided for @mYouHaveBlockedThisProfile.
  ///
  /// In en, this message translates to:
  /// **'You have blocked this profile'**
  String get mYouHaveBlockedThisProfile;

  /// No description provided for @mBlockIncomingMessage.
  ///
  /// In en, this message translates to:
  /// **'You are not authorised to see this profile.'**
  String get mBlockIncomingMessage;

  /// No description provided for @mProfileVisibilityControl.
  ///
  /// In en, this message translates to:
  /// **'Visibility Control'**
  String get mProfileVisibilityControl;

  /// No description provided for @mProfilePublic.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get mProfilePublic;

  /// No description provided for @mProfilePrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get mProfilePrivate;

  /// No description provided for @mProfileAnyone.
  ///
  /// In en, this message translates to:
  /// **'Anyone'**
  String get mProfileAnyone;

  /// No description provided for @mProfileAnyoneCanViewDataOnYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Your profile details will be visible to everyone on the platform.'**
  String get mProfileAnyoneCanViewDataOnYourProfile;

  /// No description provided for @mProfileConnectionOnly.
  ///
  /// In en, this message translates to:
  /// **'Connections Only'**
  String get mProfileConnectionOnly;

  /// No description provided for @mProfileLockMyProfile.
  ///
  /// In en, this message translates to:
  /// **'No One/Lock my profile'**
  String get mProfileLockMyProfile;

  /// No description provided for @mProfileNoOneCanViewDataOnYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Selecting this option will hide your profile details from everyone, including your connections.'**
  String get mProfileNoOneCanViewDataOnYourProfile;

  /// No description provided for @mProfileLockedProfile.
  ///
  /// In en, this message translates to:
  /// **'This profile is locked'**
  String get mProfileLockedProfile;

  /// No description provided for @mProfileVisibilityUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated Successfully'**
  String get mProfileVisibilityUpdated;

  /// No description provided for @mTocAvailableInLanguages.
  ///
  /// In en, this message translates to:
  /// **'Available in {count} languages'**
  String mTocAvailableInLanguages(Object count);

  /// No description provided for @mTocAvailableLanguages.
  ///
  /// In en, this message translates to:
  /// **'Available Languages'**
  String get mTocAvailableLanguages;

  /// No description provided for @mTocAlreadyStartedCourse.
  ///
  /// In en, this message translates to:
  /// **'You\'ve already started this course'**
  String get mTocAlreadyStartedCourse;

  /// No description provided for @mTocYouHaveMadeSome.
  ///
  /// In en, this message translates to:
  /// **'You’ve made some '**
  String get mTocYouHaveMadeSome;

  /// No description provided for @mTocProgress.
  ///
  /// In en, this message translates to:
  /// **'progress'**
  String get mTocProgress;

  /// No description provided for @mTocInAnotherLanguageCourse.
  ///
  /// In en, this message translates to:
  /// **' in another language of this course.'**
  String get mTocInAnotherLanguageCourse;

  /// No description provided for @mTocWouldYouLikeTo.
  ///
  /// In en, this message translates to:
  /// **'Would you like to '**
  String get mTocWouldYouLikeTo;

  /// No description provided for @mTocWhereYouLeftOff.
  ///
  /// In en, this message translates to:
  /// **'resume where you left off'**
  String get mTocWhereYouLeftOff;

  /// No description provided for @mTocContinueWithThisVersion.
  ///
  /// In en, this message translates to:
  /// **', or continue with this version instead?'**
  String get mTocContinueWithThisVersion;

  /// No description provided for @mTocContinueHere.
  ///
  /// In en, this message translates to:
  /// **'Continue Here'**
  String get mTocContinueHere;

  /// No description provided for @mNotificationEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notification enabled!'**
  String get mNotificationEnabled;

  /// No description provided for @mNotificationDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notification disabled!'**
  String get mNotificationDisabled;

  /// No description provided for @mProfileCentralDeputation.
  ///
  /// In en, this message translates to:
  /// **'Central Deputation'**
  String get mProfileCentralDeputation;

  /// No description provided for @mStaticApar.
  ///
  /// In en, this message translates to:
  /// **'APAR'**
  String get mStaticApar;
}

class _TocLocalizationsDelegate extends LocalizationsDelegate<TocLocalizations> {
  const _TocLocalizationsDelegate();

  @override
  Future<TocLocalizations> load(Locale locale) {
    return SynchronousFuture<TocLocalizations>(lookupTocLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_TocLocalizationsDelegate old) => false;
}

TocLocalizations lookupTocLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TocLocalizationsEn();
    case 'hi': return TocLocalizationsHi();
  }

  throw FlutterError(
    'TocLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
