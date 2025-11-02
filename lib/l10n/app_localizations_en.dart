// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'PassMan';

  @override
  String get acceptTerm => 'Agree to the policy and terms';

  @override
  String get continueBtn => 'Continue';

  @override
  String get verifyItsYou => 'Verify it\'s you';

  @override
  String get incorrectPinMsg => 'Incorrect PIN. Please try again.';

  @override
  String get enterYourNameOpt => 'Enter your name (Optional)';

  @override
  String get enterSuperPin => 'Enter Super PIN';

  @override
  String get onlyPinYouNeedToRemember => 'Only pin you need to remember';

  @override
  String get confirmYourPin => 'Confirm Super PIN';

  @override
  String get greetings => 'Welecome back';

  @override
  String get yourName => 'Your name';

  @override
  String get safetyScore => 'Safety score';

  @override
  String totalPassword(int value) {
    return '$value Passwords';
  }

  @override
  String get categories => 'Categories';

  @override
  String get availableAvatars => 'Available avatars';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get recentlyAdded => 'Recently Added';

  @override
  String get card => 'Card';

  @override
  String get cards => 'Cards';

  @override
  String get login => 'Login';

  @override
  String get addAccounts => 'Add Accounts';

  @override
  String get accountType => 'Account type';

  @override
  String get siteNameHelperText => 'Site name (eg. Google, Facebook)';

  @override
  String get emailUserNameNumberHelperText => 'Email or Username or Number';

  @override
  String get password => 'Password';

  @override
  String get bankName => 'Bank name';

  @override
  String get holderName => 'Holder name';

  @override
  String get expireOn => 'Expire on';

  @override
  String get greenPin => 'Green pin';

  @override
  String get addSuccessfully => 'Added successfully';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get add => 'Add';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get all => 'All';

  @override
  String get error => 'Error';

  @override
  String get deleteWarning => 'This action can\'t be undone';

  @override
  String get writeNoteHelperText => 'Write notes';

  @override
  String get pwEncrptionAlgorithm => 'Password encrpytion algorithm';

  @override
  String get pwEncryptionAlgorithmSubtitle =>
      'By changing the encryption algorithm, your exisiting passwords will not be affected. However, new passwords will be encrypted using the selected algorithm.';

  @override
  String get pwGenerator => 'Password Generator';

  @override
  String get includeNumbers => 'Include Numbers';

  @override
  String get includeSymbols => 'Include Symbols';

  @override
  String get copied => 'Copied';

  @override
  String get security => 'Security';

  @override
  String get securitySubtitle => 'Change password, self-destrution';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle => 'Change Languages';
}
