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
  String get security => 'Security';

  @override
  String get securitySubtitle => 'Change password, self-destrution';

  @override
  String language(String selectedLanguage) {
    return 'Language $selectedLanguage';
  }

  @override
  String get languageSubtitle => 'Change Languages';
}
