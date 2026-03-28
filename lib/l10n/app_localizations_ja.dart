// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTagline => 'あなたの\n健康\nパートナー';

  @override
  String get appSubtitle => 'シンプル、リラックス、健康的';

  @override
  String get onboardingPage1Title => 'すべての歩みが大切';

  @override
  String get onboardingPage1Subtitle => '毎日の動きをリアルタイムで追跡。';

  @override
  String get onboardingPage2Title => '進歩を見える化';

  @override
  String get onboardingPage2Subtitle => '一目で継続性を確認。';

  @override
  String get onboardingPage3Title => 'あなたのフィットネスハブ';

  @override
  String get onboardingPage3Subtitle => '健康を維持するために必要なすべて。';

  @override
  String get onboardingPage4Title => '目標を設定しよう';

  @override
  String get onboardingPage4Subtitle => '毎日のターゲットをカスタマイズ。';

  @override
  String get getStarted => '始める';

  @override
  String get nextStep => '次のステップ';

  @override
  String get startJourney => '旅を始める  →';

  @override
  String get skip => 'スキップ';

  @override
  String get october => '10月';

  @override
  String get daysActive => '22日間アクティブ';

  @override
  String get stepsToday => '今日の歩数';

  @override
  String get stepsDaily => '毎日の歩数';

  @override
  String get workouts => 'ワークアウト';

  @override
  String get heartRate => '心拍数';

  @override
  String get metrics => '指標';

  @override
  String get reports => 'レポート';

  @override
  String get permissionsRequired => '権限が必要です';

  @override
  String get permissionsDialogContent =>
      '歩数を追跡してモチベーション通知を送信するには、アクティビティと通知の権限を許可してください。';

  @override
  String get notNow => '後で';

  @override
  String get allow => '許可する';

  @override
  String get permissionsNotGranted => '権限が付与されていません。一部の機能が動作しない場合があります。';

  @override
  String get permissions => '権限';

  @override
  String get setDailyStepGoal => '1日の歩数目標を設定';

  @override
  String get failedToLoadData => 'データの読み込みに失敗しました';

  @override
  String get retry => '再試行';

  @override
  String get achievementProgress => '達成進捗';

  @override
  String get bmiNotSet => 'BMI：未設定';

  @override
  String get setHeightWeight => 'プロフィールで身長と体重を設定';

  @override
  String get dailyReminder => '毎日のリマインダー';

  @override
  String get dailyReminderSubtitle => '毎朝9時にモチベーションの言葉を受け取る';

  @override
  String get resetTodaysSteps => '今日の歩数をリセット';

  @override
  String get resetAllData => 'すべてのデータをリセット';

  @override
  String get fitnessSection => 'フィットネスセクション';

  @override
  String get absTitle => '腹筋トレーニング';

  @override
  String get absSubtitle => '腹筋のための4つの動き';

  @override
  String get loseWeight => '体重を減らす';

  @override
  String get loseWeightSubtitle => 'より効果的に脂肪を燃焼';

  @override
  String get reduceStress => 'ストレス解消';

  @override
  String get reduceStressSubtitle => '心を澄ませ、リラックスと瞑想';

  @override
  String get morningWarmup => '朝のウォームアップ';

  @override
  String get morningWarmupSubtitle => '新鮮な空気とビタミンDを摂取';

  @override
  String get todaysTotalSteps => '今日の総歩数';

  @override
  String get mile => 'マイル';

  @override
  String get kcal => 'kcal';

  @override
  String get time => '時間';

  @override
  String get daysStreak => '連続日数';

  @override
  String goalSteps(int goal) {
    return '目標：$goal歩';
  }

  @override
  String stepsLeft(int remaining) {
    return '残り$remaining歩';
  }

  @override
  String get achievements => '達成';

  @override
  String get thisMonth => '今月';

  @override
  String get totalSteps => '総歩数';

  @override
  String get monthlyProgress => '月間進捗';

  @override
  String get editProfile => 'プロフィールを編集';

  @override
  String get theme => 'テーマ';

  @override
  String get appLinkCopied => 'アプリのリンクをクリップボードにコピーしました';

  @override
  String get instruction => '使い方';

  @override
  String get instructionSubtitle => 'アプリの使用ガイド';

  @override
  String get shareApp => 'アプリをシェア';

  @override
  String get shareAppSubtitle => '友達にアプリをシェアしよう';

  @override
  String get faqs => 'よくある質問';

  @override
  String get faqsSubtitle => 'よくある質問と回答';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacyPolicySubtitle => 'アプリのプライバシーポリシー';

  @override
  String get nameLabel => '名前';

  @override
  String get ageLabel => '年齢';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get profileUpdated => 'プロフィールが更新されました';

  @override
  String get profileSavedMessage => 'プロフィールが正常に保存されました。';

  @override
  String get invalidInput => '無効な入力';

  @override
  String get invalidInputMessage => '有効な名前と年齢を入力してください。';

  @override
  String get loading => '読み込み中...';

  @override
  String get notSet => '未設定';

  @override
  String ageDisplay(int age) {
    return '年齢：$age';
  }

  @override
  String get selectYourGender => 'あなたの性別';

  @override
  String get genderHint => '歩幅とカロリー消費量を計算するために必要です。';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get next => '次へ';

  @override
  String get selectPrefix => '選択';

  @override
  String get moreAboutYouPrefix => 'あなたの';

  @override
  String get moreAboutYouSuffix => '詳細情報';

  @override
  String get heightWeightHint =>
      '正確さを確保するため、正しい身長と体重を入力してください。このデータは決して共有しません。';

  @override
  String get height => '身長';

  @override
  String get weight => '体重';

  @override
  String get selectHeightCm => '身長を選択（cm）';

  @override
  String get selectWeightKg => '体重を選択（kg）';

  @override
  String get start => 'スタート';

  @override
  String get absWorkouts => '腹筋ワークアウト';

  @override
  String get beginner => '初心者';

  @override
  String get intermediate => '中級者';

  @override
  String get advanced => '上級者';

  @override
  String get advance => '進む';

  @override
  String get duration15mins => '15分';

  @override
  String get duration30mins => '30分';

  @override
  String get duration40plusMins => '40分以上';

  @override
  String get introduction => 'はじめに';

  @override
  String get level => 'レベル';

  @override
  String get duration => '時間';

  @override
  String get absBeginnerIntro =>
      'この初心者向け腹筋ワークアウトは、体幹を活性化し、安定性を高め、基礎的な筋力を構築するよう設計されています。フィットネスの旅を始めるのに最適です。';

  @override
  String get burnt45kcal => '消費カロリー約45kcal';

  @override
  String get time10to15min => '時間：10〜15分';

  @override
  String get absIntermediateIntro =>
      'この中級腹筋ワークアウトは、より長いホールド、高い反復回数、ダイナミックな動きで体幹の強さを高めます。基礎を超えて進歩するのに理想的。';

  @override
  String get burnt85to100kcal => '消費カロリー約85〜100kcal';

  @override
  String get time20to30min => '時間：20〜30分';

  @override
  String get absAdvancedIntro =>
      'この上級腹筋ワークアウトは、高反復の動き、スタティックホールド、ダイナミックなトランジションで深部の体幹筋を鍛えます。定義、強さ、持久力の構築に最適です。';

  @override
  String get burnt130to160kcal => '消費カロリー約130〜160kcal';

  @override
  String get time40plusMin => '時間：40分以上';

  @override
  String get loseWeightBeginnerIntro =>
      'この初心者向け脂肪燃焼ワークアウトは、心拍数を上げ、代謝を促進し、体重減少の旅をスタートさせるよう設計されています。器具不要。';

  @override
  String get burnt60kcal => '消費カロリー約60kcal';

  @override
  String get time12to18min => '時間：12〜18分';

  @override
  String get loseWeightIntermediateIntro =>
      'この中級脂肪燃焼ワークアウトは、スタミナに挑戦し脂肪燃焼を加速させるため、各動きを強化します。器具不要—必要なのはコミットメントのみ。';

  @override
  String get burnt90to100kcal => '消費カロリー約90〜100kcal';

  @override
  String get time25to30min => '時間：25〜30分';

  @override
  String get loseWeightAdvancedIntro =>
      'この上級脂肪燃焼ワークアウトは、持久力、強さ、協調性に挑戦するために作られています。高反復、爆発的な動き、本格的な汗が期待できます。';

  @override
  String get burnt140to160kcal => '消費カロリー約140〜160kcal';

  @override
  String get reduceStressIntro =>
      'このストレス解消ワークアウトでは、ヨガを練習し、朝の散歩をし、クリーンな食事を実践します。ヨガは心と体を落ち着かせ、歩くことで気分が爽快になり、バランスの取れた食事で軽く、健康的で、ストレスフリーな状態を保ちます。';

  @override
  String get burnt70kcal => '消費カロリー約70kcal';

  @override
  String get morningWarmupIntro =>
      'この朝のウォームアップには、血行促進、こわばりの解消、一日のエネルギー補給のためのウォーキング、ジャンピングジャック、腕立て伏せ、肩のストレッチが含まれます。';

  @override
  String get burnt60to80kcal => '消費カロリー約60〜80kcal';

  @override
  String get time10to15minWarmup => '時間：10〜15分';

  @override
  String get achievementsTitle => '達成';

  @override
  String get unlocked => '解除済み';

  @override
  String get locked => 'ロック中';

  @override
  String unlockedBadge(String title) {
    return '解除：$title';
  }

  @override
  String levelLabel(int level) {
    return 'レベル$level';
  }

  @override
  String get trophiesCollected => '獲得したトロフィー';

  @override
  String get noTrophiesYet => 'まだトロフィーはありません。1日1万歩歩いて獲得しよう！';

  @override
  String get appGuide => 'アプリガイド';

  @override
  String get dailyWeeklyTracking => '🏃 毎日・毎週の追跡';

  @override
  String get dailyWeeklyTrackingDesc =>
      '最初のメイン画面では、上部にリアルタイムで毎日の歩数が表示されます。その下に、週間棒グラフで週の各日の進捗が確認できます。';

  @override
  String get monthlyReportAchievements => '📊 月次レポートと達成';

  @override
  String get monthlyReportDesc =>
      '2番目の画面では、歩数の完全な月次内訳が確認できます。各日の記録を表示し、総距離、カロリー、時間を確認できます。バッジのロック解除に向けた進捗とともに、達成もここに表示されます。';

  @override
  String get healthFitness => '💪 健康とフィットネス';

  @override
  String get healthFitnessDesc =>
      '3番目の画面では、毎日の歩数目標を設定し、BMIを追跡できます。以下のようなフィットネスルーティンも見つかります：\n• 腹筋ワークアウト\n• 体重減少エクササイズ\n• ストレス解消\n• 朝のウォームアップ\n\n各セクションには推定時間と消費カロリーが含まれています。';

  @override
  String get settingsProfile => '⚙️ 設定とプロフィール';

  @override
  String get settingsProfileDesc =>
      '4番目の画面には、身長や性別などの個人情報が含まれています。ライトとダークテーマを切り替えたり、必要に応じて歩数データをリセットできます。';

  @override
  String get tips => '🎯 ヒント';

  @override
  String get tipsDesc =>
      '• バッジをタップして説明を確認。\n• 達成をアンロックするとコンフェッティが進捗を祝います。\n• 毎日健康画面を使って、一貫性を保ち、モチベーションを維持しましょう。';

  @override
  String get gotIt => 'わかった！';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions（Private）Limitedはお客様のプライバシー保護に取り組んでいます。当社のアプリPedometer – Walk & Trackは、個人データを損なうことなく日常の活動を監視するお手伝いをするよう設計されています。ユーザー情報の収集、保存、送信は一切行いません。';

  @override
  String get privacyPolicyPara2 =>
      'お客様の名前、メール、位置情報、連絡先、その他の個人識別子へのアクセスを要求または取得することはありません。すべての歩数追跡と進捗データはデバイス上でローカルに処理され、決して外部に出ません。クラウド同期、分析、サードパーティの追跡は一切ありません。';

  @override
  String get privacyPolicyPara3 =>
      'アプリは身体活動センサーへのアクセスと通知送信の許可を求める場合があります。これらは歩数のカウントとモチベーションメッセージの配信のみに使用されます。データが外部で共有されることはなく、デバイスを超えた情報の保存もありません。';

  @override
  String get privacyPolicyPara4 =>
      'ユーザーデータを収集するサードパーティのサービス、SDK、APIは使用していません。Pedometer – Walk & Trackとのご利用体験は完全にプライベートで自己完結しています。';

  @override
  String get privacyPolicyPara5 =>
      '当社のアプリはすべての年齢層に適しており、児童からのデータを意図的に収集することはありません。情報を収集しないため、不正使用や不正アクセスのリスクはありません。';

  @override
  String get privacyPolicyPara6 =>
      'アプリの動作やデバイスとの相互作用に影響する変更を行う場合、これらの変更を反映するためにプライバシーポリシーも更新します。お客様を常に情報提供し、保護することをお約束します。';

  @override
  String get privacyPolicyContact => 'ご質問やサポートは以下までお問い合わせください：';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'このアプリは歩数を数えますか？';

  @override
  String get faq1Answer =>
      'はい、Pedometer Walk & Trackは一日中正確に歩数を数えます。また、距離、消費カロリー、活動時間も追跡し、活動の完全なビューを提供します。';

  @override
  String get faq2Question => 'アプリに体重減少エクササイズはありますか？';

  @override
  String get faq2Answer =>
      'はい、アプリには簡単な体重減少とフィットネスエクササイズが含まれています。健康画面の下部で見つけることができ、毎日のワークアウトルーティンをサポートするよう設計されています。';

  @override
  String get faq3Question => 'アプリは歩数の月次記録を保持していますか？';

  @override
  String get faq3Answer =>
      'はい、アプリは毎日、毎週、毎月の歩数記録を保存します。これにより、時間をかけて進捗を確認し、フィットネス目標を達成するためにモチベーションを維持できます。';

  @override
  String get faq4Question => '個人データを保存していますか？';

  @override
  String get faq4Answer =>
      'いいえ、サーバーに個人データを保存することはありません。すべての歩数、記録、活動詳細はデバイス上のみに安全に保存されます。これにより、プライバシーと情報の完全な管理が確保されます。';

  @override
  String get faq5Question => 'アプリは誰かとデータを共有しますか？';

  @override
  String get faq5Answer =>
      'いいえ、データは決して誰とも共有されません。Pedometer Walk & Trackは個人データを収集しないため、共有するものがありません。完全な信頼と安心感でアプリを利用できます。';

  @override
  String get dailyRecords => '毎日の記録';

  @override
  String get steps => '歩数';

  @override
  String get miles => 'マイル';

  @override
  String get monthlyCalendar => '月間カレンダー';
}
