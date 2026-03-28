// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTagline => 'VOTRE\nPARTENAIRE\nSANTÉ';

  @override
  String get appSubtitle => 'Simple, relaxant, sain';

  @override
  String get onboardingPage1Title => 'Chaque Pas Compte';

  @override
  String get onboardingPage1Subtitle =>
      'Suivez vos mouvements quotidiens en temps réel.';

  @override
  String get onboardingPage2Title => 'Visualisez vos Progrès';

  @override
  String get onboardingPage2Subtitle =>
      'Voyez votre constance en un coup d\'œil.';

  @override
  String get onboardingPage3Title => 'Votre Hub Fitness';

  @override
  String get onboardingPage3Subtitle =>
      'Tout ce dont vous avez besoin pour rester en forme.';

  @override
  String get onboardingPage4Title => 'Définissez votre Objectif';

  @override
  String get onboardingPage4Subtitle =>
      'Personnalisez votre objectif quotidien.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get nextStep => 'Étape Suivante';

  @override
  String get startJourney => 'Démarrer le Voyage  →';

  @override
  String get skip => 'Passer';

  @override
  String get october => 'Octobre';

  @override
  String get daysActive => '22 Jours Actifs';

  @override
  String get stepsToday => 'PAS AUJOURD\'HUI';

  @override
  String get stepsDaily => 'PAS QUOTIDIENS';

  @override
  String get workouts => 'Entraînements';

  @override
  String get heartRate => 'Fréquence Cardiaque';

  @override
  String get metrics => 'Métriques';

  @override
  String get reports => 'Rapports';

  @override
  String get permissionsRequired => 'Autorisations Requises';

  @override
  String get permissionsDialogContent =>
      'Pour suivre vos pas et envoyer des notifications motivantes, veuillez autoriser les permissions d\'Activité et de Notification.';

  @override
  String get notNow => 'Pas Maintenant';

  @override
  String get allow => 'Autoriser';

  @override
  String get permissionsNotGranted =>
      'Autorisations non accordées. Certaines fonctionnalités peuvent ne pas fonctionner.';

  @override
  String get permissions => 'Autorisations';

  @override
  String get setDailyStepGoal => 'Définir l\'Objectif Quotidien de Pas';

  @override
  String get failedToLoadData => 'Échec du chargement des données';

  @override
  String get retry => 'Réessayer';

  @override
  String get achievementProgress => 'Progression des Réalisations';

  @override
  String get bmiNotSet => 'IMC : Non défini';

  @override
  String get setHeightWeight => 'Définir la taille et le poids dans le profil';

  @override
  String get dailyReminder => 'Rappel Quotidien';

  @override
  String get dailyReminderSubtitle =>
      'Recevez une citation motivante chaque matin à 9h';

  @override
  String get resetTodaysSteps => 'Réinitialiser les Pas d\'Aujourd\'hui';

  @override
  String get resetAllData => 'Réinitialiser Toutes les Données';

  @override
  String get fitnessSection => 'Section Fitness';

  @override
  String get absTitle => 'Abdominaux';

  @override
  String get absSubtitle => 'Seulement Quatre Mouvements pour les Abdos';

  @override
  String get loseWeight => 'Perdre du Poids';

  @override
  String get loseWeightSubtitle => 'Brûler les graisses plus efficacement';

  @override
  String get reduceStress => 'Réduire le Stress';

  @override
  String get reduceStressSubtitle => 'Esprit clair, relaxation et méditation';

  @override
  String get morningWarmup => 'Échauffement du Matin';

  @override
  String get morningWarmupSubtitle =>
      'Profitez de l\'air frais et de la Vitamine D';

  @override
  String get todaysTotalSteps => 'Total des Pas d\'Aujourd\'hui';

  @override
  String get mile => 'Mile';

  @override
  String get kcal => 'Kcal';

  @override
  String get time => 'Temps';

  @override
  String get daysStreak => 'Jours Consécutifs';

  @override
  String goalSteps(int goal) {
    return 'Objectif : $goal pas';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining pas restants';
  }

  @override
  String get achievements => 'Réalisations';

  @override
  String get thisMonth => 'Ce Mois';

  @override
  String get totalSteps => 'Total des Pas';

  @override
  String get monthlyProgress => 'Progression Mensuelle';

  @override
  String get editProfile => 'Modifier le Profil';

  @override
  String get theme => 'Thème';

  @override
  String get appLinkCopied => 'Lien de l\'app copié dans le presse-papiers';

  @override
  String get instruction => 'Instruction';

  @override
  String get instructionSubtitle => 'Guide d\'utilisation de l\'app';

  @override
  String get shareApp => 'Partager l\'App';

  @override
  String get shareAppSubtitle => 'Partagez notre App avec des Amis';

  @override
  String get faqs => 'FAQ';

  @override
  String get faqsSubtitle => 'Questions Fréquemment Posées';

  @override
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get privacyPolicySubtitle => 'Politique de Confidentialité de l\'App';

  @override
  String get nameLabel => 'Nom';

  @override
  String get ageLabel => 'Âge';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get profileUpdated => 'Profil Mis à Jour';

  @override
  String get profileSavedMessage =>
      'Votre profil a été enregistré avec succès.';

  @override
  String get invalidInput => 'Entrée Invalide';

  @override
  String get invalidInputMessage => 'Veuillez entrer un nom et un âge valides.';

  @override
  String get loading => 'Chargement...';

  @override
  String get notSet => 'Non défini';

  @override
  String ageDisplay(int age) {
    return 'Âge : $age';
  }

  @override
  String get selectYourGender => 'Votre Genre';

  @override
  String get genderHint =>
      'Nous en avons besoin pour mesurer la longueur de votre foulée et la dépense calorique.';

  @override
  String get male => 'Masculin';

  @override
  String get female => 'Féminin';

  @override
  String get next => 'SUIVANT';

  @override
  String get selectPrefix => 'Sélectionner';

  @override
  String get moreAboutYouPrefix => 'Plus';

  @override
  String get moreAboutYouSuffix => 'Sur Vous';

  @override
  String get heightWeightHint =>
      'Pour garantir la précision, veuillez saisir votre taille et votre poids corrects. Nous ne partageons jamais ces données.';

  @override
  String get height => 'Taille';

  @override
  String get weight => 'Poids';

  @override
  String get selectHeightCm => 'Sélectionner la Taille (cm)';

  @override
  String get selectWeightKg => 'Sélectionner le Poids (kg)';

  @override
  String get start => 'DÉMARRER';

  @override
  String get absWorkouts => 'Entraînements Abdominaux';

  @override
  String get beginner => 'Débutant';

  @override
  String get intermediate => 'Intermédiaire';

  @override
  String get advanced => 'Avancé';

  @override
  String get advance => 'Avancer';

  @override
  String get duration15mins => '15 min';

  @override
  String get duration30mins => '30 min';

  @override
  String get duration40plusMins => '40+ min';

  @override
  String get introduction => 'Introduction';

  @override
  String get level => 'Niveau';

  @override
  String get duration => 'Durée';

  @override
  String get absBeginnerIntro =>
      'Cet entraînement abdominal pour débutants est conçu pour activer votre sangle abdominale, améliorer la stabilité et renforcer les bases. Parfait pour lancer votre parcours fitness.';

  @override
  String get burnt45kcal => 'Brûlé ~45 kcal';

  @override
  String get time10to15min => 'Durée : 10–15 min';

  @override
  String get absIntermediateIntro =>
      'Cet entraînement abdominal intermédiaire renforce la sangle abdominale avec des maintiens plus longs, plus de répétitions et des mouvements dynamiques. Idéal pour progresser au-delà des bases.';

  @override
  String get burnt85to100kcal => 'Brûlé ~85-100 kcal';

  @override
  String get time20to30min => 'Durée : 20–30 min';

  @override
  String get absAdvancedIntro =>
      'Cet entraînement abdominal avancé cible les muscles profonds du tronc avec des mouvements à haute répétition, des maintiens statiques et des transitions dynamiques. Parfait pour développer la définition, la force et l\'endurance.';

  @override
  String get burnt130to160kcal => 'Brûlé ~130-160 kcal';

  @override
  String get time40plusMin => 'Durée : 40+ min';

  @override
  String get loseWeightBeginnerIntro =>
      'Cet entraînement brûle-graisses pour débutants est conçu pour élever votre fréquence cardiaque, stimuler le métabolisme et lancer votre parcours de perte de poids. Aucun équipement nécessaire.';

  @override
  String get burnt60kcal => 'Brûlé ~60 kcal';

  @override
  String get time12to18min => 'Durée : 12–18 min';

  @override
  String get loseWeightIntermediateIntro =>
      'Cet entraînement brûle-graisses intermédiaire intensifie chaque mouvement pour défier votre endurance et accélérer la perte de graisse. Aucun équipement nécessaire—juste de la détermination.';

  @override
  String get burnt90to100kcal => 'Brûlé ~90-100 kcal';

  @override
  String get time25to30min => 'Durée : 25–30 min';

  @override
  String get loseWeightAdvancedIntro =>
      'Cet entraînement brûle-graisses avancé est conçu pour défier votre endurance, votre force et votre coordination. Attendez-vous à des répétitions élevées, des mouvements explosifs et une vraie transpiration.';

  @override
  String get burnt140to160kcal => 'Brûlé ~140-160 kcal';

  @override
  String get reduceStressIntro =>
      'Dans cet entraînement pour réduire le stress, vous pratiquerez le Yoga, irez à la marche matinale et suivrez un régime alimentaire sain. Le Yoga apaise votre esprit et votre corps, la marche rafraîchit et améliore l\'humeur, et une alimentation équilibrée vous garde léger, sain et sans stress.';

  @override
  String get burnt70kcal => 'Brûlé ~70 kcal';

  @override
  String get morningWarmupIntro =>
      'Cet échauffement matinal comprend la marche, les jumping jacks, les pompes et les étirements des épaules pour améliorer la circulation, soulager les raideurs et vous dynamiser pour la journée.';

  @override
  String get burnt60to80kcal => 'Brûlé ~60–80 kcal';

  @override
  String get time10to15minWarmup => 'Durée : 10–15 min';

  @override
  String get achievementsTitle => 'Réalisations';

  @override
  String get unlocked => 'Débloqué';

  @override
  String get locked => 'Verrouillé';

  @override
  String unlockedBadge(String title) {
    return 'Débloqué : $title';
  }

  @override
  String levelLabel(int level) {
    return 'Niveau $level';
  }

  @override
  String get trophiesCollected => 'Trophées Collectés';

  @override
  String get noTrophiesYet =>
      'Aucun trophée collecté pour l\'instant. Marchez 10 000 pas en une journée pour en gagner un !';

  @override
  String get appGuide => 'Guide de l\'App';

  @override
  String get dailyWeeklyTracking => '🏃 Suivi Quotidien et Hebdomadaire';

  @override
  String get dailyWeeklyTrackingDesc =>
      'Sur le premier écran principal, vous verrez votre nombre de pas quotidien en direct en haut. En dessous, un graphique à barres hebdomadaire montre votre progression pour chaque jour de la semaine.';

  @override
  String get monthlyReportAchievements => '📊 Rapport Mensuel et Réalisations';

  @override
  String get monthlyReportDesc =>
      'Le deuxième écran vous donne un bilan mensuel complet de vos pas. Vous pouvez voir le record de chaque jour et voir votre distance totale, vos calories et votre durée. Les réalisations sont également affichées ici, avec la progression vers le déblocage des badges.';

  @override
  String get healthFitness => '💪 Santé et Fitness';

  @override
  String get healthFitnessDesc =>
      'Sur le troisième écran, vous pouvez définir votre objectif quotidien de pas et suivre votre IMC. Vous trouverez également des routines fitness comme :\n• Entraînements abdominaux\n• Exercices de perte de poids\n• Réduction du stress\n• Échauffements matinaux\n\nChaque section comprend la durée estimée et les calories brûlées.';

  @override
  String get settingsProfile => '⚙️ Paramètres et Profil';

  @override
  String get settingsProfileDesc =>
      'Le quatrième écran comprend vos informations personnelles comme la taille et le genre. Vous pouvez basculer entre les thèmes clair et sombre, et réinitialiser vos données de pas si nécessaire.';

  @override
  String get tips => '🎯 Conseils';

  @override
  String get tipsDesc =>
      '• Appuyez sur les badges pour voir leurs descriptions.\n• Les confettis célèbrent votre progression lorsque vous déverrouillez des réalisations.\n• Utilisez l\'écran de santé quotidiennement pour rester constant et motivé.';

  @override
  String get gotIt => 'Compris !';

  @override
  String get privacyPolicyTitle => 'Politique de Confidentialité';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited s\'engage à protéger votre vie privée. Notre app, Pedometer – Walk & Track, est conçue pour vous aider à surveiller votre activité quotidienne sans compromettre vos données personnelles. Nous ne collectons, ne stockons ni ne transmettons aucune information utilisateur—point.';

  @override
  String get privacyPolicyPara2 =>
      'Nous ne demandons pas ni n\'accédons à votre nom, e-mail, localisation, contacts ou tout autre identifiant personnel. Toutes les données de suivi des pas et de progression sont traitées localement sur votre appareil et ne le quittent jamais. Il n\'y a pas de synchronisation cloud, pas d\'analyses et pas de suivi par des tiers.';

  @override
  String get privacyPolicyPara3 =>
      'L\'app peut demander la permission d\'accéder aux capteurs d\'activité physique et d\'envoyer des notifications. Ceux-ci sont utilisés uniquement pour compter vos pas et envoyer des messages motivants. Aucune donnée n\'est partagée en externe, et aucune information n\'est stockée au-delà de votre appareil.';

  @override
  String get privacyPolicyPara4 =>
      'Nous n\'utilisons pas de services tiers, de SDK ou d\'API qui collectent des données utilisateurs. Votre expérience avec Pedometer – Walk & Track est entièrement privée et autonome.';

  @override
  String get privacyPolicyPara5 =>
      'Notre app est adaptée à tous les groupes d\'âge et ne collecte pas sciemment de données auprès des enfants. Puisque nous ne collectons aucune information, il n\'y a aucun risque d\'abus ou d\'accès non autorisé.';

  @override
  String get privacyPolicyPara6 =>
      'Si nous apportons des modifications à l\'app qui affectent son fonctionnement ou son interaction avec votre appareil, nous mettrons également à jour cette Politique de Confidentialité pour refléter ces changements. Nous nous engageons à vous tenir informé et protégé à chaque étape.';

  @override
  String get privacyPolicyContact =>
      'Pour toute question ou support, vous pouvez nous contacter à :';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'Cette app compte-t-elle mes pas ?';

  @override
  String get faq1Answer =>
      'Oui, Pedometer Walk & Track compte avec précision vos pas tout au long de la journée. Il suit également la distance, les calories brûlées et le temps actif pour vous donner une vue complète de votre activité.';

  @override
  String get faq2Question =>
      'L\'app propose-t-elle des exercices de perte de poids ?';

  @override
  String get faq2Answer =>
      'Oui, l\'app comprend des exercices simples de perte de poids et de fitness. Vous pouvez les trouver en bas de l\'écran Santé, conçus pour soutenir votre routine d\'entraînement quotidienne.';

  @override
  String get faq3Question =>
      'L\'app conserve-t-elle des enregistrements mensuels de mes pas ?';

  @override
  String get faq3Answer =>
      'Oui, l\'app stocke vos enregistrements quotidiens, hebdomadaires et mensuels de pas. Cela vous permet de revoir vos progrès au fil du temps et de rester motivé pour atteindre vos objectifs fitness.';

  @override
  String get faq4Question => 'Stockez-vous mes données personnelles ?';

  @override
  String get faq4Answer =>
      'Non, nous ne stockons aucune de vos données personnelles sur des serveurs. Tous vos comptes de pas, enregistrements et détails d\'activité sont sauvegardés en toute sécurité uniquement sur votre appareil. Cela garantit votre confidentialité et un contrôle total sur vos informations.';

  @override
  String get faq5Question =>
      'L\'app partagera-t-elle mes données avec quelqu\'un ?';

  @override
  String get faq5Answer =>
      'Non, vos données ne sont jamais partagées avec personne. Puisque Pedometer Walk & Track ne collecte pas vos données personnelles, il n\'y a rien à partager. Vous pouvez utiliser l\'app en toute confiance et tranquillité d\'esprit.';

  @override
  String get dailyRecords => 'Enregistrements Quotidiens';

  @override
  String get steps => 'Pas';

  @override
  String get miles => 'Miles';

  @override
  String get monthlyCalendar => 'Calendrier Mensuel';
}
