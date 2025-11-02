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
  String get incorrectPinMsg => 'Неверный PIN. Пожалуйста, попробуйте снова.';

  @override
  String get enterYourNameOpt => 'Введите ваше имя (необязательно)';

  @override
  String get enterSuperPin => 'Введите супер-PIN';

  @override
  String get onlyPinYouNeedToRemember =>
      'Единственный PIN, который вам нужно запомнить';

  @override
  String get confirmYourPin => 'Подтвердите супер-PIN';

  @override
  String get greetings => 'С возвращением';

  @override
  String get yourName => 'Ваше имя';

  @override
  String get safetyScore => 'Оценка безопасности';

  @override
  String totalPassword(int value) {
    return '$value Паролей';
  }

  @override
  String get categories => 'Категории';

  @override
  String get availableAvatars => 'Доступные аватары';

  @override
  String get enterYourName => 'Введите ваше имя';

  @override
  String get recentlyAdded => 'Недавно добавлено';

  @override
  String get card => 'Карта';

  @override
  String get cards => 'Карты';

  @override
  String get login => 'Войти';

  @override
  String get addAccounts => 'Добавить аккаунты';

  @override
  String get accountType => 'Тип аккаунта';

  @override
  String get siteNameHelperText =>
      'Название сайта (например: Google, Facebook)';

  @override
  String get emailUserNameNumberHelperText =>
      'Эл. почта или имя пользователя или номер';

  @override
  String get password => 'Пароль';

  @override
  String get bankName => 'Название банка';

  @override
  String get holderName => 'Имя держателя';

  @override
  String get expireOn => 'Действителен до';

  @override
  String get greenPin => 'Зелёный PIN';

  @override
  String get addSuccessfully => 'Успешно добавлено';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';

  @override
  String get add => 'Добавить';

  @override
  String get delete => 'Удалить';

  @override
  String get cancel => 'Отмена';

  @override
  String get all => 'Все';

  @override
  String get error => 'Ошибка';

  @override
  String get deleteWarning => 'Это действие нельзя отменить';

  @override
  String get writeNoteHelperText => 'Напишите заметку';

  @override
  String get pwEncrptionAlgorithm => 'Алгоритм шифрования пароля';

  @override
  String get pwEncryptionAlgorithmSubtitle =>
      'Изменение алгоритма шифрования не повлияет на существующие пароли. Однако новые пароли будут зашифрованы с использованием выбранного алгоритма.';

  @override
  String get pwGenerator => 'Генератор паролей';

  @override
  String get includeNumbers => 'Включить цифры';

  @override
  String get includeSymbols => 'Включить символы';

  @override
  String get copied => 'Скопировано';

  @override
  String get security => 'Безопасность';

  @override
  String get securitySubtitle => 'Изменить пароль, функция самоуничтожения';

  @override
  String get language => 'Язык';

  @override
  String get languageSubtitle => 'Изменить язык';
}
