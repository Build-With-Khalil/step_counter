// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTagline => 'আপনার\nস্বাস্থ্য\nসঙ্গী';

  @override
  String get appSubtitle => 'সহজ, আরামদায়ক, স্বাস্থ্যকর';

  @override
  String get onboardingPage1Title => 'প্রতিটি পদক্ষেপ গুরুত্বপূর্ণ';

  @override
  String get onboardingPage1Subtitle =>
      'রিয়েল টাইমে আপনার দৈনিক চলাচল ট্র্যাক করুন।';

  @override
  String get onboardingPage2Title => 'অগ্রগতি দেখুন';

  @override
  String get onboardingPage2Subtitle => 'এক নজরে আপনার ধারাবাহিকতা দেখুন।';

  @override
  String get onboardingPage3Title => 'আপনার ফিটনেস হাব';

  @override
  String get onboardingPage3Subtitle => 'সুস্থ থাকতে যা দরকার সব কিছু।';

  @override
  String get onboardingPage4Title => 'আপনার লক্ষ্য নির্ধারণ করুন';

  @override
  String get onboardingPage4Subtitle => 'আপনার দৈনিক লক্ষ্য কাস্টমাইজ করুন।';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get nextStep => 'পরবর্তী পদক্ষেপ';

  @override
  String get startJourney => 'যাত্রা শুরু করুন  →';

  @override
  String get skip => 'এড়িয়ে যান';

  @override
  String get october => 'অক্টোবর';

  @override
  String get daysActive => '২২ দিন সক্রিয়';

  @override
  String get stepsToday => 'আজকের পদক্ষেপ';

  @override
  String get stepsDaily => 'দৈনিক পদক্ষেপ';

  @override
  String get workouts => 'ব্যায়াম';

  @override
  String get heartRate => 'হৃদস্পন্দন';

  @override
  String get metrics => 'মেট্রিক্স';

  @override
  String get reports => 'প্রতিবেদন';

  @override
  String get permissionsRequired => 'অনুমতি প্রয়োজন';

  @override
  String get permissionsDialogContent =>
      'আপনার পদক্ষেপ ট্র্যাক করতে এবং অনুপ্রেরণামূলক বিজ্ঞপ্তি পাঠাতে, অনুগ্রহ করে কার্যকলাপ ও বিজ্ঞপ্তির অনুমতি দিন।';

  @override
  String get notNow => 'এখন নয়';

  @override
  String get allow => 'অনুমতি দিন';

  @override
  String get permissionsNotGranted =>
      'অনুমতি দেওয়া হয়নি। কিছু বৈশিষ্ট্য কাজ নাও করতে পারে।';

  @override
  String get permissions => 'অনুমতি';

  @override
  String get setDailyStepGoal => 'দৈনিক পদক্ষেপের লক্ষ্য নির্ধারণ করুন';

  @override
  String get failedToLoadData => 'ডেটা লোড করতে ব্যর্থ';

  @override
  String get retry => 'পুনরায় চেষ্টা করুন';

  @override
  String get achievementProgress => 'অর্জনের অগ্রগতি';

  @override
  String get bmiNotSet => 'BMI: নির্ধারিত নয়';

  @override
  String get setHeightWeight => 'প্রোফাইলে উচ্চতা ও ওজন নির্ধারণ করুন';

  @override
  String get dailyReminder => 'দৈনিক রিমাইন্ডার';

  @override
  String get dailyReminderSubtitle =>
      'প্রতিদিন সকাল ৯টায় একটি অনুপ্রেরণামূলক উদ্ধৃতি পান';

  @override
  String get resetTodaysSteps => 'আজকের পদক্ষেপ রিসেট করুন';

  @override
  String get resetAllData => 'সব ডেটা রিসেট করুন';

  @override
  String get fitnessSection => 'ফিটনেস বিভাগ';

  @override
  String get absTitle => 'পেটের ব্যায়াম';

  @override
  String get absSubtitle => 'পেটের জন্য মাত্র চারটি মুভ';

  @override
  String get loseWeight => 'ওজন কমান';

  @override
  String get loseWeightSubtitle => 'আরও কার্যকরভাবে চর্বি পোড়ান';

  @override
  String get reduceStress => 'মানসিক চাপ কমান';

  @override
  String get reduceStressSubtitle => 'পরিষ্কার মন, বিশ্রাম ও ধ্যান';

  @override
  String get morningWarmup => 'সকালের ওয়ার্মআপ';

  @override
  String get morningWarmupSubtitle => 'তাজা বাতাস এবং ভিটামিন ডি পান';

  @override
  String get todaysTotalSteps => 'আজকের মোট পদক্ষেপ';

  @override
  String get mile => 'মাইল';

  @override
  String get kcal => 'কিলোক্যালোরি';

  @override
  String get time => 'সময়';

  @override
  String get daysStreak => 'ধারাবাহিক দিন';

  @override
  String goalSteps(int goal) {
    return 'লক্ষ্য: $goal পদক্ষেপ';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining পদক্ষেপ বাকি';
  }

  @override
  String get achievements => 'অর্জন';

  @override
  String get thisMonth => 'এই মাসে';

  @override
  String get totalSteps => 'মোট পদক্ষেপ';

  @override
  String get monthlyProgress => 'মাসিক অগ্রগতি';

  @override
  String get editProfile => 'প্রোফাইল সম্পাদনা করুন';

  @override
  String get theme => 'থিম';

  @override
  String get appLinkCopied => 'অ্যাপ লিঙ্ক ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get instruction => 'নির্দেশনা';

  @override
  String get instructionSubtitle => 'অ্যাপ ব্যবহারের গাইড';

  @override
  String get shareApp => 'অ্যাপ শেয়ার করুন';

  @override
  String get shareAppSubtitle => 'আমাদের অ্যাপ বন্ধুদের সাথে শেয়ার করুন';

  @override
  String get faqs => 'সাধারণ প্রশ্নসমূহ';

  @override
  String get faqsSubtitle => 'প্রায়শই জিজ্ঞাসিত প্রশ্নসমূহ';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get privacyPolicySubtitle => 'অ্যাপের গোপনীয়তা নীতি';

  @override
  String get nameLabel => 'নাম';

  @override
  String get ageLabel => 'বয়স';

  @override
  String get cancel => 'বাতিল';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get profileUpdated => 'প্রোফাইল আপডেট হয়েছে';

  @override
  String get profileSavedMessage =>
      'আপনার প্রোফাইল সফলভাবে সংরক্ষণ করা হয়েছে।';

  @override
  String get invalidInput => 'অবৈধ ইনপুট';

  @override
  String get invalidInputMessage => 'অনুগ্রহ করে একটি বৈধ নাম ও বয়স দিন।';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get notSet => 'নির্ধারিত নয়';

  @override
  String ageDisplay(int age) {
    return 'বয়স: $age';
  }

  @override
  String get selectYourGender => 'আপনার লিঙ্গ';

  @override
  String get genderHint =>
      'আপনার পদক্ষেপের দৈর্ঘ্য এবং ক্যালোরি বার্ন পরিমাপ করতে এটি প্রয়োজন।';

  @override
  String get male => 'পুরুষ';

  @override
  String get female => 'মহিলা';

  @override
  String get next => 'পরবর্তী';

  @override
  String get selectPrefix => 'নির্বাচন করুন';

  @override
  String get moreAboutYouPrefix => 'আরও';

  @override
  String get moreAboutYouSuffix => 'আপনার সম্পর্কে';

  @override
  String get heightWeightHint =>
      'নির্ভুলতা নিশ্চিত করতে, অনুগ্রহ করে আপনার সঠিক উচ্চতা ও ওজন দিন। আমরা এই ডেটা কখনও শেয়ার করি না।';

  @override
  String get height => 'উচ্চতা';

  @override
  String get weight => 'ওজন';

  @override
  String get selectHeightCm => 'উচ্চতা নির্বাচন করুন (সেমি)';

  @override
  String get selectWeightKg => 'ওজন নির্বাচন করুন (কেজি)';

  @override
  String get start => 'শুরু';

  @override
  String get absWorkouts => 'পেটের ব্যায়াম';

  @override
  String get beginner => 'প্রাথমিক';

  @override
  String get intermediate => 'মধ্যবর্তী';

  @override
  String get advanced => 'উন্নত';

  @override
  String get advance => 'এগিয়ে যান';

  @override
  String get duration15mins => '১৫ মিনিট';

  @override
  String get duration30mins => '৩০ মিনিট';

  @override
  String get duration40plusMins => '৪০+ মিনিট';

  @override
  String get introduction => 'পরিচয়';

  @override
  String get level => 'স্তর';

  @override
  String get duration => 'সময়কাল';

  @override
  String get absBeginnerIntro =>
      'এই প্রাথমিক পেটের ব্যায়াম আপনার মূল পেশী সক্রিয় করতে, স্থিতিশীলতা উন্নত করতে এবং মৌলিক শক্তি তৈরি করতে ডিজাইন করা হয়েছে। আপনার ফিটনেস যাত্রা শুরু করার জন্য নিখুঁত।';

  @override
  String get burnt45kcal => 'পোড়া ~৪৫ কিলোক্যালোরি';

  @override
  String get time10to15min => 'সময়: ১০–১৫ মিনিট';

  @override
  String get absIntermediateIntro =>
      'এই মধ্যবর্তী পেটের ব্যায়াম দীর্ঘ ধরে রাখা, বেশি পুনরাবৃত্তি এবং গতিশীল মুভ দিয়ে মূল শক্তি তৈরি করে। মূল বিষয়গুলির বাইরে এগিয়ে যাওয়ার জন্য আদর্শ।';

  @override
  String get burnt85to100kcal => 'পোড়া ~৮৫-১০০ কিলোক্যালোরি';

  @override
  String get time20to30min => 'সময়: ২০–৩০ মিনিট';

  @override
  String get absAdvancedIntro =>
      'এই উন্নত পেটের ব্যায়াম উচ্চ-পুনরাবৃত্তি মুভ, স্থির ধরে রাখা এবং গতিশীল ট্রানজিশন দিয়ে গভীর মূল পেশীগুলিকে টার্গেট করে। সংজ্ঞা, শক্তি এবং সহনশীলতা তৈরির জন্য নিখুঁত।';

  @override
  String get burnt130to160kcal => 'পোড়া ~১৩০-১৬০ কিলোক্যালোরি';

  @override
  String get time40plusMin => 'সময়: ৪০+ মিনিট';

  @override
  String get loseWeightBeginnerIntro =>
      'এই প্রাথমিক চর্বি পোড়ানো ব্যায়াম আপনার হৃদস্পন্দন বাড়াতে, বিপাক উন্নত করতে এবং আপনার ওজন কমানোর যাত্রা শুরু করতে ডিজাইন করা হয়েছে। কোনো সরঞ্জামের প্রয়োজন নেই।';

  @override
  String get burnt60kcal => 'পোড়া ~৬০ কিলোক্যালোরি';

  @override
  String get time12to18min => 'সময়: ১২–১৮ মিনিট';

  @override
  String get loseWeightIntermediateIntro =>
      'এই মধ্যবর্তী চর্বি পোড়ানো ব্যায়াম আপনার সহনশীলতাকে চ্যালেঞ্জ করতে এবং চর্বি হ্রাস ত্বরান্বিত করতে প্রতিটি মুভকে তীব্র করে। কোনো সরঞ্জাম প্রয়োজন নেই—শুধু প্রতিশ্রুতি।';

  @override
  String get burnt90to100kcal => 'পোড়া ~৯০-১০০ কিলোক্যালোরি';

  @override
  String get time25to30min => 'সময়: ২৫–৩০ মিনিট';

  @override
  String get loseWeightAdvancedIntro =>
      'এই উন্নত চর্বি পোড়ানো ব্যায়াম আপনার সহনশীলতা, শক্তি এবং সমন্বয়কে চ্যালেঞ্জ করার জন্য তৈরি। উচ্চ পুনরাবৃত্তি, বিস্ফোরক আন্দোলন এবং গুরুতর ঘাম প্রত্যাশা করুন।';

  @override
  String get burnt140to160kcal => 'পোড়া ~১৪০-১৬০ কিলোক্যালোরি';

  @override
  String get reduceStressIntro =>
      'এই মানসিক চাপ কমানো ব্যায়ামে, আপনি যোগব্যায়াম অনুশীলন করবেন, সকালের হাঁটায় যাবেন এবং পরিষ্কার ডায়েট অনুসরণ করবেন। যোগব্যায়াম আপনার মন ও শরীরকে শান্ত করে, হাঁটা মেজাজকে সতেজ ও উন্নত করে এবং একটি সুষম খাদ্য আপনাকে হালকা, সুস্থ এবং মানসিক চাপমুক্ত রাখে।';

  @override
  String get burnt70kcal => 'পোড়া ~৭০ কিলোক্যালোরি';

  @override
  String get morningWarmupIntro =>
      'এই সকালের ওয়ার্মআপে রক্ত সঞ্চালন উন্নত করতে, জড়তা দূর করতে এবং দিনের জন্য শক্তি যোগাতে হাঁটা, জাম্পিং জ্যাক, পুশ-আপ এবং কাঁধের স্ট্রেচ রয়েছে।';

  @override
  String get burnt60to80kcal => 'পোড়া ~৬০–৮০ কিলোক্যালোরি';

  @override
  String get time10to15minWarmup => 'সময়: ১০–১৫ মিনিট';

  @override
  String get achievementsTitle => 'অর্জন';

  @override
  String get unlocked => 'আনলক';

  @override
  String get locked => 'লক';

  @override
  String unlockedBadge(String title) {
    return 'আনলক: $title';
  }

  @override
  String levelLabel(int level) {
    return 'স্তর $level';
  }

  @override
  String get trophiesCollected => 'সংগৃহীত ট্রফি';

  @override
  String get noTrophiesYet =>
      'এখনও কোনো ট্রফি সংগ্রহ করা হয়নি। একটি পেতে এক দিনে ১০,০০০ পদক্ষেপ হাঁটুন!';

  @override
  String get appGuide => 'অ্যাপ গাইড';

  @override
  String get dailyWeeklyTracking => '🏃 দৈনিক ও সাপ্তাহিক ট্র্যাকিং';

  @override
  String get dailyWeeklyTrackingDesc =>
      'প্রথম মূল স্ক্রিনে, আপনি উপরে লাইভ দৈনিক পদক্ষেপ গণনা দেখবেন। তার নিচে, একটি সাপ্তাহিক বার চার্ট সপ্তাহের প্রতিটি দিনের অগ্রগতি দেখায়।';

  @override
  String get monthlyReportAchievements => '📊 মাসিক প্রতিবেদন ও অর্জন';

  @override
  String get monthlyReportDesc =>
      'দ্বিতীয় স্ক্রিন আপনাকে আপনার পদক্ষেপের সম্পূর্ণ মাসিক বিভাজন দেয়। আপনি প্রতিটি দিনের রেকর্ড দেখতে এবং মোট দূরত্ব, ক্যালোরি এবং সময়কাল দেখতে পারবেন। ব্যাজ আনলকের দিকে অগ্রগতির সাথে অর্জনগুলিও এখানে দেখানো হয়।';

  @override
  String get healthFitness => '💪 স্বাস্থ্য ও ফিটনেস';

  @override
  String get healthFitnessDesc =>
      'তৃতীয় স্ক্রিনে, আপনি আপনার দৈনিক পদক্ষেপের লক্ষ্য নির্ধারণ করতে এবং BMI ট্র্যাক করতে পারবেন। আপনি এরকম ফিটনেস রুটিনও পাবেন:\n• পেটের ব্যায়াম\n• ওজন হ্রাসের ব্যায়াম\n• মানসিক চাপ হ্রাস\n• সকালের ওয়ার্মআপ\n\nপ্রতিটি বিভাগে আনুমানিক সময়কাল এবং পোড়া ক্যালোরি অন্তর্ভুক্ত।';

  @override
  String get settingsProfile => '⚙️ সেটিংস ও প্রোফাইল';

  @override
  String get settingsProfileDesc =>
      'চতুর্থ স্ক্রিনে উচ্চতা ও লিঙ্গের মতো আপনার ব্যক্তিগত তথ্য অন্তর্ভুক্ত। আপনি আলো ও অন্ধকার থিমের মধ্যে পরিবর্তন করতে পারবেন এবং প্রয়োজনে আপনার পদক্ষেপ ডেটা রিসেট করতে পারবেন।';

  @override
  String get tips => '🎯 টিপস';

  @override
  String get tipsDesc =>
      '• ব্যাজে ট্যাপ করুন তাদের বিবরণ দেখতে।\n• অর্জন আনলক করলে কনফেটি আপনার অগ্রগতি উদযাপন করে।\n• সামঞ্জস্যপূর্ণ ও অনুপ্রাণিত থাকতে প্রতিদিন স্বাস্থ্য স্ক্রিন ব্যবহার করুন।';

  @override
  String get gotIt => 'বুঝেছি!';

  @override
  String get privacyPolicyTitle => 'গোপনীয়তা নীতি';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited আপনার গোপনীয়তা রক্ষায় প্রতিশ্রুতিবদ্ধ। আমাদের অ্যাপ, Pedometer – Walk & Track, আপনার ব্যক্তিগত ডেটার সাথে আপোষ না করে আপনার দৈনিক কার্যকলাপ পর্যবেক্ষণ করতে সহায়তা করার জন্য ডিজাইন করা হয়েছে। আমরা কোনো ব্যবহারকারীর তথ্য সংগ্রহ, সঞ্চয় বা প্রেরণ করি না—কখনই না।';

  @override
  String get privacyPolicyPara2 =>
      'আমরা আপনার নাম, ইমেল, অবস্থান, পরিচিতি বা অন্য কোনো ব্যক্তিগত পরিচয়কারীতে অ্যাক্সেস অনুরোধ করি না বা করি না। সমস্ত পদক্ষেপ ট্র্যাকিং এবং অগ্রগতির ডেটা আপনার ডিভাইসে স্থানীয়ভাবে প্রক্রিয়া করা হয় এবং কখনই এটি ছেড়ে যায় না। কোনো ক্লাউড সিঙ্ক, বিশ্লেষণ বা তৃতীয় পক্ষের ট্র্যাকিং নেই।';

  @override
  String get privacyPolicyPara3 =>
      'অ্যাপটি শারীরিক কার্যকলাপ সেন্সর অ্যাক্সেস এবং বিজ্ঞপ্তি পাঠানোর অনুমতি চাইতে পারে। এগুলি শুধুমাত্র আপনার পদক্ষেপ গণনা এবং অনুপ্রেরণামূলক বার্তা প্রদানের জন্য ব্যবহার করা হয়। কোনো ডেটা বাহ্যিকভাবে শেয়ার করা হয় না এবং আপনার ডিভাইসের বাইরে কোনো তথ্য সঞ্চয় করা হয় না।';

  @override
  String get privacyPolicyPara4 =>
      'আমরা এমন তৃতীয় পক্ষের পরিষেবা, SDK বা API ব্যবহার করি না যা ব্যবহারকারীর ডেটা সংগ্রহ করে। Pedometer – Walk & Track-এর সাথে আপনার অভিজ্ঞতা সম্পূর্ণ ব্যক্তিগত এবং স্বনির্ভর।';

  @override
  String get privacyPolicyPara5 =>
      'আমাদের অ্যাপ সমস্ত বয়সের গোষ্ঠীর জন্য উপযুক্ত এবং সচেতনভাবে শিশুদের কাছ থেকে কোনো ডেটা সংগ্রহ করে না। যেহেতু আমরা কোনো তথ্য সংগ্রহ করি না, তাই অপব্যবহার বা অননুমোদিত অ্যাক্সেসের কোনো ঝুঁকি নেই।';

  @override
  String get privacyPolicyPara6 =>
      'যদি আমরা অ্যাপে এমন পরিবর্তন করি যা এটির কাজ করার বা আপনার ডিভাইসের সাথে ইন্টারঅ্যাক্ট করার উপায়কে প্রভাবিত করে, আমরা সেই পরিবর্তনগুলি প্রতিফলিত করতে এই গোপনীয়তা নীতিও আপডেট করব। আমরা প্রতিটি পদক্ষেপে আপনাকে অবহিত এবং সুরক্ষিত রাখতে প্রতিশ্রুতিবদ্ধ।';

  @override
  String get privacyPolicyContact =>
      'কোনো প্রশ্ন বা সহায়তার জন্য, আপনি আমাদের সাথে যোগাযোগ করতে পারেন:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'এই অ্যাপ কি আমার পদক্ষেপ গণনা করে?';

  @override
  String get faq1Answer =>
      'হ্যাঁ, Pedometer Walk & Track সারা দিন আপনার পদক্ষেপ সঠিকভাবে গণনা করে। এটি আপনার কার্যকলাপের সম্পূর্ণ দৃশ্য দিতে দূরত্ব, পোড়া ক্যালোরি এবং সক্রিয় সময়ও ট্র্যাক করে।';

  @override
  String get faq2Question => 'অ্যাপে কি ওজন হ্রাসের ব্যায়াম আছে?';

  @override
  String get faq2Answer =>
      'হ্যাঁ, অ্যাপে সহজ ওজন হ্রাস এবং ফিটনেস ব্যায়াম অন্তর্ভুক্ত। আপনি স্বাস্থ্য স্ক্রিনের নীচে সেগুলি খুঁজে পেতে পারেন, আপনার দৈনিক ব্যায়াম রুটিন সমর্থন করার জন্য ডিজাইন করা হয়েছে।';

  @override
  String get faq3Question => 'অ্যাপ কি আমার পদক্ষেপের মাসিক রেকর্ড রাখে?';

  @override
  String get faq3Answer =>
      'হ্যাঁ, অ্যাপ আপনার দৈনিক, সাপ্তাহিক এবং মাসিক পদক্ষেপের রেকর্ড সঞ্চয় করে। এটি আপনাকে সময়ের সাথে আপনার অগ্রগতি পর্যালোচনা করতে এবং আপনার ফিটনেস লক্ষ্য অর্জনের জন্য অনুপ্রাণিত থাকতে দেয়।';

  @override
  String get faq4Question => 'আপনি কি আমার ব্যক্তিগত ডেটা সংরক্ষণ করেন?';

  @override
  String get faq4Answer =>
      'না, আমরা সার্ভারে আপনার কোনো ব্যক্তিগত ডেটা সঞ্চয় করি না। আপনার সমস্ত পদক্ষেপ গণনা, রেকর্ড এবং কার্যকলাপের বিবরণ শুধুমাত্র আপনার ডিভাইসে নিরাপদে সংরক্ষিত হয়। এটি আপনার গোপনীয়তা এবং আপনার তথ্যের সম্পূর্ণ নিয়ন্ত্রণ নিশ্চিত করে।';

  @override
  String get faq5Question => 'অ্যাপ কি কারো সাথে আমার ডেটা শেয়ার করবে?';

  @override
  String get faq5Answer =>
      'না, আপনার ডেটা কখনও কারো সাথে শেয়ার করা হয় না। যেহেতু Pedometer Walk & Track আপনার ব্যক্তিগত ডেটা সংগ্রহ করে না, তাই শেয়ার করার কিছু নেই। আপনি সম্পূর্ণ আস্থা ও মানসিক শান্তির সাথে অ্যাপটি ব্যবহার করতে পারেন।';

  @override
  String get dailyRecords => 'দৈনিক রেকর্ড';

  @override
  String get steps => 'পদক্ষেপ';

  @override
  String get miles => 'মাইল';

  @override
  String get monthlyCalendar => 'মাসিক ক্যালেন্ডার';
}
