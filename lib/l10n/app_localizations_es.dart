// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTagline => 'TU\nCOMPAÑERO\nDE SALUD';

  @override
  String get appSubtitle => 'Simple, relajante, saludable';

  @override
  String get onboardingPage1Title => 'Cada Paso Cuenta';

  @override
  String get onboardingPage1Subtitle =>
      'Rastrea tu movimiento diario en tiempo real.';

  @override
  String get onboardingPage2Title => 'Visualiza el Progreso';

  @override
  String get onboardingPage2Subtitle => 'Ve tu constancia de un vistazo.';

  @override
  String get onboardingPage3Title => 'Tu Centro de Fitness';

  @override
  String get onboardingPage3Subtitle =>
      'Todo lo que necesitas para mantenerte en forma.';

  @override
  String get onboardingPage4Title => 'Establece tu Meta';

  @override
  String get onboardingPage4Subtitle => 'Personaliza tu objetivo diario.';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get nextStep => 'Siguiente Paso';

  @override
  String get startJourney => 'Iniciar Viaje  →';

  @override
  String get skip => 'Omitir';

  @override
  String get october => 'Octubre';

  @override
  String get daysActive => '22 Días Activo';

  @override
  String get stepsToday => 'PASOS HOY';

  @override
  String get stepsDaily => 'PASOS DIARIOS';

  @override
  String get workouts => 'Entrenamientos';

  @override
  String get heartRate => 'Frecuencia Cardíaca';

  @override
  String get metrics => 'Métricas';

  @override
  String get reports => 'Informes';

  @override
  String get permissionsRequired => 'Permisos Requeridos';

  @override
  String get permissionsDialogContent =>
      'Para rastrear tus pasos y enviar notificaciones motivacionales, por favor permite los permisos de Actividad y Notificación.';

  @override
  String get notNow => 'Ahora No';

  @override
  String get allow => 'Permitir';

  @override
  String get permissionsNotGranted =>
      'Permisos no concedidos. Algunas funciones pueden no funcionar.';

  @override
  String get permissions => 'Permisos';

  @override
  String get setDailyStepGoal => 'Establecer Meta Diaria de Pasos';

  @override
  String get failedToLoadData => 'Error al cargar los datos';

  @override
  String get retry => 'Reintentar';

  @override
  String get achievementProgress => 'Progreso de Logros';

  @override
  String get bmiNotSet => 'IMC: No establecido';

  @override
  String get setHeightWeight => 'Establecer altura y peso en el perfil';

  @override
  String get dailyReminder => 'Recordatorio Diario';

  @override
  String get dailyReminderSubtitle =>
      'Recibe una cita motivacional cada mañana a las 9 AM';

  @override
  String get resetTodaysSteps => 'Restablecer los Pasos de Hoy';

  @override
  String get resetAllData => 'Restablecer Todos los Datos';

  @override
  String get fitnessSection => 'Sección de Fitness';

  @override
  String get absTitle => 'Abdominales';

  @override
  String get absSubtitle => 'Solo Cuatro Movimientos para Abdominales';

  @override
  String get loseWeight => 'Perder Peso';

  @override
  String get loseWeightSubtitle => 'Quema grasa más efectivamente';

  @override
  String get reduceStress => 'Reducir el Estrés';

  @override
  String get reduceStressSubtitle => 'Mente clara, relájate y medita';

  @override
  String get morningWarmup => 'Calentamiento Matutino';

  @override
  String get morningWarmupSubtitle => 'Obtén algo de aire fresco y Vitamina D';

  @override
  String get todaysTotalSteps => 'Total de Pasos de Hoy';

  @override
  String get mile => 'Milla';

  @override
  String get kcal => 'Kcal';

  @override
  String get time => 'Tiempo';

  @override
  String get daysStreak => 'Días Consecutivos';

  @override
  String goalSteps(int goal) {
    return 'Meta: $goal pasos';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining pasos restantes';
  }

  @override
  String get achievements => 'Logros';

  @override
  String get thisMonth => 'Este Mes';

  @override
  String get totalSteps => 'Total de Pasos';

  @override
  String get monthlyProgress => 'Progreso Mensual';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get theme => 'Tema';

  @override
  String get appLinkCopied => 'Enlace de la app copiado al portapapeles';

  @override
  String get instruction => 'Instrucción';

  @override
  String get instructionSubtitle => 'Guía para usar la app';

  @override
  String get shareApp => 'Compartir App';

  @override
  String get shareAppSubtitle => 'Comparte nuestra app con amigos';

  @override
  String get faqs => 'Preguntas Frecuentes';

  @override
  String get faqsSubtitle => 'Preguntas Frecuentes';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get privacyPolicySubtitle => 'Política de Privacidad de la App';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get ageLabel => 'Edad';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get profileUpdated => 'Perfil Actualizado';

  @override
  String get profileSavedMessage => 'Tu perfil ha sido guardado exitosamente.';

  @override
  String get invalidInput => 'Entrada Inválida';

  @override
  String get invalidInputMessage =>
      'Por favor ingresa un nombre y edad válidos.';

  @override
  String get loading => 'Cargando...';

  @override
  String get notSet => 'No establecido';

  @override
  String ageDisplay(int age) {
    return 'Edad: $age';
  }

  @override
  String get selectYourGender => 'Tu Género';

  @override
  String get genderHint =>
      'Lo necesitamos para medir la longitud de tu zancada y el gasto calórico.';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get next => 'SIGUIENTE';

  @override
  String get selectPrefix => 'Seleccionar';

  @override
  String get moreAboutYouPrefix => 'Más';

  @override
  String get moreAboutYouSuffix => 'Sobre Ti';

  @override
  String get heightWeightHint =>
      'Para garantizar la precisión, por favor ingresa tu altura y peso correctos. Nunca compartimos estos datos.';

  @override
  String get height => 'Altura';

  @override
  String get weight => 'Peso';

  @override
  String get selectHeightCm => 'Seleccionar Altura (cm)';

  @override
  String get selectWeightKg => 'Seleccionar Peso (kg)';

  @override
  String get start => 'INICIAR';

  @override
  String get absWorkouts => 'Entrenamientos Abdominales';

  @override
  String get beginner => 'Principiante';

  @override
  String get intermediate => 'Intermedio';

  @override
  String get advanced => 'Avanzado';

  @override
  String get advance => 'Avanzar';

  @override
  String get duration15mins => '15 min';

  @override
  String get duration30mins => '30 min';

  @override
  String get duration40plusMins => '40+ min';

  @override
  String get introduction => 'Introducción';

  @override
  String get level => 'Nivel';

  @override
  String get duration => 'Duración';

  @override
  String get absBeginnerIntro =>
      'Este entrenamiento abdominal para principiantes está diseñado para activar tu núcleo, mejorar la estabilidad y construir fuerza fundamental. Perfecto para comenzar tu viaje de fitness.';

  @override
  String get burnt45kcal => 'Quemado ~45 kcal';

  @override
  String get time10to15min => 'Tiempo: 10–15 min';

  @override
  String get absIntermediateIntro =>
      'Este entrenamiento abdominal intermedio desarrolla fuerza del core con retenciones más largas, más repeticiones y movimientos dinámicos. Ideal para progresar más allá de lo básico.';

  @override
  String get burnt85to100kcal => 'Quemado ~85-100 kcal';

  @override
  String get time20to30min => 'Tiempo: 20–30 min';

  @override
  String get absAdvancedIntro =>
      'Este entrenamiento abdominal avanzado trabaja los músculos del núcleo profundo con movimientos de alta repetición, retenciones estáticas y transiciones dinámicas. Perfecto para desarrollar definición, fuerza y resistencia.';

  @override
  String get burnt130to160kcal => 'Quemado ~130-160 kcal';

  @override
  String get time40plusMin => 'Tiempo: 40+ min';

  @override
  String get loseWeightBeginnerIntro =>
      'Este entrenamiento quema-grasa para principiantes está diseñado para elevar tu frecuencia cardíaca, impulsar el metabolismo y arrancar tu viaje de pérdida de peso. No se necesita equipo.';

  @override
  String get burnt60kcal => 'Quemado ~60 kcal';

  @override
  String get time12to18min => 'Tiempo: 12–18 min';

  @override
  String get loseWeightIntermediateIntro =>
      'Este entrenamiento quema-grasa intermedio intensifica cada movimiento para desafiar tu resistencia y acelerar la pérdida de grasa. No se necesita equipo—solo compromiso.';

  @override
  String get burnt90to100kcal => 'Quemado ~90-100 kcal';

  @override
  String get time25to30min => 'Tiempo: 25–30 min';

  @override
  String get loseWeightAdvancedIntro =>
      'Este entrenamiento quema-grasa avanzado está construido para desafiar tu resistencia, fuerza y coordinación. Espera altas repeticiones, movimientos explosivos y sudor de verdad.';

  @override
  String get burnt140to160kcal => 'Quemado ~140-160 kcal';

  @override
  String get reduceStressIntro =>
      'En este entrenamiento para reducir el estrés, practicarás Yoga, irás a caminar por la mañana y seguirás una dieta limpia. El Yoga calma tu mente y cuerpo, caminar refresca y mejora el ánimo, y una dieta equilibrada te mantiene ligero, saludable y libre de estrés.';

  @override
  String get burnt70kcal => 'Quemado ~70 kcal';

  @override
  String get morningWarmupIntro =>
      'Este calentamiento matutino incluye caminar, saltos de tijera, flexiones y estiramientos de hombros para mejorar la circulación, aliviar la rigidez y energizarte para el día.';

  @override
  String get burnt60to80kcal => 'Quemado ~60–80 kcal';

  @override
  String get time10to15minWarmup => 'Tiempo: 10–15 min';

  @override
  String get achievementsTitle => 'Logros';

  @override
  String get unlocked => 'Desbloqueado';

  @override
  String get locked => 'Bloqueado';

  @override
  String unlockedBadge(String title) {
    return 'Desbloqueado: $title';
  }

  @override
  String levelLabel(int level) {
    return 'Nivel $level';
  }

  @override
  String get trophiesCollected => 'Trofeos Recolectados';

  @override
  String get noTrophiesYet =>
      'Aún no hay trofeos recolectados. ¡Camina 10,000 pasos en un día para ganar uno!';

  @override
  String get appGuide => 'Guía de la App';

  @override
  String get dailyWeeklyTracking => '🏃 Seguimiento Diario y Semanal';

  @override
  String get dailyWeeklyTrackingDesc =>
      'En la primera pantalla principal, verás tu recuento diario de pasos en vivo en la parte superior. Debajo, un gráfico de barras semanal muestra tu progreso para cada día de la semana.';

  @override
  String get monthlyReportAchievements => '📊 Informe Mensual y Logros';

  @override
  String get monthlyReportDesc =>
      'La segunda pantalla te da un desglose mensual completo de tus pasos. Puedes ver el registro de cada día y ver tu distancia total, calorías y duración. Los logros también se muestran aquí, con progreso hacia el desbloqueo de insignias.';

  @override
  String get healthFitness => '💪 Salud y Fitness';

  @override
  String get healthFitnessDesc =>
      'En la tercera pantalla, puedes establecer tu meta diaria de pasos y rastrear tu IMC. También encontrarás rutinas de fitness como:\n• Entrenamientos abdominales\n• Ejercicios para perder peso\n• Reducción del estrés\n• Calentamientos matutinos\n\nCada sección incluye duración estimada y calorías quemadas.';

  @override
  String get settingsProfile => '⚙️ Configuración y Perfil';

  @override
  String get settingsProfileDesc =>
      'La cuarta pantalla incluye tu información personal como altura y género. Puedes alternar entre temas claro y oscuro, y restablecer tus datos de pasos si es necesario.';

  @override
  String get tips => '🎯 Consejos';

  @override
  String get tipsDesc =>
      '• Toca las insignias para ver sus descripciones.\n• Los confeti celebran tu progreso cuando desbloqueas logros.\n• Usa la pantalla de salud diariamente para mantenerte constante y motivado.';

  @override
  String get gotIt => '¡Entendido!';

  @override
  String get privacyPolicyTitle => 'Política de Privacidad';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited se compromete a proteger tu privacidad. Nuestra app, Pedometer – Walk & Track, está diseñada para ayudarte a monitorear tu actividad diaria sin comprometer tus datos personales. No recopilamos, almacenamos ni transmitimos ninguna información de usuario—sin excepción.';

  @override
  String get privacyPolicyPara2 =>
      'No solicitamos ni accedemos a tu nombre, correo electrónico, ubicación, contactos ni ningún otro identificador personal. Todos los datos de seguimiento de pasos y progreso se procesan localmente en tu dispositivo y nunca lo abandonan. No hay sincronización en la nube, ni análisis, ni seguimiento de terceros.';

  @override
  String get privacyPolicyPara3 =>
      'La app puede solicitar permiso para acceder a sensores de actividad física y enviar notificaciones. Estos se usan únicamente para contar tus pasos y enviar mensajes motivacionales. Ningún dato se comparte externamente y no se almacena información más allá de tu dispositivo.';

  @override
  String get privacyPolicyPara4 =>
      'No utilizamos servicios de terceros, SDKs ni APIs que recopilen datos de usuarios. Tu experiencia con Pedometer – Walk & Track es completamente privada e independiente.';

  @override
  String get privacyPolicyPara5 =>
      'Nuestra app es adecuada para todos los grupos de edad y no recopila conscientemente ningún dato de menores. Dado que no recopilamos ninguna información, no hay riesgo de uso indebido o acceso no autorizado.';

  @override
  String get privacyPolicyPara6 =>
      'Si realizamos cambios en la app que afecten cómo funciona o interactúa con tu dispositivo, también actualizaremos esta Política de Privacidad para reflejar esos cambios. Estamos comprometidos a mantenerte informado y protegido en cada paso del camino.';

  @override
  String get privacyPolicyContact =>
      'Para cualquier pregunta o soporte, puedes contactarnos en:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => '¿Esta app cuenta mis pasos?';

  @override
  String get faq1Answer =>
      'Sí, Pedometer Walk & Track cuenta con precisión tus pasos durante todo el día. También rastrea la distancia, las calorías quemadas y el tiempo activo para darte una vista completa de tu actividad.';

  @override
  String get faq2Question => '¿La app tiene ejercicios para perder peso?';

  @override
  String get faq2Answer =>
      'Sí, la app incluye ejercicios simples para perder peso y fitness. Los puedes encontrar en la parte inferior de la pantalla de Salud, diseñados para apoyar tu rutina diaria de entrenamiento.';

  @override
  String get faq3Question => '¿La app guarda registros mensuales de mis pasos?';

  @override
  String get faq3Answer =>
      'Sí, la app almacena tus registros diarios, semanales y mensuales de pasos. Esto te permite revisar tu progreso a lo largo del tiempo y mantenerte motivado para alcanzar tus metas de fitness.';

  @override
  String get faq4Question => '¿Almacenan mis datos personales?';

  @override
  String get faq4Answer =>
      'No, no almacenamos ninguno de tus datos personales en servidores. Todos tus recuentos de pasos, registros y detalles de actividad se guardan de forma segura únicamente en tu dispositivo. Esto garantiza tu privacidad y control total sobre tu información.';

  @override
  String get faq5Question => '¿La app compartirá mis datos con alguien?';

  @override
  String get faq5Answer =>
      'No, tus datos nunca se comparten con nadie. Dado que Pedometer Walk & Track no recopila tus datos personales, no hay nada que compartir. Puedes usar la app con total confianza y tranquilidad.';

  @override
  String get dailyRecords => 'Registros Diarios';

  @override
  String get steps => 'Pasos';

  @override
  String get miles => 'Millas';

  @override
  String get monthlyCalendar => 'Calendario Mensual';
}
