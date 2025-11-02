// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bhojpuri (`bho`).
class AppLocalizationsBho extends AppLocalizations {
  AppLocalizationsBho([String locale = 'bho']) : super(locale);

  @override
  String get appName => 'PassMan';

  @override
  String get acceptTerm => 'नीति आ शर्त से सहमत होखीं';

  @override
  String get continueBtn => 'आगे बढ़ीं';

  @override
  String get verifyItsYou => 'देखीं, ई आप ही बानीं';

  @override
  String get incorrectPinMsg => 'गलत PIN। फेर कोशिश करीं।';

  @override
  String get enterYourNameOpt => 'आपन नाम दर्ज करीं (वैकल्पिक)';

  @override
  String get enterSuperPin => 'सुपर PIN दर्ज करीं';

  @override
  String get onlyPinYouNeedToRemember =>
      'ओह PIN के छोड़ के कुछू याद ना रखे के चाहीं';

  @override
  String get confirmYourPin => 'सुपर PIN के पुष्टि करीं';

  @override
  String get greetings => 'फेर से स्वागत बा';

  @override
  String get yourName => 'रउआ नाम';

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
  String get enterYourName => 'आपन नाम दर्ज करीं';

  @override
  String get recentlyAdded => 'हालहि में जोडल गइल';

  @override
  String get card => 'कार्ड';

  @override
  String get cards => 'कार्ड';

  @override
  String get login => 'लॉगिन';

  @override
  String get addAccounts => 'खाता जोड़ल जाव';

  @override
  String get accountType => 'खाता के प्रकार';

  @override
  String get siteNameHelperText => 'साइट के नाम (जइसे: Google, Facebook)';

  @override
  String get emailUserNameNumberHelperText => 'ईमेल या यूज़रनेम या नंबर';

  @override
  String get password => 'पासवर्ड';

  @override
  String get bankName => 'बैंक के नाम';

  @override
  String get holderName => 'होल्डर के नाम';

  @override
  String get expireOn => 'समाप्त होई';

  @override
  String get greenPin => 'हरा PIN';

  @override
  String get addSuccessfully => 'सफलता से जोड़ल गइल';

  @override
  String get somethingWentWrong => 'कुछु गड़बड़ हो गइल';

  @override
  String get add => 'जोड़ल जाव';

  @override
  String get delete => 'हटावल जाव';

  @override
  String get cancel => 'रद्द करीं';

  @override
  String get all => 'सब';

  @override
  String get error => 'गलती';

  @override
  String get deleteWarning => 'ई कार्रवाई वापस ना हो सकेला';

  @override
  String get writeNoteHelperText => 'नोट लिखीं';

  @override
  String get pwEncrptionAlgorithm => 'पासवर्ड एन्क्रिप्शन एल्गोरिथम';

  @override
  String get pwEncryptionAlgorithmSubtitle =>
      'एन्क्रिप्शन एल्गोरिथम बदले से अबहीं वाला पासवर्ड प्रभावित ना होई। बाकिर, नया पासवर्ड चुने गइल एल्गोरिथम से एन्क्रिप्ट होइहें।';

  @override
  String get pwGenerator => 'पासवर्ड जनरेटर';

  @override
  String get includeNumbers => 'नंबर शामिल करीं';

  @override
  String get includeSymbols => 'चिन्ह शामिल करीं';

  @override
  String get copied => 'कॉपी भइल';

  @override
  String get security => 'सुरक्षा';

  @override
  String get securitySubtitle => 'पासवर्ड बदलीं, आत्म-विनाश';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle => 'भाषा बदलल जाव';
}
