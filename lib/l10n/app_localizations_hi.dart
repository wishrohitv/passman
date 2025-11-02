// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'PassMan';

  @override
  String get acceptTerm => 'नीति और शर्तों से सहमत हों';

  @override
  String get continueBtn => 'जारी रखें';

  @override
  String get verifyItsYou => 'सत्यापित करें कि आप ही हैं';

  @override
  String get incorrectPinMsg => 'गलत PIN। कृपया पुनः प्रयास करें।';

  @override
  String get enterYourNameOpt => 'अपना नाम दर्ज करें (वैकल्पिक)';

  @override
  String get enterSuperPin => 'सुपर PIN दर्ज करें';

  @override
  String get onlyPinYouNeedToRemember => 'केवल वही PIN जो आपको याद रखना है';

  @override
  String get confirmYourPin => 'सुपर PIN की पुष्टि करें';

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
  String get recentlyAdded => 'हाल ही में जोड़ा गया';

  @override
  String get card => 'कार्ड';

  @override
  String get cards => 'कार्ड्स';

  @override
  String get login => 'लॉगिन';

  @override
  String get addAccounts => 'खाते जोड़ें';

  @override
  String get accountType => 'खाता प्रकार';

  @override
  String get siteNameHelperText => 'साइट का नाम (उदा. Google, Facebook)';

  @override
  String get emailUserNameNumberHelperText => 'ईमेल या उपयोगकर्ता नाम या नंबर';

  @override
  String get password => 'पासवर्ड';

  @override
  String get bankName => 'बैंक का नाम';

  @override
  String get holderName => 'होल्डर का नाम';

  @override
  String get expireOn => 'समाप्ति तारीख';

  @override
  String get greenPin => 'ग्रीन PIN';

  @override
  String get addSuccessfully => 'सफलतापूर्वक जोड़ा गया';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया';

  @override
  String get add => 'जोड़ें';

  @override
  String get delete => 'हटाएं';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get all => 'सभी';

  @override
  String get error => 'त्रुटि';

  @override
  String get deleteWarning => 'इस क्रिया को पूर्ववत नहीं किया जा सकता';

  @override
  String get writeNoteHelperText => 'नोट लिखें';

  @override
  String get pwEncrptionAlgorithm => 'पासवर्ड एन्क्रिप्शन एल्गोरिथम';

  @override
  String get pwEncryptionAlgorithmSubtitle =>
      'एन्क्रिप्शन एल्गोरिथम बदलने से आपके मौजूदा पासवर्ड प्रभावित नहीं होंगे। हालांकि, नए पासवर्ड चयनित एल्गोरिथम के साथ एन्क्रिप्ट होंगे।';

  @override
  String get pwGenerator => 'पासवर्ड जनरेटर';

  @override
  String get includeNumbers => 'संख्याएं शामिल करें';

  @override
  String get includeSymbols => 'प्रतीक शामिल करें';

  @override
  String get copied => 'कॉपी किया गया';

  @override
  String get security => 'सुरक्षा';

  @override
  String get securitySubtitle => 'पासवर्ड बदलें, आत्म-विनाश';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle => 'भाषाएँ बदलें';
}
