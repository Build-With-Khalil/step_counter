// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTagline => '您的\n健康\n伙伴';

  @override
  String get appSubtitle => '简单、放松、健康';

  @override
  String get onboardingPage1Title => '每步都重要';

  @override
  String get onboardingPage1Subtitle => '实时追踪您的日常运动。';

  @override
  String get onboardingPage2Title => '可视化进度';

  @override
  String get onboardingPage2Subtitle => '一目了然地查看您的坚持情况。';

  @override
  String get onboardingPage3Title => '您的健身中心';

  @override
  String get onboardingPage3Subtitle => '保持健康所需的一切。';

  @override
  String get onboardingPage4Title => '设置您的目标';

  @override
  String get onboardingPage4Subtitle => '自定义您的每日目标。';

  @override
  String get getStarted => '开始';

  @override
  String get nextStep => '下一步';

  @override
  String get startJourney => '开始旅程  →';

  @override
  String get skip => '跳过';

  @override
  String get october => '十月';

  @override
  String get daysActive => '22天活跃';

  @override
  String get stepsToday => '今日步数';

  @override
  String get stepsDaily => '每日步数';

  @override
  String get workouts => '锻炼';

  @override
  String get heartRate => '心率';

  @override
  String get metrics => '指标';

  @override
  String get reports => '报告';

  @override
  String get permissionsRequired => '需要权限';

  @override
  String get permissionsDialogContent => '为了追踪您的步数并发送激励通知，请允许活动和通知权限。';

  @override
  String get notNow => '稍后';

  @override
  String get allow => '允许';

  @override
  String get permissionsNotGranted => '权限未授予，部分功能可能无法使用。';

  @override
  String get permissions => '权限';

  @override
  String get setDailyStepGoal => '设置每日步数目标';

  @override
  String get failedToLoadData => '数据加载失败';

  @override
  String get retry => '重试';

  @override
  String get achievementProgress => '成就进度';

  @override
  String get bmiNotSet => 'BMI：未设置';

  @override
  String get setHeightWeight => '在个人资料中设置身高和体重';

  @override
  String get dailyReminder => '每日提醒';

  @override
  String get dailyReminderSubtitle => '每天早上9点收到一条励志语录';

  @override
  String get resetTodaysSteps => '重置今日步数';

  @override
  String get resetAllData => '重置所有数据';

  @override
  String get fitnessSection => '健身板块';

  @override
  String get absTitle => '腹肌训练';

  @override
  String get absSubtitle => '只需四个腹肌动作';

  @override
  String get loseWeight => '减肥';

  @override
  String get loseWeightSubtitle => '更有效地燃烧脂肪';

  @override
  String get reduceStress => '减压';

  @override
  String get reduceStressSubtitle => '清醒头脑、放松与冥想';

  @override
  String get morningWarmup => '晨间热身';

  @override
  String get morningWarmupSubtitle => '呼吸新鲜空气，补充维生素D';

  @override
  String get todaysTotalSteps => '今日总步数';

  @override
  String get mile => '英里';

  @override
  String get kcal => '千卡';

  @override
  String get time => '时间';

  @override
  String get daysStreak => '连续天数';

  @override
  String goalSteps(int goal) {
    return '目标：$goal步';
  }

  @override
  String stepsLeft(int remaining) {
    return '还剩$remaining步';
  }

  @override
  String get achievements => '成就';

  @override
  String get thisMonth => '本月';

  @override
  String get totalSteps => '总步数';

  @override
  String get monthlyProgress => '月度进度';

  @override
  String get editProfile => '编辑个人资料';

  @override
  String get theme => '主题';

  @override
  String get appLinkCopied => '应用链接已复制到剪贴板';

  @override
  String get instruction => '使用说明';

  @override
  String get instructionSubtitle => '应用使用指南';

  @override
  String get shareApp => '分享应用';

  @override
  String get shareAppSubtitle => '与朋友分享我们的应用';

  @override
  String get faqs => '常见问题';

  @override
  String get faqsSubtitle => '常见问题解答';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacyPolicySubtitle => '应用隐私政策';

  @override
  String get nameLabel => '姓名';

  @override
  String get ageLabel => '年龄';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get profileUpdated => '个人资料已更新';

  @override
  String get profileSavedMessage => '您的个人资料已成功保存。';

  @override
  String get invalidInput => '输入无效';

  @override
  String get invalidInputMessage => '请输入有效的姓名和年龄。';

  @override
  String get loading => '加载中...';

  @override
  String get notSet => '未设置';

  @override
  String ageDisplay(int age) {
    return '年龄：$age';
  }

  @override
  String get selectYourGender => '您的性别';

  @override
  String get genderHint => '我们需要它来测量您的步幅和卡路里消耗。';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get next => '下一步';

  @override
  String get selectPrefix => '选择';

  @override
  String get moreAboutYouPrefix => '更多';

  @override
  String get moreAboutYouSuffix => '关于您';

  @override
  String get heightWeightHint => '为确保准确性，请输入您的正确身高和体重。我们绝不分享此数据。';

  @override
  String get height => '身高';

  @override
  String get weight => '体重';

  @override
  String get selectHeightCm => '选择身高（厘米）';

  @override
  String get selectWeightKg => '选择体重（千克）';

  @override
  String get start => '开始';

  @override
  String get absWorkouts => '腹肌训练';

  @override
  String get beginner => '初级';

  @override
  String get intermediate => '中级';

  @override
  String get advanced => '高级';

  @override
  String get advance => '进阶';

  @override
  String get duration15mins => '15分钟';

  @override
  String get duration30mins => '30分钟';

  @override
  String get duration40plusMins => '40+分钟';

  @override
  String get introduction => '介绍';

  @override
  String get level => '级别';

  @override
  String get duration => '时长';

  @override
  String get absBeginnerIntro =>
      '这个初级腹肌训练旨在激活您的核心肌群、改善稳定性并建立基础力量。是开启您健身之旅的完美选择。';

  @override
  String get burnt45kcal => '消耗约45千卡';

  @override
  String get time10to15min => '时间：10–15分钟';

  @override
  String get absIntermediateIntro =>
      '这个中级腹肌训练通过更长的保持时间、更高的重复次数和动态动作来增强核心力量。是超越基础水平的理想选择。';

  @override
  String get burnt85to100kcal => '消耗约85-100千卡';

  @override
  String get time20to30min => '时间：20–30分钟';

  @override
  String get absAdvancedIntro =>
      '这个高级腹肌训练通过高重复动作、静态保持和动态过渡来针对深层核心肌群。是塑造线条、增强力量和耐力的完美选择。';

  @override
  String get burnt130to160kcal => '消耗约130-160千卡';

  @override
  String get time40plusMin => '时间：40+分钟';

  @override
  String get loseWeightBeginnerIntro =>
      '这个初级燃脂训练旨在提高您的心率、促进新陈代谢并启动您的减重之旅。无需任何器械。';

  @override
  String get burnt60kcal => '消耗约60千卡';

  @override
  String get time12to18min => '时间：12–18分钟';

  @override
  String get loseWeightIntermediateIntro =>
      '这个中级燃脂训练加强每个动作，以挑战您的耐力并加速脂肪燃烧。无需器械——只需坚持。';

  @override
  String get burnt90to100kcal => '消耗约90-100千卡';

  @override
  String get time25to30min => '时间：25–30分钟';

  @override
  String get loseWeightAdvancedIntro =>
      '这个高级燃脂训练旨在挑战您的耐力、力量和协调性。期待高重复次数、爆发性动作和大量出汗。';

  @override
  String get burnt140to160kcal => '消耗约140-160千卡';

  @override
  String get reduceStressIntro =>
      '在这个减压训练中，您将练习瑜伽、进行晨间散步并遵循健康饮食。瑜伽有助于平静您的身心，散步能提神醒脑、改善情绪，而均衡饮食使您保持轻盈、健康和无压力状态。';

  @override
  String get burnt70kcal => '消耗约70千卡';

  @override
  String get morningWarmupIntro =>
      '这个晨间热身包括步行、开合跳、俯卧撑和肩部拉伸，以促进血液循环、缓解僵硬并为您的一天注入活力。';

  @override
  String get burnt60to80kcal => '消耗约60–80千卡';

  @override
  String get time10to15minWarmup => '时间：10–15分钟';

  @override
  String get achievementsTitle => '成就';

  @override
  String get unlocked => '已解锁';

  @override
  String get locked => '已锁定';

  @override
  String unlockedBadge(String title) {
    return '已解锁：$title';
  }

  @override
  String levelLabel(int level) {
    return '第$level级';
  }

  @override
  String get trophiesCollected => '已收集的奖杯';

  @override
  String get noTrophiesYet => '尚未收集任何奖杯。每天走10,000步即可获得一个！';

  @override
  String get appGuide => '应用指南';

  @override
  String get dailyWeeklyTracking => '🏃 每日和每周追踪';

  @override
  String get dailyWeeklyTrackingDesc =>
      '在第一个主屏幕上，您将在顶部实时看到您的每日步数。下方，每周条形图显示一周中每天的进度。';

  @override
  String get monthlyReportAchievements => '📊 月度报告和成就';

  @override
  String get monthlyReportDesc =>
      '第二个屏幕为您提供完整的月度步数明细。您可以查看每天的记录，并查看总距离、卡路里和时长。成就也在这里显示，以及解锁徽章的进度。';

  @override
  String get healthFitness => '💪 健康与健身';

  @override
  String get healthFitnessDesc =>
      '在第三个屏幕上，您可以设置每日步数目标并追踪BMI。您还会找到以下健身计划：\n• 腹肌训练\n• 减重运动\n• 减压训练\n• 晨间热身\n\n每个板块包含预计时长和消耗的卡路里。';

  @override
  String get settingsProfile => '⚙️ 设置和个人资料';

  @override
  String get settingsProfileDesc =>
      '第四个屏幕包含您的个人信息，如身高和性别。您可以在明亮和暗色主题之间切换，并在需要时重置步数数据。';

  @override
  String get tips => '🎯 提示';

  @override
  String get tipsDesc =>
      '• 点击徽章查看其描述。\n• 解锁成就时，彩纸会庆祝您的进步。\n• 每天使用健康屏幕，保持一致和积极的状态。';

  @override
  String get gotIt => '明白了！';

  @override
  String get privacyPolicyTitle => '隐私政策';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions（私人）有限公司致力于保护您的隐私。我们的应用程序Pedometer – Walk & Track旨在帮助您监控日常活动，同时不损害您的个人数据。我们不收集、存储或传输任何用户信息——从不。';

  @override
  String get privacyPolicyPara2 =>
      '我们不请求或访问您的姓名、电子邮件、位置、联系人或任何其他个人标识符。所有步数追踪和进度数据均在您的设备上本地处理，从不离开设备。没有云端同步、没有分析、没有第三方追踪。';

  @override
  String get privacyPolicyPara3 =>
      '应用程序可能会请求访问运动传感器和发送通知的权限。这些仅用于计算您的步数并发送激励信息。不对外分享任何数据，设备之外不存储任何信息。';

  @override
  String get privacyPolicyPara4 =>
      '我们不使用收集用户数据的第三方服务、SDK或API。您使用Pedometer – Walk & Track的体验完全私密且自成一体。';

  @override
  String get privacyPolicyPara5 =>
      '我们的应用适合所有年龄段，不会有意收集儿童的任何数据。由于我们不收集任何信息，因此不存在滥用或未经授权访问的风险。';

  @override
  String get privacyPolicyPara6 =>
      '如果我们对应用程序进行影响其工作方式或与您设备交互方式的更改，我们也会更新本隐私政策以反映这些变化。我们致力于在每一步都让您了解情况并受到保护。';

  @override
  String get privacyPolicyContact => '如有任何问题或需要支持，您可以通过以下方式联系我们：';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => '这款应用会计算我的步数吗？';

  @override
  String get faq1Answer =>
      '是的，Pedometer Walk & Track整天精确计算您的步数。它还追踪距离、消耗的卡路里和活动时间，为您提供完整的活动视图。';

  @override
  String get faq2Question => '应用有减重运动吗？';

  @override
  String get faq2Answer => '是的，应用包含简单的减重和健身运动。您可以在健康屏幕底部找到它们，旨在支持您的日常锻炼计划。';

  @override
  String get faq3Question => '应用会保存我步数的月度记录吗？';

  @override
  String get faq3Answer => '是的，应用存储您的每日、每周和每月步数记录。这让您可以随时回顾进度，保持动力实现健身目标。';

  @override
  String get faq4Question => '你们会存储我的个人数据吗？';

  @override
  String get faq4Answer =>
      '不会，我们不会在服务器上存储您的任何个人数据。您的所有步数、记录和活动详情仅安全保存在您的设备上。这确保了您的隐私和对信息的完全控制。';

  @override
  String get faq5Question => '应用会与任何人分享我的数据吗？';

  @override
  String get faq5Answer =>
      '不会，您的数据永远不会与任何人分享。由于Pedometer Walk & Track不收集您的个人数据，因此没有什么可以分享的。您可以完全放心地使用该应用。';

  @override
  String get dailyRecords => '每日记录';

  @override
  String get steps => '步数';

  @override
  String get miles => '英里';

  @override
  String get monthlyCalendar => '月度日历';
}
