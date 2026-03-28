// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTagline => 'YOUR\nHEALTH\nPARTNER';

  @override
  String get appSubtitle => 'Simple, relaxing, healthy';

  @override
  String get onboardingPage1Title => 'Every Step Counts';

  @override
  String get onboardingPage1Subtitle =>
      'Track your daily movement in real time.';

  @override
  String get onboardingPage2Title => 'Visualize Progress';

  @override
  String get onboardingPage2Subtitle => 'See your consistency at a glance.';

  @override
  String get onboardingPage3Title => 'Your Fitness Hub';

  @override
  String get onboardingPage3Subtitle => 'Everything you need to stay fit.';

  @override
  String get onboardingPage4Title => 'Set Your Goal';

  @override
  String get onboardingPage4Subtitle => 'Customize your daily target.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get nextStep => 'Next Step';

  @override
  String get startJourney => 'Start Journey  →';

  @override
  String get skip => 'Skip';

  @override
  String get october => 'October';

  @override
  String get daysActive => '22 Days Active';

  @override
  String get stepsToday => 'STEPS TODAY';

  @override
  String get stepsDaily => 'STEPS DAILY';

  @override
  String get workouts => 'Workouts';

  @override
  String get heartRate => 'Heart Rate';

  @override
  String get metrics => 'Metrics';

  @override
  String get reports => 'Reports';

  @override
  String get permissionsRequired => 'Permissions Required';

  @override
  String get permissionsDialogContent =>
      'To track your steps and send motivational notifications, please allow Activity and Notification permissions.';

  @override
  String get notNow => 'Not Now';

  @override
  String get allow => 'Allow';

  @override
  String get permissionsNotGranted =>
      'Permissions not granted. Some features may not work.';

  @override
  String get permissions => 'Permissions';

  @override
  String get setDailyStepGoal => 'Set Daily Step Goal';

  @override
  String get failedToLoadData => 'Failed to load data';

  @override
  String get retry => 'Retry';

  @override
  String get achievementProgress => 'Achievement Progress';

  @override
  String get bmiNotSet => 'BMI: Not Set';

  @override
  String get setHeightWeight => 'Set height & weight in profile';

  @override
  String get dailyReminder => 'Daily Reminder';

  @override
  String get dailyReminderSubtitle =>
      'Receive a motivational quote every morning at 9 AM';

  @override
  String get resetTodaysSteps => 'Reset Today\'s Steps';

  @override
  String get resetAllData => 'Reset All Data';

  @override
  String get fitnessSection => 'Fitness Section';

  @override
  String get absTitle => 'Abs';

  @override
  String get absSubtitle => 'Only Four Moves for Abs';

  @override
  String get loseWeight => 'Lose Weight';

  @override
  String get loseWeightSubtitle => 'Burn fat more effectively';

  @override
  String get reduceStress => 'Reduce Stress';

  @override
  String get reduceStressSubtitle => 'Clear mind, relax and meditate';

  @override
  String get morningWarmup => 'Morning Warmup';

  @override
  String get morningWarmupSubtitle => 'Get some Fresh air Vitamin D';

  @override
  String get todaysTotalSteps => 'Today\'s Total Steps';

  @override
  String get mile => 'Mile';

  @override
  String get kcal => 'Kcal';

  @override
  String get time => 'Time';

  @override
  String get daysStreak => 'Days Streak';

  @override
  String goalSteps(int goal) {
    return 'Goal: $goal steps';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining steps left';
  }

  @override
  String get achievements => 'Achievements';

  @override
  String get thisMonth => 'This Month';

  @override
  String get totalSteps => 'Total Steps';

  @override
  String get monthlyProgress => 'Monthly Progress';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get theme => 'Theme';

  @override
  String get appLinkCopied => 'App link copied to clipboard';

  @override
  String get instruction => 'Instruction';

  @override
  String get instructionSubtitle => 'Guidance for using app';

  @override
  String get shareApp => 'Share App';

  @override
  String get shareAppSubtitle => 'Share Our App With Friends';

  @override
  String get faqs => 'FAQs';

  @override
  String get faqsSubtitle => 'Frequently Asked Questions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicySubtitle => 'App\'s Privacy Policy';

  @override
  String get nameLabel => 'Name';

  @override
  String get ageLabel => 'Age';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get profileUpdated => 'Profile Updated';

  @override
  String get profileSavedMessage => 'Your profile has been saved successfully.';

  @override
  String get invalidInput => 'Invalid Input';

  @override
  String get invalidInputMessage => 'Please enter a valid name and age.';

  @override
  String get loading => 'Loading...';

  @override
  String get notSet => 'Not set';

  @override
  String ageDisplay(int age) {
    return 'Age: $age';
  }

  @override
  String get selectYourGender => 'Your Gender';

  @override
  String get genderHint =>
      'We need it to measure your stride length and calorie burn.';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get next => 'NEXT';

  @override
  String get selectPrefix => 'Select';

  @override
  String get moreAboutYouPrefix => 'More';

  @override
  String get moreAboutYouSuffix => 'About You';

  @override
  String get heightWeightHint =>
      'To ensure accuracy, please input your correct height and weight. We never share this data.';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get selectHeightCm => 'Select Height (cm)';

  @override
  String get selectWeightKg => 'Select Weight (kg)';

  @override
  String get start => 'START';

  @override
  String get absWorkouts => 'Abs Workouts';

  @override
  String get beginner => 'Beginner';

  @override
  String get intermediate => 'Intermediate';

  @override
  String get advanced => 'Advanced';

  @override
  String get advance => 'Advance';

  @override
  String get duration15mins => '15 mins';

  @override
  String get duration30mins => '30 mins';

  @override
  String get duration40plusMins => '40+ mins';

  @override
  String get introduction => 'Introduction';

  @override
  String get level => 'Level';

  @override
  String get duration => 'Duration';

  @override
  String get absBeginnerIntro =>
      'This beginner abs workout is designed to activate your core, improve stability, and build foundational strength. Perfect for kickstarting your fitness journey.';

  @override
  String get burnt45kcal => 'Burnt ~45 kcal';

  @override
  String get time10to15min => 'Time: 10–15 min';

  @override
  String get absIntermediateIntro =>
      'This intermediate abs workout builds core strength with longer holds, higher reps, and dynamic moves. Ideal for progressing beyond the basics.';

  @override
  String get burnt85to100kcal => 'Burnt ~85-100 kcal';

  @override
  String get time20to30min => 'Time: 20–30 min';

  @override
  String get absAdvancedIntro =>
      'This advanced abs workout targets deep core muscles with high-rep moves, static holds, and dynamic transitions. Perfect for building definition, strength, and endurance.';

  @override
  String get burnt130to160kcal => 'Burnt ~130-160 kcal';

  @override
  String get time40plusMin => 'Time: 40+ min';

  @override
  String get loseWeightBeginnerIntro =>
      'This beginner fat-burning workout is designed to elevate your heart rate, boost metabolism, and kickstart your weight loss journey. No equipment needed.';

  @override
  String get burnt60kcal => 'Burnt ~60 kcal';

  @override
  String get time12to18min => 'Time: 12–18 min';

  @override
  String get loseWeightIntermediateIntro =>
      'This intermediate fat-burning workout intensifies each move to challenge your stamina and accelerate fat loss. No equipment needed—just commitment.';

  @override
  String get burnt90to100kcal => 'Burnt ~90-100 kcal';

  @override
  String get time25to30min => 'Time: 25–30 min';

  @override
  String get loseWeightAdvancedIntro =>
      'This advanced fat-burning workout is built to challenge your endurance, strength, and coordination. Expect high reps, explosive movement, and serious sweat.';

  @override
  String get burnt140to160kcal => 'Burnt ~140-160 kcal';

  @override
  String get reduceStressIntro =>
      'In this Reduce Stress workout, you will practice Yoga, go for a Morning Walk, and follow a clean Diet. Yoga helps calm your mind and body, walking refreshes and boosts mood, and a balanced diet keeps you light, healthy, and stress-free.';

  @override
  String get burnt70kcal => 'Burnt ~70 kcal';

  @override
  String get morningWarmupIntro =>
      'This Morning Warm-up has walking, jumping jacks, push-ups, and shoulder stretches to boost circulation, loosen stiffness, and energize you for the day.';

  @override
  String get burnt60to80kcal => 'Burnt ~60–80 kcal';

  @override
  String get time10to15minWarmup => 'Time: 10–15 min';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get unlocked => 'Unlocked';

  @override
  String get locked => 'Locked';

  @override
  String unlockedBadge(String title) {
    return 'Unlocked: $title';
  }

  @override
  String levelLabel(int level) {
    return 'Level $level';
  }

  @override
  String get trophiesCollected => 'Trophies Collected';

  @override
  String get noTrophiesYet =>
      'No trophies collected yet. Walk 10K steps in a day to earn one!';

  @override
  String get appGuide => 'App Guide';

  @override
  String get dailyWeeklyTracking => '🏃 Daily & Weekly Tracking';

  @override
  String get dailyWeeklyTrackingDesc =>
      'On the first main screen, you\'ll see your daily step count live at the top. Below that, a weekly bar chart shows your progress for each day of the week.';

  @override
  String get monthlyReportAchievements => '📊 Monthly Report & Achievements';

  @override
  String get monthlyReportDesc =>
      'The second screen gives you a full monthly breakdown of your steps. You can view each day\'s record and see your total distance, calories, and duration. Achievements are also shown here, with progress toward unlocking badges.';

  @override
  String get healthFitness => '💪 Health & Fitness';

  @override
  String get healthFitnessDesc =>
      'On the third screen, you can set your daily step goal and track your BMI. You\'ll also find fitness routines like:\n• Abs workouts\n• Weight loss exercises\n• Stress reduction\n• Morning warmups\n\nEach section includes estimated duration and calories burned.';

  @override
  String get settingsProfile => '⚙️ Settings & Profile';

  @override
  String get settingsProfileDesc =>
      'The fourth screen includes your personal info like height and gender. You can toggle between light and dark themes, and reset your step data if needed.';

  @override
  String get tips => '🎯 Tips';

  @override
  String get tipsDesc =>
      '• Tap badges to view their descriptions.\n• Confetti celebrates your progress when you unlock achievements.\n• Use the health screen daily to stay consistent and motivated.';

  @override
  String get gotIt => 'Got it!';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited is committed to protecting your privacy. Our app, Pedometer – Walk & Track, is designed to help you monitor your daily activity without compromising your personal data. We do not collect, store, or transmit any user information—period.';

  @override
  String get privacyPolicyPara2 =>
      'We do not request or access your name, email, location, contacts, or any other personal identifiers. All step tracking and progress data is processed locally on your device and never leaves it. There is no cloud sync, no analytics, and no third-party tracking.';

  @override
  String get privacyPolicyPara3 =>
      'The app may request permission to access physical activity sensors and send notifications. These are used solely to count your steps and deliver motivational messages. No data is shared externally, and no information is stored beyond your device.';

  @override
  String get privacyPolicyPara4 =>
      'We do not use third-party services, SDKs, or APIs that collect user data. Your experience with Pedometer – Walk & Track is entirely private and self-contained.';

  @override
  String get privacyPolicyPara5 =>
      'Our app is suitable for all age groups and does not knowingly collect any data from children. Since we do not collect any information, there is no risk of misuse or unauthorized access.';

  @override
  String get privacyPolicyPara6 =>
      'If we make changes to the app that affect how it works or interacts with your device, we will also update this Privacy Policy to reflect those changes. We\'re committed to keeping you informed and protected every step of the way.';

  @override
  String get privacyPolicyContact =>
      'For any questions or support, you can reach us at:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'Does this app count my steps?';

  @override
  String get faq1Answer =>
      'Yes, Pedometer Walk & Track accurately counts your steps throughout the day. It also tracks distance, calories burned, and active time to give you a complete view of your activity.';

  @override
  String get faq2Question => 'Does the app have weight loss exercises?';

  @override
  String get faq2Answer =>
      'Yes, the app includes simple weight-loss and fitness exercises. You can find them at the bottom of the Health screen, designed to support your daily workout routine.';

  @override
  String get faq3Question => 'Does the app keep monthly records of my steps?';

  @override
  String get faq3Answer =>
      'Yes, the app stores your daily, weekly, and monthly step records. This allows you to review your progress over time and stay motivated to achieve your fitness goals.';

  @override
  String get faq4Question => 'Do you store my personal data?';

  @override
  String get faq4Answer =>
      'No, we do not store any of your personal data on servers. All of your step counts, records, and activity details are securely saved only on your device. This ensures your privacy and full control over your information.';

  @override
  String get faq5Question => 'Will the app share my data with anyone?';

  @override
  String get faq5Answer =>
      'No, your data is never shared with anyone. Since Pedometer Walk & Track does not collect your personal data, there is nothing to share. You can use the app with complete confidence and peace of mind.';

  @override
  String get dailyRecords => 'Daily Records';

  @override
  String get steps => 'Steps';

  @override
  String get miles => 'Miles';

  @override
  String get monthlyCalendar => 'Monthly Calendar';
}
