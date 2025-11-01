// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'PassMan';

  @override
  String get acceptTerm => 'Согласиться с политикой и условиями';

  @override
  String get continueBtn => 'Продолжить';

  @override
  String get verifyItsYou => 'Подтвердите, что это вы';

  @override
  String get incorrectPinMsg => 'Неверный PIN. Попробуйте снова.';

  @override
  String get greetings => 'С возвращением';

  @override
  String get yourName => 'Ваше имя';

  @override
  String get safetyScore => 'Оценка безопасности';

  @override
  String totalPassword(int value) {
    return '$value паролей';
  }

  @override
  String get categories => 'Категории';

  @override
  String get availableAvatars => 'Доступные аватары';

  @override
  String get enterYourName => 'Введите ваше имя';

  @override
  String get security => 'Безопасность';

  @override
  String get securitySubtitle => 'Сменить пароль, самоуничтожение';

  @override
  String language(String selectedLanguage) {
    return 'Язык $selectedLanguage';
  }

  @override
  String get languageSubtitle => 'Сменить язык';
}
