// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bhojpuri (`bho`).
class AppLocalizationsBho extends AppLocalizations {
  AppLocalizationsBho([String locale = 'bho']) : super(locale);

  @override
  String get appName => 'पासमैन';

  @override
  String get acceptTerm => 'नीति आ सर्त मान लीं';

  @override
  String get continueBtn => 'आगे बढ़ीं';

  @override
  String get verifyItsYou => 'पक्का करीं कि रउआ ही बानी';

  @override
  String get incorrectPinMsg => 'गलत पिन। फेर से कोशिश करीं।';

  @override
  String get greetings => 'फेर से स्वागत बा';

  @override
  String get yourName => 'रउआ के नाव';

  @override
  String get safetyScore => 'सुरक्षा स्कोर';

  @override
  String totalPassword(int value) {
    return '$value पासवर्ड';
  }

  @override
  String get categories => 'श्रेणी';

  @override
  String get availableAvatars => 'उपलब्ध अवतार';

  @override
  String get enterYourName => 'अपना नाव लिखीं';

  @override
  String get security => 'सुरक्षा';

  @override
  String get securitySubtitle => 'पासवर्ड बदलीं, खुद नष्ट होखल';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle => 'भाषा बदलीं';
}
