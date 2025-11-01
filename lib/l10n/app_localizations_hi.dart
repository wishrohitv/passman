// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'पासमैन';

  @override
  String get acceptTerm => 'नीति और शर्तों से सहमत हों';

  @override
  String get continueBtn => 'जारी रखें';

  @override
  String get verifyItsYou => 'सत्यापित करें कि यह आप हैं';

  @override
  String get incorrectPinMsg => 'गलत पिन। कृपया पुनः प्रयास करें।';

  @override
  String get greetings => 'वापसी पर स्वागत है';

  @override
  String get yourName => 'आपका नाम';

  @override
  String get safetyScore => 'सुरक्षा स्कोर';

  @override
  String totalPassword(int value) {
    return '$value पासवर्ड';
  }

  @override
  String get categories => 'श्रेणियाँ';

  @override
  String get availableAvatars => 'उपलब्ध अवतार';

  @override
  String get enterYourName => 'अपना नाम दर्ज करें';

  @override
  String get security => 'सुरक्षा';

  @override
  String get securitySubtitle => 'पासवर्ड बदलें, स्वयं-विनाश';

  @override
  String language(String selectedLanguage) {
    return 'भाषा $selectedLanguage';
  }

  @override
  String get languageSubtitle => 'भाषा बदलें';
}
