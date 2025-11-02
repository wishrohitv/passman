import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bho.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bho'),
    Locale('en'),
    Locale('es'),
    Locale('hi'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// Name of the app
  ///
  /// In en, this message translates to:
  /// **'PassMan'**
  String get appName;

  /// Policy and terms of the app
  ///
  /// In en, this message translates to:
  /// **'Agree to the policy and terms'**
  String get acceptTerm;

  /// Click on the continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// Verify it's you
  ///
  /// In en, this message translates to:
  /// **'Verify it\'s you'**
  String get verifyItsYou;

  /// Incorrect pin warning
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN. Please try again.'**
  String get incorrectPinMsg;

  /// Placeholder value for textfied
  ///
  /// In en, this message translates to:
  /// **'Enter your name (Optional)'**
  String get enterYourNameOpt;

  /// Super pin for app
  ///
  /// In en, this message translates to:
  /// **'Enter Super PIN'**
  String get enterSuperPin;

  ///
  ///
  /// In en, this message translates to:
  /// **'Only pin you need to remember'**
  String get onlyPinYouNeedToRemember;

  /// Confirm Super PIN
  ///
  /// In en, this message translates to:
  /// **'Confirm Super PIN'**
  String get confirmYourPin;

  /// Greeting message for users
  ///
  /// In en, this message translates to:
  /// **'Welecome back'**
  String get greetings;

  /// Place holder for user name
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourName;

  /// Sefety score benchmak for passwords
  ///
  /// In en, this message translates to:
  /// **'Safety score'**
  String get safetyScore;

  /// Total password stored by user
  ///
  /// In en, this message translates to:
  /// **'{value} Passwords'**
  String totalPassword(int value);

  /// Categories of Accounts and Cards
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Avalable avatars
  ///
  /// In en, this message translates to:
  /// **'Available avatars'**
  String get availableAvatars;

  /// Hint text for text field
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// Recently Added
  ///
  /// In en, this message translates to:
  /// **'Recently Added'**
  String get recentlyAdded;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @addAccounts.
  ///
  /// In en, this message translates to:
  /// **'Add Accounts'**
  String get addAccounts;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account type'**
  String get accountType;

  /// No description provided for @siteNameHelperText.
  ///
  /// In en, this message translates to:
  /// **'Site name (eg. Google, Facebook)'**
  String get siteNameHelperText;

  /// No description provided for @emailUserNameNumberHelperText.
  ///
  /// In en, this message translates to:
  /// **'Email or Username or Number'**
  String get emailUserNameNumberHelperText;

  /// Password of site
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Bank name of card
  ///
  /// In en, this message translates to:
  /// **'Bank name'**
  String get bankName;

  /// Holder name of card
  ///
  /// In en, this message translates to:
  /// **'Holder name'**
  String get holderName;

  /// Expiry of  card
  ///
  /// In en, this message translates to:
  /// **'Expire on'**
  String get expireOn;

  /// Green pin
  ///
  /// In en, this message translates to:
  /// **'Green pin'**
  String get greenPin;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Added successfully'**
  String get addSuccessfully;

  /// error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// add btn
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// delete btn
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// delete btn
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// all btn
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// all btn
  ///
  /// In en, this message translates to:
  /// **'This action can\'t be undone'**
  String get deleteWarning;

  /// Write note helper text
  ///
  /// In en, this message translates to:
  /// **'Write notes'**
  String get writeNoteHelperText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Password encrpytion algorithm'**
  String get pwEncrptionAlgorithm;

  /// No description provided for @pwEncryptionAlgorithmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'By changing the encryption algorithm, your exisiting passwords will not be affected. However, new passwords will be encrypted using the selected algorithm.'**
  String get pwEncryptionAlgorithmSubtitle;

  /// Password generator title
  ///
  /// In en, this message translates to:
  /// **'Password Generator'**
  String get pwGenerator;

  /// No description provided for @includeNumbers.
  ///
  /// In en, this message translates to:
  /// **'Include Numbers'**
  String get includeNumbers;

  /// No description provided for @includeSymbols.
  ///
  /// In en, this message translates to:
  /// **'Include Symbols'**
  String get includeSymbols;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// Security
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// Helper text for describe seturity button features
  ///
  /// In en, this message translates to:
  /// **'Change password, self-destrution'**
  String get securitySubtitle;

  /// Langauge button tile
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Subtitle text for language
  ///
  /// In en, this message translates to:
  /// **'Change Languages'**
  String get languageSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bho',
    'en',
    'es',
    'hi',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bho':
      return AppLocalizationsBho();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'hi':
      return AppLocalizationsHi();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
