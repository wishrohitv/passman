// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '密码管家';

  @override
  String get acceptTerm => '同意隐私政策和条款';

  @override
  String get continueBtn => '继续';

  @override
  String get verifyItsYou => '验证您的身份';

  @override
  String get incorrectPinMsg => 'PIN码错误。请再试一次。';

  @override
  String get greetings => '欢迎回来';

  @override
  String get yourName => '您的名字';

  @override
  String get safetyScore => '安全评分';

  @override
  String totalPassword(int value) {
    return '$value 个密码';
  }

  @override
  String get categories => '类别';

  @override
  String get availableAvatars => '可用头像';

  @override
  String get enterYourName => '输入您的名字';

  @override
  String get security => '安全';

  @override
  String get securitySubtitle => '修改密码，自毁选项';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle => '更改语言';
}
