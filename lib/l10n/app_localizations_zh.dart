// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'PassMan';

  @override
  String get acceptTerm => '同意政策和条款';

  @override
  String get continueBtn => '继续';

  @override
  String get verifyItsYou => '验证您的身份';

  @override
  String get incorrectPinMsg => 'PIN码不正确。请再试一次。';

  @override
  String get enterYourNameOpt => '输入您的名字（可选）';

  @override
  String get enterSuperPin => '输入超级PIN码';

  @override
  String get onlyPinYouNeedToRemember => '唯一需要记住的PIN码';

  @override
  String get confirmYourPin => '确认超级PIN码';

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
  String get recentlyAdded => '最近添加';

  @override
  String get card => '卡片';

  @override
  String get cards => '卡片';

  @override
  String get login => '登录';

  @override
  String get addAccounts => '添加账户';

  @override
  String get accountType => '账户类型';

  @override
  String get siteNameHelperText => '网站名称（例如 Google, Facebook）';

  @override
  String get emailUserNameNumberHelperText => '电子邮件 或 用户名 或 手机号';

  @override
  String get password => '密码';

  @override
  String get bankName => '银行名称';

  @override
  String get holderName => '持有人姓名';

  @override
  String get expireOn => '有效期至';

  @override
  String get greenPin => '绿色PIN';

  @override
  String get addSuccessfully => '添加成功';

  @override
  String get somethingWentWrong => '出了点问题';

  @override
  String get add => '添加';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get all => '全部';

  @override
  String get error => '错误';

  @override
  String get deleteWarning => '此操作无法撤销';

  @override
  String get writeNoteHelperText => '写备注';

  @override
  String get pwEncrptionAlgorithm => '密码加密算法';

  @override
  String get pwEncryptionAlgorithmSubtitle => '更改加密算法不会影响您已有的密码。但新密码将使用所选算法加密。';

  @override
  String get pwGenerator => '密码生成器';

  @override
  String get includeNumbers => '包含数字';

  @override
  String get includeSymbols => '包含符号';

  @override
  String get copied => '已复制';

  @override
  String get security => '安全';

  @override
  String get securitySubtitle => '更改密码，自毁功能';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle => '更改语言';
}
