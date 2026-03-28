import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sw'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'YOUR\nHEALTH\nPARTNER'**
  String get appTagline;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simple, relaxing, healthy'**
  String get appSubtitle;

  /// No description provided for @onboardingPage1Title.
  ///
  /// In en, this message translates to:
  /// **'Every Step Counts'**
  String get onboardingPage1Title;

  /// No description provided for @onboardingPage1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your daily movement in real time.'**
  String get onboardingPage1Subtitle;

  /// No description provided for @onboardingPage2Title.
  ///
  /// In en, this message translates to:
  /// **'Visualize Progress'**
  String get onboardingPage2Title;

  /// No description provided for @onboardingPage2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'See your consistency at a glance.'**
  String get onboardingPage2Subtitle;

  /// No description provided for @onboardingPage3Title.
  ///
  /// In en, this message translates to:
  /// **'Your Fitness Hub'**
  String get onboardingPage3Title;

  /// No description provided for @onboardingPage3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything you need to stay fit.'**
  String get onboardingPage3Subtitle;

  /// No description provided for @onboardingPage4Title.
  ///
  /// In en, this message translates to:
  /// **'Set Your Goal'**
  String get onboardingPage4Title;

  /// No description provided for @onboardingPage4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your daily target.'**
  String get onboardingPage4Subtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @nextStep.
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get nextStep;

  /// No description provided for @startJourney.
  ///
  /// In en, this message translates to:
  /// **'Start Journey  →'**
  String get startJourney;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @daysActive.
  ///
  /// In en, this message translates to:
  /// **'22 Days Active'**
  String get daysActive;

  /// No description provided for @stepsToday.
  ///
  /// In en, this message translates to:
  /// **'STEPS TODAY'**
  String get stepsToday;

  /// No description provided for @stepsDaily.
  ///
  /// In en, this message translates to:
  /// **'STEPS DAILY'**
  String get stepsDaily;

  /// No description provided for @workouts.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get workouts;

  /// No description provided for @heartRate.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate'**
  String get heartRate;

  /// No description provided for @metrics.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get metrics;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @permissionsRequired.
  ///
  /// In en, this message translates to:
  /// **'Permissions Required'**
  String get permissionsRequired;

  /// No description provided for @permissionsDialogContent.
  ///
  /// In en, this message translates to:
  /// **'To track your steps and send motivational notifications, please allow Activity and Notification permissions.'**
  String get permissionsDialogContent;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @permissionsNotGranted.
  ///
  /// In en, this message translates to:
  /// **'Permissions not granted. Some features may not work.'**
  String get permissionsNotGranted;

  /// No description provided for @permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// No description provided for @setDailyStepGoal.
  ///
  /// In en, this message translates to:
  /// **'Set Daily Step Goal'**
  String get setDailyStepGoal;

  /// No description provided for @failedToLoadData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get failedToLoadData;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @achievementProgress.
  ///
  /// In en, this message translates to:
  /// **'Achievement Progress'**
  String get achievementProgress;

  /// No description provided for @bmiNotSet.
  ///
  /// In en, this message translates to:
  /// **'BMI: Not Set'**
  String get bmiNotSet;

  /// No description provided for @setHeightWeight.
  ///
  /// In en, this message translates to:
  /// **'Set height & weight in profile'**
  String get setHeightWeight;

  /// No description provided for @dailyReminder.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminder'**
  String get dailyReminder;

  /// No description provided for @dailyReminderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive a motivational quote every morning at 9 AM'**
  String get dailyReminderSubtitle;

  /// No description provided for @resetTodaysSteps.
  ///
  /// In en, this message translates to:
  /// **'Reset Today\'s Steps'**
  String get resetTodaysSteps;

  /// No description provided for @resetAllData.
  ///
  /// In en, this message translates to:
  /// **'Reset All Data'**
  String get resetAllData;

  /// No description provided for @fitnessSection.
  ///
  /// In en, this message translates to:
  /// **'Fitness Section'**
  String get fitnessSection;

  /// No description provided for @absTitle.
  ///
  /// In en, this message translates to:
  /// **'Abs'**
  String get absTitle;

  /// No description provided for @absSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only Four Moves for Abs'**
  String get absSubtitle;

  /// No description provided for @loseWeight.
  ///
  /// In en, this message translates to:
  /// **'Lose Weight'**
  String get loseWeight;

  /// No description provided for @loseWeightSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Burn fat more effectively'**
  String get loseWeightSubtitle;

  /// No description provided for @reduceStress.
  ///
  /// In en, this message translates to:
  /// **'Reduce Stress'**
  String get reduceStress;

  /// No description provided for @reduceStressSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clear mind, relax and meditate'**
  String get reduceStressSubtitle;

  /// No description provided for @morningWarmup.
  ///
  /// In en, this message translates to:
  /// **'Morning Warmup'**
  String get morningWarmup;

  /// No description provided for @morningWarmupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get some Fresh air Vitamin D'**
  String get morningWarmupSubtitle;

  /// No description provided for @todaysTotalSteps.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Total Steps'**
  String get todaysTotalSteps;

  /// No description provided for @mile.
  ///
  /// In en, this message translates to:
  /// **'Mile'**
  String get mile;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'Kcal'**
  String get kcal;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @daysStreak.
  ///
  /// In en, this message translates to:
  /// **'Days Streak'**
  String get daysStreak;

  /// No description provided for @goalSteps.
  ///
  /// In en, this message translates to:
  /// **'Goal: {goal} steps'**
  String goalSteps(int goal);

  /// No description provided for @stepsLeft.
  ///
  /// In en, this message translates to:
  /// **'{remaining} steps left'**
  String stepsLeft(int remaining);

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @totalSteps.
  ///
  /// In en, this message translates to:
  /// **'Total Steps'**
  String get totalSteps;

  /// No description provided for @monthlyProgress.
  ///
  /// In en, this message translates to:
  /// **'Monthly Progress'**
  String get monthlyProgress;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @appLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'App link copied to clipboard'**
  String get appLinkCopied;

  /// No description provided for @instruction.
  ///
  /// In en, this message translates to:
  /// **'Instruction'**
  String get instruction;

  /// No description provided for @instructionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guidance for using app'**
  String get instructionSubtitle;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @shareAppSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share Our App With Friends'**
  String get shareAppSubtitle;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @faqsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqsSubtitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'App\'s Privacy Policy'**
  String get privacyPolicySubtitle;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageLabel;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile Updated'**
  String get profileUpdated;

  /// No description provided for @profileSavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been saved successfully.'**
  String get profileSavedMessage;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid Input'**
  String get invalidInput;

  /// No description provided for @invalidInputMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name and age.'**
  String get invalidInputMessage;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @ageDisplay.
  ///
  /// In en, this message translates to:
  /// **'Age: {age}'**
  String ageDisplay(int age);

  /// No description provided for @selectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Your Gender'**
  String get selectYourGender;

  /// No description provided for @genderHint.
  ///
  /// In en, this message translates to:
  /// **'We need it to measure your stride length and calorie burn.'**
  String get genderHint;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get next;

  /// No description provided for @selectPrefix.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectPrefix;

  /// No description provided for @moreAboutYouPrefix.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreAboutYouPrefix;

  /// No description provided for @moreAboutYouSuffix.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get moreAboutYouSuffix;

  /// No description provided for @heightWeightHint.
  ///
  /// In en, this message translates to:
  /// **'To ensure accuracy, please input your correct height and weight. We never share this data.'**
  String get heightWeightHint;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @selectHeightCm.
  ///
  /// In en, this message translates to:
  /// **'Select Height (cm)'**
  String get selectHeightCm;

  /// No description provided for @selectWeightKg.
  ///
  /// In en, this message translates to:
  /// **'Select Weight (kg)'**
  String get selectWeightKg;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get start;

  /// No description provided for @absWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Abs Workouts'**
  String get absWorkouts;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @advance.
  ///
  /// In en, this message translates to:
  /// **'Advance'**
  String get advance;

  /// No description provided for @duration15mins.
  ///
  /// In en, this message translates to:
  /// **'15 mins'**
  String get duration15mins;

  /// No description provided for @duration30mins.
  ///
  /// In en, this message translates to:
  /// **'30 mins'**
  String get duration30mins;

  /// No description provided for @duration40plusMins.
  ///
  /// In en, this message translates to:
  /// **'40+ mins'**
  String get duration40plusMins;

  /// No description provided for @introduction.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get introduction;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @absBeginnerIntro.
  ///
  /// In en, this message translates to:
  /// **'This beginner abs workout is designed to activate your core, improve stability, and build foundational strength. Perfect for kickstarting your fitness journey.'**
  String get absBeginnerIntro;

  /// No description provided for @burnt45kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~45 kcal'**
  String get burnt45kcal;

  /// No description provided for @time10to15min.
  ///
  /// In en, this message translates to:
  /// **'Time: 10–15 min'**
  String get time10to15min;

  /// No description provided for @absIntermediateIntro.
  ///
  /// In en, this message translates to:
  /// **'This intermediate abs workout builds core strength with longer holds, higher reps, and dynamic moves. Ideal for progressing beyond the basics.'**
  String get absIntermediateIntro;

  /// No description provided for @burnt85to100kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~85-100 kcal'**
  String get burnt85to100kcal;

  /// No description provided for @time20to30min.
  ///
  /// In en, this message translates to:
  /// **'Time: 20–30 min'**
  String get time20to30min;

  /// No description provided for @absAdvancedIntro.
  ///
  /// In en, this message translates to:
  /// **'This advanced abs workout targets deep core muscles with high-rep moves, static holds, and dynamic transitions. Perfect for building definition, strength, and endurance.'**
  String get absAdvancedIntro;

  /// No description provided for @burnt130to160kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~130-160 kcal'**
  String get burnt130to160kcal;

  /// No description provided for @time40plusMin.
  ///
  /// In en, this message translates to:
  /// **'Time: 40+ min'**
  String get time40plusMin;

  /// No description provided for @loseWeightBeginnerIntro.
  ///
  /// In en, this message translates to:
  /// **'This beginner fat-burning workout is designed to elevate your heart rate, boost metabolism, and kickstart your weight loss journey. No equipment needed.'**
  String get loseWeightBeginnerIntro;

  /// No description provided for @burnt60kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~60 kcal'**
  String get burnt60kcal;

  /// No description provided for @time12to18min.
  ///
  /// In en, this message translates to:
  /// **'Time: 12–18 min'**
  String get time12to18min;

  /// No description provided for @loseWeightIntermediateIntro.
  ///
  /// In en, this message translates to:
  /// **'This intermediate fat-burning workout intensifies each move to challenge your stamina and accelerate fat loss. No equipment needed—just commitment.'**
  String get loseWeightIntermediateIntro;

  /// No description provided for @burnt90to100kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~90-100 kcal'**
  String get burnt90to100kcal;

  /// No description provided for @time25to30min.
  ///
  /// In en, this message translates to:
  /// **'Time: 25–30 min'**
  String get time25to30min;

  /// No description provided for @loseWeightAdvancedIntro.
  ///
  /// In en, this message translates to:
  /// **'This advanced fat-burning workout is built to challenge your endurance, strength, and coordination. Expect high reps, explosive movement, and serious sweat.'**
  String get loseWeightAdvancedIntro;

  /// No description provided for @burnt140to160kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~140-160 kcal'**
  String get burnt140to160kcal;

  /// No description provided for @reduceStressIntro.
  ///
  /// In en, this message translates to:
  /// **'In this Reduce Stress workout, you will practice Yoga, go for a Morning Walk, and follow a clean Diet. Yoga helps calm your mind and body, walking refreshes and boosts mood, and a balanced diet keeps you light, healthy, and stress-free.'**
  String get reduceStressIntro;

  /// No description provided for @burnt70kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~70 kcal'**
  String get burnt70kcal;

  /// No description provided for @morningWarmupIntro.
  ///
  /// In en, this message translates to:
  /// **'This Morning Warm-up has walking, jumping jacks, push-ups, and shoulder stretches to boost circulation, loosen stiffness, and energize you for the day.'**
  String get morningWarmupIntro;

  /// No description provided for @burnt60to80kcal.
  ///
  /// In en, this message translates to:
  /// **'Burnt ~60–80 kcal'**
  String get burnt60to80kcal;

  /// No description provided for @time10to15minWarmup.
  ///
  /// In en, this message translates to:
  /// **'Time: 10–15 min'**
  String get time10to15minWarmup;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlocked;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @unlockedBadge.
  ///
  /// In en, this message translates to:
  /// **'Unlocked: {title}'**
  String unlockedBadge(String title);

  /// No description provided for @levelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String levelLabel(int level);

  /// No description provided for @trophiesCollected.
  ///
  /// In en, this message translates to:
  /// **'Trophies Collected'**
  String get trophiesCollected;

  /// No description provided for @noTrophiesYet.
  ///
  /// In en, this message translates to:
  /// **'No trophies collected yet. Walk 10K steps in a day to earn one!'**
  String get noTrophiesYet;

  /// No description provided for @appGuide.
  ///
  /// In en, this message translates to:
  /// **'App Guide'**
  String get appGuide;

  /// No description provided for @dailyWeeklyTracking.
  ///
  /// In en, this message translates to:
  /// **'🏃 Daily & Weekly Tracking'**
  String get dailyWeeklyTracking;

  /// No description provided for @dailyWeeklyTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'On the first main screen, you\'ll see your daily step count live at the top. Below that, a weekly bar chart shows your progress for each day of the week.'**
  String get dailyWeeklyTrackingDesc;

  /// No description provided for @monthlyReportAchievements.
  ///
  /// In en, this message translates to:
  /// **'📊 Monthly Report & Achievements'**
  String get monthlyReportAchievements;

  /// No description provided for @monthlyReportDesc.
  ///
  /// In en, this message translates to:
  /// **'The second screen gives you a full monthly breakdown of your steps. You can view each day\'s record and see your total distance, calories, and duration. Achievements are also shown here, with progress toward unlocking badges.'**
  String get monthlyReportDesc;

  /// No description provided for @healthFitness.
  ///
  /// In en, this message translates to:
  /// **'💪 Health & Fitness'**
  String get healthFitness;

  /// No description provided for @healthFitnessDesc.
  ///
  /// In en, this message translates to:
  /// **'On the third screen, you can set your daily step goal and track your BMI. You\'ll also find fitness routines like:\n• Abs workouts\n• Weight loss exercises\n• Stress reduction\n• Morning warmups\n\nEach section includes estimated duration and calories burned.'**
  String get healthFitnessDesc;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'⚙️ Settings & Profile'**
  String get settingsProfile;

  /// No description provided for @settingsProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'The fourth screen includes your personal info like height and gender. You can toggle between light and dark themes, and reset your step data if needed.'**
  String get settingsProfileDesc;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'🎯 Tips'**
  String get tips;

  /// No description provided for @tipsDesc.
  ///
  /// In en, this message translates to:
  /// **'• Tap badges to view their descriptions.\n• Confetti celebrates your progress when you unlock achievements.\n• Use the health screen daily to stay consistent and motivated.'**
  String get tipsDesc;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get gotIt;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyPara1.
  ///
  /// In en, this message translates to:
  /// **'NSB Solutions (Private) Limited is committed to protecting your privacy. Our app, Pedometer – Walk & Track, is designed to help you monitor your daily activity without compromising your personal data. We do not collect, store, or transmit any user information—period.'**
  String get privacyPolicyPara1;

  /// No description provided for @privacyPolicyPara2.
  ///
  /// In en, this message translates to:
  /// **'We do not request or access your name, email, location, contacts, or any other personal identifiers. All step tracking and progress data is processed locally on your device and never leaves it. There is no cloud sync, no analytics, and no third-party tracking.'**
  String get privacyPolicyPara2;

  /// No description provided for @privacyPolicyPara3.
  ///
  /// In en, this message translates to:
  /// **'The app may request permission to access physical activity sensors and send notifications. These are used solely to count your steps and deliver motivational messages. No data is shared externally, and no information is stored beyond your device.'**
  String get privacyPolicyPara3;

  /// No description provided for @privacyPolicyPara4.
  ///
  /// In en, this message translates to:
  /// **'We do not use third-party services, SDKs, or APIs that collect user data. Your experience with Pedometer – Walk & Track is entirely private and self-contained.'**
  String get privacyPolicyPara4;

  /// No description provided for @privacyPolicyPara5.
  ///
  /// In en, this message translates to:
  /// **'Our app is suitable for all age groups and does not knowingly collect any data from children. Since we do not collect any information, there is no risk of misuse or unauthorized access.'**
  String get privacyPolicyPara5;

  /// No description provided for @privacyPolicyPara6.
  ///
  /// In en, this message translates to:
  /// **'If we make changes to the app that affect how it works or interacts with your device, we will also update this Privacy Policy to reflect those changes. We\'re committed to keeping you informed and protected every step of the way.'**
  String get privacyPolicyPara6;

  /// No description provided for @privacyPolicyContact.
  ///
  /// In en, this message translates to:
  /// **'For any questions or support, you can reach us at:'**
  String get privacyPolicyContact;

  /// No description provided for @privacyPolicyContactDetails.
  ///
  /// In en, this message translates to:
  /// **'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610'**
  String get privacyPolicyContactDetails;

  /// No description provided for @faq1Question.
  ///
  /// In en, this message translates to:
  /// **'Does this app count my steps?'**
  String get faq1Question;

  /// No description provided for @faq1Answer.
  ///
  /// In en, this message translates to:
  /// **'Yes, Pedometer Walk & Track accurately counts your steps throughout the day. It also tracks distance, calories burned, and active time to give you a complete view of your activity.'**
  String get faq1Answer;

  /// No description provided for @faq2Question.
  ///
  /// In en, this message translates to:
  /// **'Does the app have weight loss exercises?'**
  String get faq2Question;

  /// No description provided for @faq2Answer.
  ///
  /// In en, this message translates to:
  /// **'Yes, the app includes simple weight-loss and fitness exercises. You can find them at the bottom of the Health screen, designed to support your daily workout routine.'**
  String get faq2Answer;

  /// No description provided for @faq3Question.
  ///
  /// In en, this message translates to:
  /// **'Does the app keep monthly records of my steps?'**
  String get faq3Question;

  /// No description provided for @faq3Answer.
  ///
  /// In en, this message translates to:
  /// **'Yes, the app stores your daily, weekly, and monthly step records. This allows you to review your progress over time and stay motivated to achieve your fitness goals.'**
  String get faq3Answer;

  /// No description provided for @faq4Question.
  ///
  /// In en, this message translates to:
  /// **'Do you store my personal data?'**
  String get faq4Question;

  /// No description provided for @faq4Answer.
  ///
  /// In en, this message translates to:
  /// **'No, we do not store any of your personal data on servers. All of your step counts, records, and activity details are securely saved only on your device. This ensures your privacy and full control over your information.'**
  String get faq4Answer;

  /// No description provided for @faq5Question.
  ///
  /// In en, this message translates to:
  /// **'Will the app share my data with anyone?'**
  String get faq5Question;

  /// No description provided for @faq5Answer.
  ///
  /// In en, this message translates to:
  /// **'No, your data is never shared with anyone. Since Pedometer Walk & Track does not collect your personal data, there is nothing to share. You can use the app with complete confidence and peace of mind.'**
  String get faq5Answer;

  /// No description provided for @dailyRecords.
  ///
  /// In en, this message translates to:
  /// **'Daily Records'**
  String get dailyRecords;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get steps;

  /// No description provided for @miles.
  ///
  /// In en, this message translates to:
  /// **'Miles'**
  String get miles;

  /// No description provided for @monthlyCalendar.
  ///
  /// In en, this message translates to:
  /// **'Monthly Calendar'**
  String get monthlyCalendar;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nl',
    'pt',
    'ru',
    'sw',
    'tr',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sw':
      return AppLocalizationsSw();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
