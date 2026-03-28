// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTagline => 'MITRA\nKESEHATAN\nANDA';

  @override
  String get appSubtitle => 'Sederhana, menenangkan, sehat';

  @override
  String get onboardingPage1Title => 'Setiap Langkah Berarti';

  @override
  String get onboardingPage1Subtitle =>
      'Lacak gerakan harian Anda secara real time.';

  @override
  String get onboardingPage2Title => 'Visualisasikan Kemajuan';

  @override
  String get onboardingPage2Subtitle => 'Lihat konsistensi Anda sekilas.';

  @override
  String get onboardingPage3Title => 'Pusat Kebugaran Anda';

  @override
  String get onboardingPage3Subtitle =>
      'Semua yang Anda butuhkan untuk tetap bugar.';

  @override
  String get onboardingPage4Title => 'Tetapkan Tujuan Anda';

  @override
  String get onboardingPage4Subtitle => 'Sesuaikan target harian Anda.';

  @override
  String get getStarted => 'Mulai';

  @override
  String get nextStep => 'Langkah Berikutnya';

  @override
  String get startJourney => 'Mulai Perjalanan  →';

  @override
  String get skip => 'Lewati';

  @override
  String get october => 'Oktober';

  @override
  String get daysActive => '22 Hari Aktif';

  @override
  String get stepsToday => 'LANGKAH HARI INI';

  @override
  String get stepsDaily => 'LANGKAH HARIAN';

  @override
  String get workouts => 'Olahraga';

  @override
  String get heartRate => 'Detak Jantung';

  @override
  String get metrics => 'Metrik';

  @override
  String get reports => 'Laporan';

  @override
  String get permissionsRequired => 'Izin Diperlukan';

  @override
  String get permissionsDialogContent =>
      'Untuk melacak langkah Anda dan mengirim notifikasi motivasi, izinkan izin Aktivitas dan Notifikasi.';

  @override
  String get notNow => 'Nanti';

  @override
  String get allow => 'Izinkan';

  @override
  String get permissionsNotGranted =>
      'Izin tidak diberikan. Beberapa fitur mungkin tidak berfungsi.';

  @override
  String get permissions => 'Izin';

  @override
  String get setDailyStepGoal => 'Tetapkan Target Langkah Harian';

  @override
  String get failedToLoadData => 'Gagal memuat data';

  @override
  String get retry => 'Coba Lagi';

  @override
  String get achievementProgress => 'Kemajuan Pencapaian';

  @override
  String get bmiNotSet => 'BMI: Belum diatur';

  @override
  String get setHeightWeight => 'Atur tinggi dan berat badan di profil';

  @override
  String get dailyReminder => 'Pengingat Harian';

  @override
  String get dailyReminderSubtitle =>
      'Dapatkan kutipan motivasi setiap pagi pukul 9';

  @override
  String get resetTodaysSteps => 'Reset Langkah Hari Ini';

  @override
  String get resetAllData => 'Reset Semua Data';

  @override
  String get fitnessSection => 'Bagian Kebugaran';

  @override
  String get absTitle => 'Latihan Perut';

  @override
  String get absSubtitle => 'Hanya Empat Gerakan untuk Perut';

  @override
  String get loseWeight => 'Turunkan Berat Badan';

  @override
  String get loseWeightSubtitle => 'Bakar lemak lebih efektif';

  @override
  String get reduceStress => 'Kurangi Stres';

  @override
  String get reduceStressSubtitle => 'Pikiran jernih, rileks dan meditasi';

  @override
  String get morningWarmup => 'Pemanasan Pagi';

  @override
  String get morningWarmupSubtitle => 'Dapatkan udara segar dan Vitamin D';

  @override
  String get todaysTotalSteps => 'Total Langkah Hari Ini';

  @override
  String get mile => 'Mil';

  @override
  String get kcal => 'Kkal';

  @override
  String get time => 'Waktu';

  @override
  String get daysStreak => 'Hari Berturut-turut';

  @override
  String goalSteps(int goal) {
    return 'Target: $goal langkah';
  }

  @override
  String stepsLeft(int remaining) {
    return '$remaining langkah lagi';
  }

  @override
  String get achievements => 'Pencapaian';

  @override
  String get thisMonth => 'Bulan Ini';

  @override
  String get totalSteps => 'Total Langkah';

  @override
  String get monthlyProgress => 'Kemajuan Bulanan';

  @override
  String get editProfile => 'Edit Profil';

  @override
  String get theme => 'Tema';

  @override
  String get appLinkCopied => 'Tautan aplikasi disalin ke clipboard';

  @override
  String get instruction => 'Instruksi';

  @override
  String get instructionSubtitle => 'Panduan menggunakan aplikasi';

  @override
  String get shareApp => 'Bagikan Aplikasi';

  @override
  String get shareAppSubtitle => 'Bagikan Aplikasi Kami dengan Teman';

  @override
  String get faqs => 'FAQ';

  @override
  String get faqsSubtitle => 'Pertanyaan yang Sering Diajukan';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get privacyPolicySubtitle => 'Kebijakan Privasi Aplikasi';

  @override
  String get nameLabel => 'Nama';

  @override
  String get ageLabel => 'Usia';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get profileUpdated => 'Profil Diperbarui';

  @override
  String get profileSavedMessage => 'Profil Anda telah berhasil disimpan.';

  @override
  String get invalidInput => 'Input Tidak Valid';

  @override
  String get invalidInputMessage => 'Masukkan nama dan usia yang valid.';

  @override
  String get loading => 'Memuat...';

  @override
  String get notSet => 'Belum diatur';

  @override
  String ageDisplay(int age) {
    return 'Usia: $age';
  }

  @override
  String get selectYourGender => 'Jenis Kelamin Anda';

  @override
  String get genderHint =>
      'Kami membutuhkannya untuk mengukur panjang langkah dan pembakaran kalori Anda.';

  @override
  String get male => 'Laki-laki';

  @override
  String get female => 'Perempuan';

  @override
  String get next => 'SELANJUTNYA';

  @override
  String get selectPrefix => 'Pilih';

  @override
  String get moreAboutYouPrefix => 'Lebih';

  @override
  String get moreAboutYouSuffix => 'Tentang Anda';

  @override
  String get heightWeightHint =>
      'Untuk memastikan akurasi, masukkan tinggi dan berat badan Anda yang benar. Kami tidak pernah berbagi data ini.';

  @override
  String get height => 'Tinggi Badan';

  @override
  String get weight => 'Berat Badan';

  @override
  String get selectHeightCm => 'Pilih Tinggi Badan (cm)';

  @override
  String get selectWeightKg => 'Pilih Berat Badan (kg)';

  @override
  String get start => 'MULAI';

  @override
  String get absWorkouts => 'Latihan Perut';

  @override
  String get beginner => 'Pemula';

  @override
  String get intermediate => 'Menengah';

  @override
  String get advanced => 'Lanjutan';

  @override
  String get advance => 'Lanjutkan';

  @override
  String get duration15mins => '15 menit';

  @override
  String get duration30mins => '30 menit';

  @override
  String get duration40plusMins => '40+ menit';

  @override
  String get introduction => 'Pengantar';

  @override
  String get level => 'Level';

  @override
  String get duration => 'Durasi';

  @override
  String get absBeginnerIntro =>
      'Latihan perut pemula ini dirancang untuk mengaktifkan otot inti Anda, meningkatkan stabilitas, dan membangun kekuatan dasar. Sempurna untuk memulai perjalanan kebugaran Anda.';

  @override
  String get burnt45kcal => 'Terbakar ~45 kkal';

  @override
  String get time10to15min => 'Waktu: 10–15 menit';

  @override
  String get absIntermediateIntro =>
      'Latihan perut menengah ini membangun kekuatan inti dengan tahan lebih lama, repetisi lebih banyak, dan gerakan dinamis. Ideal untuk berkembang melampaui dasar.';

  @override
  String get burnt85to100kcal => 'Terbakar ~85-100 kkal';

  @override
  String get time20to30min => 'Waktu: 20–30 menit';

  @override
  String get absAdvancedIntro =>
      'Latihan perut lanjutan ini menargetkan otot inti dalam dengan gerakan repetisi tinggi, tahan statis, dan transisi dinamis. Sempurna untuk membangun definisi, kekuatan, dan daya tahan.';

  @override
  String get burnt130to160kcal => 'Terbakar ~130-160 kkal';

  @override
  String get time40plusMin => 'Waktu: 40+ menit';

  @override
  String get loseWeightBeginnerIntro =>
      'Latihan pembakaran lemak pemula ini dirancang untuk meningkatkan detak jantung, mendorong metabolisme, dan memulai perjalanan penurunan berat badan Anda. Tidak perlu peralatan.';

  @override
  String get burnt60kcal => 'Terbakar ~60 kkal';

  @override
  String get time12to18min => 'Waktu: 12–18 menit';

  @override
  String get loseWeightIntermediateIntro =>
      'Latihan pembakaran lemak menengah ini memperketat setiap gerakan untuk menantang stamina dan mempercepat kehilangan lemak. Tidak perlu peralatan—cukup komitmen.';

  @override
  String get burnt90to100kcal => 'Terbakar ~90-100 kkal';

  @override
  String get time25to30min => 'Waktu: 25–30 menit';

  @override
  String get loseWeightAdvancedIntro =>
      'Latihan pembakaran lemak lanjutan ini dirancang untuk menantang daya tahan, kekuatan, dan koordinasi Anda. Harapkan repetisi tinggi, gerakan eksplosif, dan keringat yang banyak.';

  @override
  String get burnt140to160kcal => 'Terbakar ~140-160 kkal';

  @override
  String get reduceStressIntro =>
      'Dalam latihan Kurangi Stres ini, Anda akan berlatih Yoga, berjalan pagi, dan mengikuti pola makan bersih. Yoga membantu menenangkan pikiran dan tubuh, berjalan menyegarkan dan meningkatkan suasana hati, dan diet seimbang membuat Anda ringan, sehat, dan bebas stres.';

  @override
  String get burnt70kcal => 'Terbakar ~70 kkal';

  @override
  String get morningWarmupIntro =>
      'Pemanasan Pagi ini mencakup jalan kaki, jumping jack, push-up, dan peregangan bahu untuk meningkatkan sirkulasi, melenturkan kekakuan, dan memberi energi untuk hari ini.';

  @override
  String get burnt60to80kcal => 'Terbakar ~60–80 kkal';

  @override
  String get time10to15minWarmup => 'Waktu: 10–15 menit';

  @override
  String get achievementsTitle => 'Pencapaian';

  @override
  String get unlocked => 'Terbuka';

  @override
  String get locked => 'Terkunci';

  @override
  String unlockedBadge(String title) {
    return 'Terbuka: $title';
  }

  @override
  String levelLabel(int level) {
    return 'Level $level';
  }

  @override
  String get trophiesCollected => 'Trofi Terkumpul';

  @override
  String get noTrophiesYet =>
      'Belum ada trofi yang terkumpul. Jalan 10.000 langkah dalam sehari untuk mendapatkan satu!';

  @override
  String get appGuide => 'Panduan Aplikasi';

  @override
  String get dailyWeeklyTracking => '🏃 Pelacakan Harian & Mingguan';

  @override
  String get dailyWeeklyTrackingDesc =>
      'Pada layar utama pertama, Anda akan melihat jumlah langkah harian secara live di bagian atas. Di bawahnya, grafik batang mingguan menunjukkan kemajuan Anda untuk setiap hari dalam seminggu.';

  @override
  String get monthlyReportAchievements => '📊 Laporan Bulanan & Pencapaian';

  @override
  String get monthlyReportDesc =>
      'Layar kedua memberikan rincian bulanan lengkap langkah Anda. Anda dapat melihat catatan setiap hari dan melihat total jarak, kalori, dan durasi. Pencapaian juga ditampilkan di sini, dengan kemajuan menuju membuka lencana.';

  @override
  String get healthFitness => '💪 Kesehatan & Kebugaran';

  @override
  String get healthFitnessDesc =>
      'Di layar ketiga, Anda dapat menetapkan target langkah harian dan melacak BMI. Anda juga akan menemukan rutinitas kebugaran seperti:\n• Latihan perut\n• Latihan penurunan berat badan\n• Pengurangan stres\n• Pemanasan pagi\n\nSetiap bagian mencakup perkiraan durasi dan kalori yang terbakar.';

  @override
  String get settingsProfile => '⚙️ Pengaturan & Profil';

  @override
  String get settingsProfileDesc =>
      'Layar keempat mencakup informasi pribadi Anda seperti tinggi badan dan jenis kelamin. Anda dapat beralih antara tema terang dan gelap, dan mereset data langkah Anda jika diperlukan.';

  @override
  String get tips => '🎯 Tips';

  @override
  String get tipsDesc =>
      '• Ketuk lencana untuk melihat deskripsinya.\n• Confetti merayakan kemajuan Anda saat Anda membuka pencapaian.\n• Gunakan layar kesehatan setiap hari agar tetap konsisten dan termotivasi.';

  @override
  String get gotIt => 'Mengerti!';

  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';

  @override
  String get privacyPolicyPara1 =>
      'NSB Solutions (Private) Limited berkomitmen untuk melindungi privasi Anda. Aplikasi kami, Pedometer – Walk & Track, dirancang untuk membantu Anda memantau aktivitas harian tanpa membahayakan data pribadi Anda. Kami tidak mengumpulkan, menyimpan, atau mengirimkan informasi pengguna—sama sekali.';

  @override
  String get privacyPolicyPara2 =>
      'Kami tidak meminta atau mengakses nama, email, lokasi, kontak, atau pengenal pribadi lainnya. Semua data pelacakan langkah dan kemajuan diproses secara lokal di perangkat Anda dan tidak pernah meninggalkannya. Tidak ada sinkronisasi cloud, tidak ada analitik, dan tidak ada pelacakan pihak ketiga.';

  @override
  String get privacyPolicyPara3 =>
      'Aplikasi mungkin meminta izin untuk mengakses sensor aktivitas fisik dan mengirim notifikasi. Ini digunakan semata-mata untuk menghitung langkah Anda dan mengirimkan pesan motivasi. Tidak ada data yang dibagikan secara eksternal, dan tidak ada informasi yang disimpan di luar perangkat Anda.';

  @override
  String get privacyPolicyPara4 =>
      'Kami tidak menggunakan layanan pihak ketiga, SDK, atau API yang mengumpulkan data pengguna. Pengalaman Anda dengan Pedometer – Walk & Track sepenuhnya pribadi dan mandiri.';

  @override
  String get privacyPolicyPara5 =>
      'Aplikasi kami cocok untuk semua kelompok umur dan tidak secara sengaja mengumpulkan data dari anak-anak. Karena kami tidak mengumpulkan informasi apapun, tidak ada risiko penyalahgunaan atau akses tidak sah.';

  @override
  String get privacyPolicyPara6 =>
      'Jika kami membuat perubahan pada aplikasi yang memengaruhi cara kerjanya atau berinteraksi dengan perangkat Anda, kami juga akan memperbarui Kebijakan Privasi ini untuk mencerminkan perubahan tersebut. Kami berkomitmen untuk selalu memberi informasi dan perlindungan kepada Anda di setiap langkah.';

  @override
  String get privacyPolicyContact =>
      'Untuk pertanyaan atau dukungan, Anda dapat menghubungi kami di:';

  @override
  String get privacyPolicyContactDetails =>
      'NSB Solutions (Private) Limited\n📧 nsbsolutions2000@gmail.com\n🌐 https://nsbsolutions.online\n📞 +92 323 3525610';

  @override
  String get faq1Question => 'Apakah aplikasi ini menghitung langkah saya?';

  @override
  String get faq1Answer =>
      'Ya, Pedometer Walk & Track menghitung langkah Anda secara akurat sepanjang hari. Ini juga melacak jarak, kalori yang terbakar, dan waktu aktif untuk memberi Anda gambaran lengkap aktivitas Anda.';

  @override
  String get faq2Question =>
      'Apakah aplikasi memiliki latihan penurunan berat badan?';

  @override
  String get faq2Answer =>
      'Ya, aplikasi mencakup latihan penurunan berat badan dan kebugaran yang sederhana. Anda dapat menemukannya di bagian bawah layar Kesehatan, dirancang untuk mendukung rutinitas olahraga harian Anda.';

  @override
  String get faq3Question =>
      'Apakah aplikasi menyimpan catatan bulanan langkah saya?';

  @override
  String get faq3Answer =>
      'Ya, aplikasi menyimpan catatan langkah harian, mingguan, dan bulanan Anda. Ini memungkinkan Anda meninjau kemajuan dari waktu ke waktu dan tetap termotivasi untuk mencapai tujuan kebugaran Anda.';

  @override
  String get faq4Question => 'Apakah Anda menyimpan data pribadi saya?';

  @override
  String get faq4Answer =>
      'Tidak, kami tidak menyimpan data pribadi Anda di server. Semua jumlah langkah, catatan, dan detail aktivitas Anda disimpan dengan aman hanya di perangkat Anda. Ini memastikan privasi dan kendali penuh atas informasi Anda.';

  @override
  String get faq5Question =>
      'Apakah aplikasi akan berbagi data saya dengan siapapun?';

  @override
  String get faq5Answer =>
      'Tidak, data Anda tidak pernah dibagikan kepada siapapun. Karena Pedometer Walk & Track tidak mengumpulkan data pribadi Anda, tidak ada yang perlu dibagikan. Anda dapat menggunakan aplikasi dengan keyakinan penuh dan ketenangan pikiran.';

  @override
  String get dailyRecords => 'Catatan Harian';

  @override
  String get steps => 'Langkah';

  @override
  String get miles => 'Mil';

  @override
  String get monthlyCalendar => 'Kalender Bulanan';
}
