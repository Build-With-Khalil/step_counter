// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTagline => 'SEU\nPARCEIRO\nDE SAÚDE';

  @override
  String get appSubtitle => 'Simples, relaxante, saudável';

  @override
  String get onboardingPage1Title => 'Cada Passo Conta';

  @override
  String get onboardingPage1Subtitle =>
      'Acompanhe seu movimento diário em tempo real.';

  @override
  String get onboardingPage2Title => 'Visualize o Progresso';

  @override
  String get onboardingPage2Subtitle => 'Veja sua consistência de relance.';

  @override
  String get onboardingPage3Title => 'Seu Hub de Fitness';

  @override
  String get onboardingPage3Subtitle =>
      'Tudo que você precisa para se manter em forma.';

  @override
  String get onboardingPage4Title => 'Defina Seu Objetivo';

  @override
  String get onboardingPage4Subtitle => 'Personalize sua meta diária.';

  @override
  String get getStarted => 'Começar';

  @override
  String get nextStep => 'Próximo Passo';

  @override
  String get startJourney => 'Iniciar Jornada  →';

  @override
  String get skip => 'Pular';

  @override
  String get october => 'Outubro';

  @override
  String get daysActive => '22 Dias Ativos';

  @override
  String get stepsToday => 'PASSOS HOJE';

  @override
  String get stepsDaily => 'PASSOS DIÁRIOS';

  @override
  String get workouts => 'Treinos';

  @override
  String get heartRate => 'Frequência Cardíaca';

  @override
  String get metrics => 'Métricas';

  @override
  String get reports => 'Relatórios';

  @override
  String get permissionsRequired => 'Permissões Necessárias';

  @override
  String get permissionsDialogContent =>
      'Para rastrear seus passos e enviar notificações motivacionais, por favor, permita as permissões de Atividade e Notificação.';

  @override
  String get notNow => 'Agora Não';

  @override
  String get allow => 'Permitir';

  @override
  String get permissionsNotGranted =>
      'Permissões não concedidas. Algumas funcionalidades podem não funcionar.';

  @override
  String get permissions => 'Permissões';

  @override
  String get setDailyStepGoal => 'Definir Meta Diária de Passos';

  @override
  String get failedToLoadData => 'Falha ao carregar dados';

  @override
  String get retry => 'Tentar Novamente';

  @override
  String get achievementProgress => 'Progresso de Conquistas';

  @override
  String get bmiNotSet => 'IMC: Não definido';

  @override
  String get setHeightWeight => 'Definir altura e peso no perfil';

  @override
  String get dailyReminder => 'Lembrete Diário';

  @override
  String get dailyReminderSubtitle =>
      'Receba uma citação motivacional todas as manhãs às 9h';

  @override
  String get resetTodaysSteps => 'Redefinir Passos de Hoje';

  @override
  String get resetAllData => 'Redefinir Todos os Dados';

  @override
  String get fitnessSection => 'Seção de Fitness';

  @override
  String get absTitle => 'Abdominais';

  @override
  String get absSubtitle => 'Apenas Quatro Movimentos para Abdominais';

  @override
  String get loseWeight => 'Perder Peso';

  @override
  String get loseWeightSubtitle => 'Queimar gordura mais eficazmente';

  @override
  String get reduceStress => 'Reduzir o Estresse';

  @override
  String get reduceStressSubtitle => 'Mente clara, relaxe e medite';

  @override
  String get morningWarmup => 'Aquecimento Matinal';

  @override
  String get morningWarmupSubtitle => 'Respire ar fresco e obtenha Vitamina D';

  @override
  String get todaysTotalSteps => 'Total de Passos de Hoje';

  @override
  String get mile => 'Milha';

  @override
  String get kcal => 'Kcal';

  @override
  String get time => 'Tempo';

  @override
  String get daysStreak => 'Dias Consecutivos';

  @override
  String goalSteps(int goal) {
    return 'Meta: $goal passos';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining passos restantes';
  }

  @override
  String get achievements => 'Conquistas';

  @override
  String get thisMonth => 'Este Mês';

  @override
  String get totalSteps => 'Total de Passos';

  @override
  String get monthlyProgress => 'Progresso Mensal';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get theme => 'Tema';

  @override
  String get appLinkCopied =>
      'Link do app copiado para a área de transferência';

  @override
  String get instruction => 'Instrução';

  @override
  String get instructionSubtitle => 'Guia para usar o app';

  @override
  String get shareApp => 'Compartilhar App';

  @override
  String get shareAppSubtitle => 'Compartilhe nosso App com Amigos';

  @override
  String get faqs => 'Perguntas Frequentes';

  @override
  String get faqsSubtitle => 'Perguntas Frequentes';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get privacyPolicySubtitle => 'Política de Privacidade do App';

  @override
  String get nameLabel => 'Nome';

  @override
  String get ageLabel => 'Idade';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get profileUpdated => 'Perfil Atualizado';

  @override
  String get profileSavedMessage => 'Seu perfil foi salvo com sucesso.';

  @override
  String get invalidInput => 'Entrada Inválida';

  @override
  String get invalidInputMessage =>
      'Por favor, insira um nome e idade válidos.';

  @override
  String get loading => 'Carregando...';

  @override
  String get notSet => 'Não definido';

  @override
  String ageDisplay(int age) {
    return 'Idade: $age';
  }

  @override
  String get selectYourGender => 'Seu Gênero';

  @override
  String get genderHint =>
      'Precisamos para medir o comprimento da sua passada e o gasto calórico.';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get next => 'PRÓXIMO';

  @override
  String get selectPrefix => 'Selecionar';

  @override
  String get moreAboutYouPrefix => 'Mais';

  @override
  String get moreAboutYouSuffix => 'Sobre Você';

  @override
  String get heightWeightHint =>
      'Para garantir precisão, insira sua altura e peso corretos. Nunca compartilhamos esses dados.';

  @override
  String get height => 'Altura';

  @override
  String get weight => 'Peso';

  @override
  String get selectHeightCm => 'Selecionar Altura (cm)';

  @override
  String get selectWeightKg => 'Selecionar Peso (kg)';

  @override
  String get start => 'INICIAR';

  @override
  String get absWorkouts => 'Treinos Abdominais';

  @override
  String get beginner => 'Iniciante';

  @override
  String get intermediate => 'Intermediário';

  @override
  String get advanced => 'Avançado';

  @override
  String get advance => 'Avançar';

  @override
  String get duration15mins => '15 min';

  @override
  String get duration30mins => '30 min';

  @override
  String get duration40plusMins => '40+ min';

  @override
  String get introduction => 'Introdução';

  @override
  String get level => 'Nível';

  @override
  String get duration => 'Duração';

  @override
  String get absBeginnerIntro =>
      'Este treino abdominal para iniciantes é projetado para ativar seu core, melhorar a estabilidade e construir força fundamental. Perfeito para iniciar sua jornada de fitness.';

  @override
  String get burnt45kcal => 'Queimado ~45 kcal';

  @override
  String get time10to15min => 'Tempo: 10–15 min';

  @override
  String get absIntermediateIntro =>
      'Este treino abdominal intermediário constrói força do core com retenções mais longas, mais repetições e movimentos dinâmicos. Ideal para progredir além do básico.';

  @override
  String get burnt85to100kcal => 'Queimado ~85-100 kcal';

  @override
  String get time20to30min => 'Tempo: 20–30 min';

  @override
  String get absAdvancedIntro =>
      'Este treino abdominal avançado trabalha os músculos profundos do core com movimentos de alta repetição, retenções estáticas e transições dinâmicas. Perfeito para desenvolver definição, força e resistência.';

  @override
  String get burnt130to160kcal => 'Queimado ~130-160 kcal';

  @override
  String get time40plusMin => 'Tempo: 40+ min';

  @override
  String get loseWeightBeginnerIntro =>
      'Este treino queima-gordura para iniciantes é projetado para elevar sua frequência cardíaca, impulsionar o metabolismo e iniciar sua jornada de perda de peso. Nenhum equipamento necessário.';

  @override
  String get burnt60kcal => 'Queimado ~60 kcal';

  @override
  String get time12to18min => 'Tempo: 12–18 min';

  @override
  String get loseWeightIntermediateIntro =>
      'Este treino queima-gordura intermediário intensifica cada movimento para desafiar sua resistência e acelerar a perda de gordura. Nenhum equipamento necessário—apenas comprometimento.';

  @override
  String get burnt90to100kcal => 'Queimado ~90-100 kcal';

  @override
  String get time25to30min => 'Tempo: 25–30 min';

  @override
  String get loseWeightAdvancedIntro =>
      'Este treino queima-gordura avançado é construído para desafiar sua resistência, força e coordenação. Espere altas repetições, movimentos explosivos e suor de verdade.';

  @override
  String get burnt140to160kcal => 'Queimado ~140-160 kcal';

  @override
  String get reduceStressIntro =>
      'Neste treino para reduzir o estresse, você praticará Yoga, fará uma caminhada matinal e seguirá uma dieta limpa. O Yoga acalma sua mente e corpo, caminhar refresca e melhora o humor, e uma dieta equilibrada mantém você leve, saudável e livre de estresse.';

  @override
  String get burnt70kcal => 'Queimado ~70 kcal';

  @override
  String get morningWarmupIntro =>
      'Este aquecimento matinal inclui caminhada, jumping jacks, flexões e alongamentos de ombro para melhorar a circulação, aliviar a rigidez e energizá-lo para o dia.';

  @override
  String get burnt60to80kcal => 'Queimado ~60–80 kcal';

  @override
  String get time10to15minWarmup => 'Tempo: 10–15 min';

  @override
  String get achievementsTitle => 'Conquistas';

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
    return 'Nível $level';
  }

  @override
  String get trophiesCollected => 'Troféus Coletados';

  @override
  String get noTrophiesYet =>
      'Nenhum troféu coletado ainda. Caminhe 10.000 passos em um dia para ganhar um!';

  @override
  String get appGuide => 'Guia do App';

  @override
  String get dailyWeeklyTracking => '🏃 Rastreamento Diário e Semanal';

  @override
  String get dailyWeeklyTrackingDesc =>
      'Na primeira tela principal, você verá sua contagem diária de passos ao vivo no topo. Abaixo disso, um gráfico de barras semanal mostra seu progresso para cada dia da semana.';

  @override
  String get monthlyReportAchievements => '📊 Relatório Mensal e Conquistas';

  @override
  String get monthlyReportDesc =>
      'A segunda tela fornece um detalhamento mensal completo de seus passos. Você pode ver o registro de cada dia e ver sua distância total, calorias e duração. As conquistas também são mostradas aqui, com progresso para desbloquear emblemas.';

  @override
  String get healthFitness => '💪 Saúde e Fitness';

  @override
  String get healthFitnessDesc =>
      'Na terceira tela, você pode definir sua meta diária de passos e acompanhar seu IMC. Você também encontrará rotinas de fitness como:\n• Treinos abdominais\n• Exercícios para perder peso\n• Redução de estresse\n• Aquecimentos matinais\n\nCada seção inclui duração estimada e calorias queimadas.';

  @override
  String get settingsProfile => '⚙️ Configurações e Perfil';

  @override
  String get settingsProfileDesc =>
      'A quarta tela inclui suas informações pessoais como altura e gênero. Você pode alternar entre temas claro e escuro, e redefinir seus dados de passos se necessário.';

  @override
  String get tips => '🎯 Dicas';

  @override
  String get tipsDesc =>
      '• Toque nos emblemas para ver suas descrições.\n• Confete celebra seu progresso quando você desbloqueia conquistas.\n• Use a tela de saúde diariamente para permanecer consistente e motivado.';

  @override
  String get gotIt => 'Entendido!';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited está comprometida em proteger sua privacidade. Nosso app, Pedometer – Walk & Track, foi projetado para ajudá-lo a monitorar sua atividade diária sem comprometer seus dados pessoais. Não coletamos, armazenamos ou transmitimos nenhuma informação do usuário—ponto final.';

  @override
  String get privacyPolicyPara2 =>
      'Não solicitamos nem acessamos seu nome, e-mail, localização, contatos ou qualquer outro identificador pessoal. Todos os dados de rastreamento de passos e progresso são processados localmente no seu dispositivo e nunca o deixam. Não há sincronização em nuvem, sem análises e sem rastreamento de terceiros.';

  @override
  String get privacyPolicyPara3 =>
      'O app pode solicitar permissão para acessar sensores de atividade física e enviar notificações. Estes são usados exclusivamente para contar seus passos e entregar mensagens motivacionais. Nenhum dado é compartilhado externamente e nenhuma informação é armazenada além do seu dispositivo.';

  @override
  String get privacyPolicyPara4 =>
      'Não usamos serviços de terceiros, SDKs ou APIs que coletam dados de usuários. Sua experiência com Pedometer – Walk & Track é totalmente privada e autossuficiente.';

  @override
  String get privacyPolicyPara5 =>
      'Nosso app é adequado para todos os grupos de idade e não coleta intencionalmente nenhum dado de crianças. Como não coletamos nenhuma informação, não há risco de uso indevido ou acesso não autorizado.';

  @override
  String get privacyPolicyPara6 =>
      'Se fizermos alterações no app que afetam como ele funciona ou interage com seu dispositivo, também atualizaremos esta Política de Privacidade para refletir essas mudanças. Estamos comprometidos em mantê-lo informado e protegido a cada passo do caminho.';

  @override
  String get privacyPolicyContact =>
      'Para quaisquer perguntas ou suporte, você pode nos contatar em:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'Este app conta meus passos?';

  @override
  String get faq1Answer =>
      'Sim, Pedometer Walk & Track conta seus passos com precisão ao longo do dia. Ele também rastreia distância, calorias queimadas e tempo ativo para lhe dar uma visão completa de sua atividade.';

  @override
  String get faq2Question => 'O app tem exercícios para perda de peso?';

  @override
  String get faq2Answer =>
      'Sim, o app inclui exercícios simples de perda de peso e fitness. Você pode encontrá-los na parte inferior da tela de Saúde, projetados para apoiar sua rotina diária de treino.';

  @override
  String get faq3Question => 'O app guarda registros mensais dos meus passos?';

  @override
  String get faq3Answer =>
      'Sim, o app armazena seus registros diários, semanais e mensais de passos. Isso permite que você revise seu progresso ao longo do tempo e permaneça motivado para alcançar seus objetivos de fitness.';

  @override
  String get faq4Question => 'Vocês armazenam meus dados pessoais?';

  @override
  String get faq4Answer =>
      'Não, não armazenamos nenhum de seus dados pessoais em servidores. Todas as suas contagens de passos, registros e detalhes de atividade são salvos com segurança apenas no seu dispositivo. Isso garante sua privacidade e controle total sobre suas informações.';

  @override
  String get faq5Question => 'O app compartilhará meus dados com alguém?';

  @override
  String get faq5Answer =>
      'Não, seus dados nunca são compartilhados com ninguém. Como o Pedometer Walk & Track não coleta seus dados pessoais, não há nada para compartilhar. Você pode usar o app com total confiança e tranquilidade.';

  @override
  String get dailyRecords => 'Registros Diários';

  @override
  String get steps => 'Passos';

  @override
  String get miles => 'Milhas';

  @override
  String get monthlyCalendar => 'Calendário Mensal';
}
