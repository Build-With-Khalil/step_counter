// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTagline => 'ВАШ\nПАРТНЁР\nПО ЗДОРОВЬЮ';

  @override
  String get appSubtitle => 'Просто, расслабленно, здорово';

  @override
  String get onboardingPage1Title => 'Каждый Шаг Важен';

  @override
  String get onboardingPage1Subtitle =>
      'Отслеживайте ежедневное движение в реальном времени.';

  @override
  String get onboardingPage2Title => 'Визуализируйте Прогресс';

  @override
  String get onboardingPage2Subtitle =>
      'Смотрите на постоянство с первого взгляда.';

  @override
  String get onboardingPage3Title => 'Ваш Фитнес-Хаб';

  @override
  String get onboardingPage3Subtitle => 'Всё, что нужно для поддержания формы.';

  @override
  String get onboardingPage4Title => 'Установите Цель';

  @override
  String get onboardingPage4Subtitle => 'Настройте ежедневный ориентир.';

  @override
  String get getStarted => 'Начать';

  @override
  String get nextStep => 'Следующий Шаг';

  @override
  String get startJourney => 'Начать Путешествие  →';

  @override
  String get skip => 'Пропустить';

  @override
  String get october => 'Октябрь';

  @override
  String get daysActive => '22 Активных Дня';

  @override
  String get stepsToday => 'ШАГОВ СЕГОДНЯ';

  @override
  String get stepsDaily => 'ЕЖЕДНЕВНЫЕ ШАГИ';

  @override
  String get workouts => 'Тренировки';

  @override
  String get heartRate => 'Пульс';

  @override
  String get metrics => 'Метрики';

  @override
  String get reports => 'Отчёты';

  @override
  String get permissionsRequired => 'Необходимы Разрешения';

  @override
  String get permissionsDialogContent =>
      'Для отслеживания шагов и отправки мотивационных уведомлений разрешите доступ к активности и уведомлениям.';

  @override
  String get notNow => 'Не Сейчас';

  @override
  String get allow => 'Разрешить';

  @override
  String get permissionsNotGranted =>
      'Разрешения не предоставлены. Некоторые функции могут не работать.';

  @override
  String get permissions => 'Разрешения';

  @override
  String get setDailyStepGoal => 'Установить Ежедневную Цель по Шагам';

  @override
  String get failedToLoadData => 'Не удалось загрузить данные';

  @override
  String get retry => 'Повторить';

  @override
  String get achievementProgress => 'Прогресс Достижений';

  @override
  String get bmiNotSet => 'ИМТ: Не задан';

  @override
  String get setHeightWeight => 'Укажите рост и вес в профиле';

  @override
  String get dailyReminder => 'Ежедневное Напоминание';

  @override
  String get dailyReminderSubtitle =>
      'Получайте мотивирующую цитату каждое утро в 9:00';

  @override
  String get resetTodaysSteps => 'Сбросить Шаги за Сегодня';

  @override
  String get resetAllData => 'Сбросить Все Данные';

  @override
  String get fitnessSection => 'Раздел Фитнес';

  @override
  String get absTitle => 'Пресс';

  @override
  String get absSubtitle => 'Всего Четыре Упражнения для Пресса';

  @override
  String get loseWeight => 'Сбросить Вес';

  @override
  String get loseWeightSubtitle => 'Сжигайте жир более эффективно';

  @override
  String get reduceStress => 'Снять Стресс';

  @override
  String get reduceStressSubtitle => 'Ясный ум, расслабление и медитация';

  @override
  String get morningWarmup => 'Утренняя Разминка';

  @override
  String get morningWarmupSubtitle => 'Свежий воздух и витамин D';

  @override
  String get todaysTotalSteps => 'Всего Шагов Сегодня';

  @override
  String get mile => 'Миля';

  @override
  String get kcal => 'ккал';

  @override
  String get time => 'Время';

  @override
  String get daysStreak => 'Дней Подряд';

  @override
  String goalSteps(int goal) {
    return 'Цель: $goal шагов';
  }

  @override
  String stepsLeft(int remaining) {
    return 'Осталось $remaining шагов';
  }

  @override
  String get achievements => 'Достижения';

  @override
  String get thisMonth => 'В Этом Месяце';

  @override
  String get totalSteps => 'Всего Шагов';

  @override
  String get monthlyProgress => 'Ежемесячный Прогресс';

  @override
  String get editProfile => 'Редактировать Профиль';

  @override
  String get theme => 'Тема';

  @override
  String get appLinkCopied => 'Ссылка на приложение скопирована в буфер обмена';

  @override
  String get instruction => 'Инструкция';

  @override
  String get instructionSubtitle => 'Руководство по использованию приложения';

  @override
  String get shareApp => 'Поделиться Приложением';

  @override
  String get shareAppSubtitle => 'Поделитесь Нашим Приложением с Друзьями';

  @override
  String get faqs => 'Частые Вопросы';

  @override
  String get faqsSubtitle => 'Часто Задаваемые Вопросы';

  @override
  String get privacyPolicy => 'Политика Конфиденциальности';

  @override
  String get privacyPolicySubtitle => 'Политика Конфиденциальности Приложения';

  @override
  String get nameLabel => 'Имя';

  @override
  String get ageLabel => 'Возраст';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get profileUpdated => 'Профиль Обновлён';

  @override
  String get profileSavedMessage => 'Ваш профиль успешно сохранён.';

  @override
  String get invalidInput => 'Неверный Ввод';

  @override
  String get invalidInputMessage => 'Введите действительное имя и возраст.';

  @override
  String get loading => 'Загрузка...';

  @override
  String get notSet => 'Не задано';

  @override
  String ageDisplay(int age) {
    return 'Возраст: $age';
  }

  @override
  String get selectYourGender => 'Ваш Пол';

  @override
  String get genderHint =>
      'Нам это нужно для измерения длины шага и расхода калорий.';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get next => 'ДАЛЕЕ';

  @override
  String get selectPrefix => 'Выбрать';

  @override
  String get moreAboutYouPrefix => 'Больше';

  @override
  String get moreAboutYouSuffix => 'О Вас';

  @override
  String get heightWeightHint =>
      'Для точности введите правильный рост и вес. Мы никогда не передаём эти данные.';

  @override
  String get height => 'Рост';

  @override
  String get weight => 'Вес';

  @override
  String get selectHeightCm => 'Выбрать Рост (см)';

  @override
  String get selectWeightKg => 'Выбрать Вес (кг)';

  @override
  String get start => 'СТАРТ';

  @override
  String get absWorkouts => 'Тренировки для Пресса';

  @override
  String get beginner => 'Начинающий';

  @override
  String get intermediate => 'Средний';

  @override
  String get advanced => 'Продвинутый';

  @override
  String get advance => 'Продвинуться';

  @override
  String get duration15mins => '15 мин';

  @override
  String get duration30mins => '30 мин';

  @override
  String get duration40plusMins => '40+ мин';

  @override
  String get introduction => 'Введение';

  @override
  String get level => 'Уровень';

  @override
  String get duration => 'Продолжительность';

  @override
  String get absBeginnerIntro =>
      'Эта тренировка для начинающих предназначена для активации мышц кора, улучшения стабильности и построения базовой силы. Идеально для начала фитнес-пути.';

  @override
  String get burnt45kcal => 'Сожжено ~45 ккал';

  @override
  String get time10to15min => 'Время: 10–15 мин';

  @override
  String get absIntermediateIntro =>
      'Эта тренировка для пресса среднего уровня строит силу кора с более долгими удержаниями, большим количеством повторений и динамичными движениями. Идеально для выхода за пределы базового уровня.';

  @override
  String get burnt85to100kcal => 'Сожжено ~85-100 ккал';

  @override
  String get time20to30min => 'Время: 20–30 мин';

  @override
  String get absAdvancedIntro =>
      'Эта продвинутая тренировка для пресса нацелена на глубокие мышцы кора с многократными повторениями, статическими удержаниями и динамичными переходами. Идеально для построения рельефа, силы и выносливости.';

  @override
  String get burnt130to160kcal => 'Сожжено ~130-160 ккал';

  @override
  String get time40plusMin => 'Время: 40+ мин';

  @override
  String get loseWeightBeginnerIntro =>
      'Эта тренировка для сжигания жира для начинающих предназначена для повышения частоты сердечных сокращений, ускорения метаболизма и запуска пути к похудению. Никакого оборудования не нужно.';

  @override
  String get burnt60kcal => 'Сожжено ~60 ккал';

  @override
  String get time12to18min => 'Время: 12–18 мин';

  @override
  String get loseWeightIntermediateIntro =>
      'Эта тренировка для сжигания жира среднего уровня усиливает каждое движение, чтобы испытать выносливость и ускорить потерю жира. Оборудование не нужно — только решимость.';

  @override
  String get burnt90to100kcal => 'Сожжено ~90-100 ккал';

  @override
  String get time25to30min => 'Время: 25–30 мин';

  @override
  String get loseWeightAdvancedIntro =>
      'Эта продвинутая тренировка для сжигания жира создана для испытания вашей выносливости, силы и координации. Ожидайте множество повторений, взрывные движения и настоящий пот.';

  @override
  String get burnt140to160kcal => 'Сожжено ~140-160 ккал';

  @override
  String get reduceStressIntro =>
      'В этой тренировке по снятию стресса вы будете практиковать йогу, ходить на утренние прогулки и соблюдать здоровое питание. Йога успокаивает ум и тело, ходьба освежает и поднимает настроение, а сбалансированное питание поддерживает лёгкость, здоровье и отсутствие стресса.';

  @override
  String get burnt70kcal => 'Сожжено ~70 ккал';

  @override
  String get morningWarmupIntro =>
      'Эта утренняя разминка включает ходьбу, прыжки, отжимания и растяжку плеч для улучшения кровообращения, снятия скованности и заряда энергии на день.';

  @override
  String get burnt60to80kcal => 'Сожжено ~60–80 ккал';

  @override
  String get time10to15minWarmup => 'Время: 10–15 мин';

  @override
  String get achievementsTitle => 'Достижения';

  @override
  String get unlocked => 'Открыто';

  @override
  String get locked => 'Заблокировано';

  @override
  String unlockedBadge(String title) {
    return 'Открыто: $title';
  }

  @override
  String levelLabel(int level) {
    return 'Уровень $level';
  }

  @override
  String get trophiesCollected => 'Собранные Кубки';

  @override
  String get noTrophiesYet =>
      'Кубков ещё нет. Пройдите 10 000 шагов за день, чтобы заработать один!';

  @override
  String get appGuide => 'Руководство Приложения';

  @override
  String get dailyWeeklyTracking => '🏃 Ежедневное и Еженедельное Отслеживание';

  @override
  String get dailyWeeklyTrackingDesc =>
      'На первом главном экране вы увидите количество шагов за день в режиме реального времени вверху. Ниже недельная столбчатая диаграмма показывает прогресс за каждый день недели.';

  @override
  String get monthlyReportAchievements => '📊 Ежемесячный Отчёт и Достижения';

  @override
  String get monthlyReportDesc =>
      'Второй экран даёт полную ежемесячную разбивку шагов. Вы можете просмотреть запись каждого дня и увидеть общее расстояние, калории и продолжительность. Достижения тоже показаны здесь, с прогрессом к разблокировке значков.';

  @override
  String get healthFitness => '💪 Здоровье и Фитнес';

  @override
  String get healthFitnessDesc =>
      'На третьем экране вы можете установить ежедневную цель по шагам и отслеживать ИМТ. Также найдёте фитнес-программы:\n• Тренировки для пресса\n• Упражнения для похудения\n• Снятие стресса\n• Утренние разминки\n\nКаждый раздел включает ориентировочную продолжительность и сожжённые калории.';

  @override
  String get settingsProfile => '⚙️ Настройки и Профиль';

  @override
  String get settingsProfileDesc =>
      'Четвёртый экран содержит личную информацию, такую как рост и пол. Вы можете переключаться между светлой и тёмной темой и при необходимости сбрасывать данные шагов.';

  @override
  String get tips => '🎯 Советы';

  @override
  String get tipsDesc =>
      '• Нажмите на значки, чтобы увидеть их описания.\n• Конфетти отмечает ваш прогресс при разблокировке достижений.\n• Используйте экран здоровья ежедневно, чтобы оставаться последовательным и мотивированным.';

  @override
  String get gotIt => 'Понятно!';

  @override
  String get privacyPolicyTitle => 'Политика Конфиденциальности';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited стремится защищать вашу конфиденциальность. Наше приложение Pedometer – Walk & Track предназначено для мониторинга ежедневной активности без ущерба для личных данных. Мы не собираем, не храним и не передаём никакую информацию о пользователях — никогда.';

  @override
  String get privacyPolicyPara2 =>
      'Мы не запрашиваем доступ к вашему имени, электронной почте, местоположению, контактам или другим личным идентификаторам. Все данные отслеживания шагов и прогресса обрабатываются локально на вашем устройстве и никогда не покидают его. Нет синхронизации с облаком, аналитики и отслеживания третьими сторонами.';

  @override
  String get privacyPolicyPara3 =>
      'Приложение может запросить разрешение на доступ к датчикам физической активности и отправку уведомлений. Это используется исключительно для подсчёта шагов и доставки мотивационных сообщений. Данные не передаются внешним получателям, и никакая информация не хранится за пределами устройства.';

  @override
  String get privacyPolicyPara4 =>
      'Мы не используем сторонние службы, SDK или API, которые собирают данные пользователей. Ваш опыт работы с Pedometer – Walk & Track полностью конфиденциален и самодостаточен.';

  @override
  String get privacyPolicyPara5 =>
      'Наше приложение подходит для всех возрастных групп и намеренно не собирает данные детей. Поскольку мы не собираем никакой информации, нет риска злоупотребления или несанкционированного доступа.';

  @override
  String get privacyPolicyPara6 =>
      'Если мы вносим изменения в приложение, влияющие на его работу или взаимодействие с вашим устройством, мы также обновим данную Политику конфиденциальности. Мы обязуемся держать вас в курсе и защищать на каждом шагу.';

  @override
  String get privacyPolicyContact =>
      'По любым вопросам или для поддержки свяжитесь с нами:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'Это приложение считает мои шаги?';

  @override
  String get faq1Answer =>
      'Да, Pedometer Walk & Track точно считает шаги в течение всего дня. Он также отслеживает расстояние, сожжённые калории и активное время, чтобы дать вам полное представление об активности.';

  @override
  String get faq2Question => 'Есть ли в приложении упражнения для похудения?';

  @override
  String get faq2Answer =>
      'Да, приложение включает простые упражнения для похудения и фитнеса. Их можно найти внизу экрана «Здоровье», разработанные для поддержки ежедневной тренировочной рутины.';

  @override
  String get faq3Question => 'Хранит ли приложение ежемесячные записи шагов?';

  @override
  String get faq3Answer =>
      'Да, приложение хранит ежедневные, еженедельные и ежемесячные записи шагов. Это позволяет просматривать прогресс со временем и оставаться мотивированным для достижения фитнес-целей.';

  @override
  String get faq4Question => 'Вы храните мои личные данные?';

  @override
  String get faq4Answer =>
      'Нет, мы не храним личные данные на серверах. Все счётчики шагов, записи и детали активности надёжно сохраняются только на вашем устройстве. Это обеспечивает конфиденциальность и полный контроль над информацией.';

  @override
  String get faq5Question =>
      'Будет ли приложение делиться моими данными с кем-либо?';

  @override
  String get faq5Answer =>
      'Нет, ваши данные никогда не передаются никому. Поскольку Pedometer Walk & Track не собирает личные данные, делиться нечем. Вы можете использовать приложение с полной уверенностью и спокойствием.';

  @override
  String get dailyRecords => 'Ежедневные Записи';

  @override
  String get steps => 'Шаги';

  @override
  String get miles => 'Мили';

  @override
  String get monthlyCalendar => 'Месячный Календарь';
}
