// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'PassMan';

  @override
  String get acceptTerm => 'Aceptar la política y los términos';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get verifyItsYou => 'Verifica que eres tú';

  @override
  String get incorrectPinMsg => 'PIN incorrecto. Inténtalo de nuevo.';

  @override
  String get greetings => 'Bienvenido de nuevo';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get safetyScore => 'Puntaje de seguridad';

  @override
  String totalPassword(int value) {
    return '$value Contraseñas';
  }

  @override
  String get categories => 'Categorías';

  @override
  String get availableAvatars => 'Avatares disponibles';

  @override
  String get enterYourName => 'Introduce tu nombre';

  @override
  String get security => 'Seguridad';

  @override
  String get securitySubtitle => 'Cambiar contraseña, autodestrucción';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Cambiar idioma';
}
