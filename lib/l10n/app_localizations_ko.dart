// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTagline => '당신의\n건강\n파트너';

  @override
  String get appSubtitle => '간단하고, 편안하고, 건강하게';

  @override
  String get onboardingPage1Title => '모든 걸음이 중요합니다';

  @override
  String get onboardingPage1Subtitle => '매일의 움직임을 실시간으로 추적하세요.';

  @override
  String get onboardingPage2Title => '진행 상황 시각화';

  @override
  String get onboardingPage2Subtitle => '한눈에 일관성을 확인하세요.';

  @override
  String get onboardingPage3Title => '당신의 피트니스 허브';

  @override
  String get onboardingPage3Subtitle => '건강을 유지하는 데 필요한 모든 것.';

  @override
  String get onboardingPage4Title => '목표를 설정하세요';

  @override
  String get onboardingPage4Subtitle => '일일 목표를 맞춤 설정하세요.';

  @override
  String get getStarted => '시작하기';

  @override
  String get nextStep => '다음 단계';

  @override
  String get startJourney => '여행 시작  →';

  @override
  String get skip => '건너뛰기';

  @override
  String get october => '10월';

  @override
  String get daysActive => '22일 활성';

  @override
  String get stepsToday => '오늘의 걸음수';

  @override
  String get stepsDaily => '일일 걸음수';

  @override
  String get workouts => '운동';

  @override
  String get heartRate => '심박수';

  @override
  String get metrics => '지표';

  @override
  String get reports => '보고서';

  @override
  String get permissionsRequired => '권한 필요';

  @override
  String get permissionsDialogContent =>
      '걸음수를 추적하고 동기 부여 알림을 보내려면 활동 및 알림 권한을 허용해 주세요.';

  @override
  String get notNow => '나중에';

  @override
  String get allow => '허용';

  @override
  String get permissionsNotGranted => '권한이 부여되지 않았습니다. 일부 기능이 작동하지 않을 수 있습니다.';

  @override
  String get permissions => '권한';

  @override
  String get setDailyStepGoal => '일일 걸음 목표 설정';

  @override
  String get failedToLoadData => '데이터 로드 실패';

  @override
  String get retry => '다시 시도';

  @override
  String get achievementProgress => '성취 진행도';

  @override
  String get bmiNotSet => 'BMI: 설정 안 됨';

  @override
  String get setHeightWeight => '프로필에서 키와 몸무게 설정';

  @override
  String get dailyReminder => '일일 알림';

  @override
  String get dailyReminderSubtitle => '매일 아침 9시에 동기 부여 인용문 받기';

  @override
  String get resetTodaysSteps => '오늘의 걸음수 초기화';

  @override
  String get resetAllData => '모든 데이터 초기화';

  @override
  String get fitnessSection => '피트니스 섹션';

  @override
  String get absTitle => '복근 운동';

  @override
  String get absSubtitle => '복근을 위한 단 네 가지 동작';

  @override
  String get loseWeight => '체중 감량';

  @override
  String get loseWeightSubtitle => '지방을 더 효과적으로 연소';

  @override
  String get reduceStress => '스트레스 해소';

  @override
  String get reduceStressSubtitle => '맑은 정신, 휴식과 명상';

  @override
  String get morningWarmup => '아침 워밍업';

  @override
  String get morningWarmupSubtitle => '신선한 공기와 비타민 D 섭취';

  @override
  String get todaysTotalSteps => '오늘 총 걸음수';

  @override
  String get mile => '마일';

  @override
  String get kcal => '칼로리';

  @override
  String get time => '시간';

  @override
  String get daysStreak => '연속 일수';

  @override
  String goalSteps(int goal) {
    return '목표: $goal걸음';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining걸음 남음';
  }

  @override
  String get achievements => '성취';

  @override
  String get thisMonth => '이번 달';

  @override
  String get totalSteps => '총 걸음수';

  @override
  String get monthlyProgress => '월간 진행도';

  @override
  String get editProfile => '프로필 편집';

  @override
  String get theme => '테마';

  @override
  String get appLinkCopied => '앱 링크가 클립보드에 복사되었습니다';

  @override
  String get instruction => '사용 방법';

  @override
  String get instructionSubtitle => '앱 사용 안내';

  @override
  String get shareApp => '앱 공유';

  @override
  String get shareAppSubtitle => '친구들과 앱을 공유하세요';

  @override
  String get faqs => '자주 묻는 질문';

  @override
  String get faqsSubtitle => '자주 묻는 질문';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get privacyPolicySubtitle => '앱 개인정보 처리방침';

  @override
  String get nameLabel => '이름';

  @override
  String get ageLabel => '나이';

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get profileUpdated => '프로필 업데이트됨';

  @override
  String get profileSavedMessage => '프로필이 성공적으로 저장되었습니다.';

  @override
  String get invalidInput => '잘못된 입력';

  @override
  String get invalidInputMessage => '유효한 이름과 나이를 입력하세요.';

  @override
  String get loading => '로딩 중...';

  @override
  String get notSet => '설정 안 됨';

  @override
  String ageDisplay(int age) {
    return '나이: $age';
  }

  @override
  String get selectYourGender => '성별';

  @override
  String get genderHint => '보폭 길이와 칼로리 소모를 측정하기 위해 필요합니다.';

  @override
  String get male => '남성';

  @override
  String get female => '여성';

  @override
  String get next => '다음';

  @override
  String get selectPrefix => '선택';

  @override
  String get moreAboutYouPrefix => '더';

  @override
  String get moreAboutYouSuffix => '나에 대해';

  @override
  String get heightWeightHint =>
      '정확성을 위해 올바른 키와 몸무게를 입력해 주세요. 이 데이터는 절대 공유하지 않습니다.';

  @override
  String get height => '키';

  @override
  String get weight => '몸무게';

  @override
  String get selectHeightCm => '키 선택 (cm)';

  @override
  String get selectWeightKg => '몸무게 선택 (kg)';

  @override
  String get start => '시작';

  @override
  String get absWorkouts => '복근 운동';

  @override
  String get beginner => '초급';

  @override
  String get intermediate => '중급';

  @override
  String get advanced => '고급';

  @override
  String get advance => '진행';

  @override
  String get duration15mins => '15분';

  @override
  String get duration30mins => '30분';

  @override
  String get duration40plusMins => '40분 이상';

  @override
  String get introduction => '소개';

  @override
  String get level => '레벨';

  @override
  String get duration => '시간';

  @override
  String get absBeginnerIntro =>
      '이 초급 복근 운동은 핵심 근육을 활성화하고 안정성을 향상시키며 기초 체력을 키우도록 설계되었습니다. 피트니스 여정을 시작하기에 완벽합니다.';

  @override
  String get burnt45kcal => '소모 칼로리 약 45kcal';

  @override
  String get time10to15min => '시간: 10~15분';

  @override
  String get absIntermediateIntro =>
      '이 중급 복근 운동은 더 긴 유지, 높은 반복 횟수, 역동적인 동작으로 코어 근력을 키웁니다. 기초를 넘어 발전하기에 이상적입니다.';

  @override
  String get burnt85to100kcal => '소모 칼로리 약 85~100kcal';

  @override
  String get time20to30min => '시간: 20~30분';

  @override
  String get absAdvancedIntro =>
      '이 고급 복근 운동은 높은 반복 동작, 정적 유지, 역동적인 전환으로 깊은 코어 근육을 타겟합니다. 정의, 근력, 지구력 향상에 완벽합니다.';

  @override
  String get burnt130to160kcal => '소모 칼로리 약 130~160kcal';

  @override
  String get time40plusMin => '시간: 40분 이상';

  @override
  String get loseWeightBeginnerIntro =>
      '이 초급 지방 연소 운동은 심박수를 높이고, 신진대사를 촉진하며, 체중 감량 여정을 시작하도록 설계되었습니다. 장비가 필요 없습니다.';

  @override
  String get burnt60kcal => '소모 칼로리 약 60kcal';

  @override
  String get time12to18min => '시간: 12~18분';

  @override
  String get loseWeightIntermediateIntro =>
      '이 중급 지방 연소 운동은 지구력에 도전하고 지방 감소를 가속화하기 위해 각 동작을 강화합니다. 장비 불필요—필요한 것은 의지뿐.';

  @override
  String get burnt90to100kcal => '소모 칼로리 약 90~100kcal';

  @override
  String get time25to30min => '시간: 25~30분';

  @override
  String get loseWeightAdvancedIntro =>
      '이 고급 지방 연소 운동은 지구력, 근력, 협응력에 도전하도록 제작되었습니다. 높은 반복, 폭발적인 동작, 진지한 땀을 기대하세요.';

  @override
  String get burnt140to160kcal => '소모 칼로리 약 140~160kcal';

  @override
  String get reduceStressIntro =>
      '이 스트레스 해소 운동에서는 요가를 연습하고, 아침 산책을 하며, 깨끗한 식단을 따릅니다. 요가는 마음과 몸을 진정시키고, 걷기는 기분을 상쾌하게 하며, 균형 잡힌 식단은 가볍고 건강하며 스트레스 없는 상태를 유지시켜 줍니다.';

  @override
  String get burnt70kcal => '소모 칼로리 약 70kcal';

  @override
  String get morningWarmupIntro =>
      '이 아침 워밍업에는 혈액 순환 개선, 뻣뻣함 해소, 하루를 위한 에너지 충전을 위한 걷기, 점핑잭, 푸쉬업, 어깨 스트레칭이 포함됩니다.';

  @override
  String get burnt60to80kcal => '소모 칼로리 약 60~80kcal';

  @override
  String get time10to15minWarmup => '시간: 10~15분';

  @override
  String get achievementsTitle => '성취';

  @override
  String get unlocked => '달성';

  @override
  String get locked => '잠금';

  @override
  String unlockedBadge(String title) {
    return '달성: $title';
  }

  @override
  String levelLabel(int level) {
    return '레벨 $level';
  }

  @override
  String get trophiesCollected => '수집된 트로피';

  @override
  String get noTrophiesYet => '아직 트로피가 없습니다. 하루에 10,000걸음을 걸어서 하나를 획득하세요!';

  @override
  String get appGuide => '앱 가이드';

  @override
  String get dailyWeeklyTracking => '🏃 일일 및 주간 추적';

  @override
  String get dailyWeeklyTrackingDesc =>
      '첫 번째 메인 화면에서는 상단에 실시간으로 일일 걸음수를 볼 수 있습니다. 아래에는 주간 막대 차트가 한 주의 각 날에 대한 진행 상황을 보여줍니다.';

  @override
  String get monthlyReportAchievements => '📊 월간 보고서 및 성취';

  @override
  String get monthlyReportDesc =>
      '두 번째 화면은 걸음수의 완전한 월간 분석을 제공합니다. 각 날의 기록을 보고 총 거리, 칼로리, 지속 시간을 확인할 수 있습니다. 성취도 여기에 표시되며, 배지 잠금 해제를 향한 진행 상황도 볼 수 있습니다.';

  @override
  String get healthFitness => '💪 건강 및 피트니스';

  @override
  String get healthFitnessDesc =>
      '세 번째 화면에서 일일 걸음 목표를 설정하고 BMI를 추적할 수 있습니다. 다음과 같은 피트니스 루틴도 찾을 수 있습니다:\n• 복근 운동\n• 체중 감량 운동\n• 스트레스 해소\n• 아침 워밍업\n\n각 섹션에는 예상 지속 시간과 소모 칼로리가 포함됩니다.';

  @override
  String get settingsProfile => '⚙️ 설정 및 프로필';

  @override
  String get settingsProfileDesc =>
      '네 번째 화면에는 키와 성별 같은 개인 정보가 포함됩니다. 라이트와 다크 테마 사이를 전환하고, 필요한 경우 걸음수 데이터를 초기화할 수 있습니다.';

  @override
  String get tips => '🎯 팁';

  @override
  String get tipsDesc =>
      '• 배지를 탭하여 설명을 확인하세요.\n• 성취를 달성하면 색종이가 진행 상황을 축하합니다.\n• 일관성을 유지하고 동기 부여를 받으려면 건강 화면을 매일 사용하세요.';

  @override
  String get gotIt => '알겠습니다!';

  @override
  String get privacyPolicyTitle => '개인정보 처리방침';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited는 귀하의 개인정보 보호에 최선을 다하고 있습니다. 당사 앱 Pedometer – Walk & Track은 개인 데이터를 손상시키지 않으면서 일상 활동을 모니터링하는 데 도움을 드리도록 설계되었습니다. 어떠한 사용자 정보도 수집, 저장 또는 전송하지 않습니다.';

  @override
  String get privacyPolicyPara2 =>
      '귀하의 이름, 이메일, 위치, 연락처 또는 기타 개인 식별자에 대한 액세스를 요청하거나 접근하지 않습니다. 모든 걸음수 추적 및 진행 데이터는 기기에서 로컬로 처리되며 절대 외부로 나가지 않습니다. 클라우드 동기화, 분석, 제3자 추적은 없습니다.';

  @override
  String get privacyPolicyPara3 =>
      '앱은 신체 활동 센서 액세스 및 알림 전송 권한을 요청할 수 있습니다. 이는 오직 걸음수 계산과 동기 부여 메시지 전달에만 사용됩니다. 데이터는 외부에 공유되지 않으며, 기기 외부에 정보가 저장되지 않습니다.';

  @override
  String get privacyPolicyPara4 =>
      '사용자 데이터를 수집하는 제3자 서비스, SDK 또는 API를 사용하지 않습니다. Pedometer – Walk & Track과의 경험은 완전히 비공개이며 자급자족합니다.';

  @override
  String get privacyPolicyPara5 =>
      '당사 앱은 모든 연령대에 적합하며 아동의 데이터를 의도적으로 수집하지 않습니다. 어떠한 정보도 수집하지 않으므로 남용이나 무단 접근의 위험이 없습니다.';

  @override
  String get privacyPolicyPara6 =>
      '앱의 작동 방식이나 기기와의 상호작용에 영향을 미치는 변경 사항이 생기면, 이 개인정보 처리방침도 변경 사항을 반영하여 업데이트합니다. 모든 단계에서 귀하에게 정보를 제공하고 보호하기 위해 최선을 다하겠습니다.';

  @override
  String get privacyPolicyContact => '문의 사항이나 지원이 필요하시면 다음으로 연락해 주세요:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => '이 앱이 내 걸음수를 세나요?';

  @override
  String get faq1Answer =>
      '네, Pedometer Walk & Track은 하루 종일 정확하게 걸음수를 셉니다. 활동의 완전한 보기를 제공하기 위해 거리, 소모 칼로리, 활동 시간도 추적합니다.';

  @override
  String get faq2Question => '앱에 체중 감량 운동이 있나요?';

  @override
  String get faq2Answer =>
      '네, 앱에는 간단한 체중 감량 및 피트니스 운동이 포함되어 있습니다. 건강 화면 하단에서 찾을 수 있으며, 일일 운동 루틴을 지원하도록 설계되었습니다.';

  @override
  String get faq3Question => '앱이 걸음수의 월간 기록을 보관하나요?';

  @override
  String get faq3Answer =>
      '네, 앱은 일일, 주간, 월간 걸음수 기록을 저장합니다. 이를 통해 시간이 지남에 따라 진행 상황을 검토하고 피트니스 목표를 달성하기 위한 동기 부여를 유지할 수 있습니다.';

  @override
  String get faq4Question => '개인 데이터를 저장하나요?';

  @override
  String get faq4Answer =>
      '아니요, 서버에 개인 데이터를 저장하지 않습니다. 모든 걸음수, 기록, 활동 세부 정보는 기기에만 안전하게 저장됩니다. 이를 통해 개인정보와 정보에 대한 완전한 통제가 보장됩니다.';

  @override
  String get faq5Question => '앱이 내 데이터를 누군가와 공유하나요?';

  @override
  String get faq5Answer =>
      '아니요, 귀하의 데이터는 절대 누구와도 공유되지 않습니다. Pedometer Walk & Track은 개인 데이터를 수집하지 않기 때문에 공유할 것이 없습니다. 완전한 신뢰와 안심으로 앱을 사용할 수 있습니다.';

  @override
  String get dailyRecords => '일일 기록';

  @override
  String get steps => '걸음';

  @override
  String get miles => '마일';

  @override
  String get monthlyCalendar => '월간 캘린더';
}
