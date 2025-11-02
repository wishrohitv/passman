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
  String get incorrectPinMsg =>
      'PIN incorrecto. Por favor, inténtalo de nuevo.';

  @override
  String get enterYourNameOpt => 'Introduce tu nombre (Opcional)';

  @override
  String get enterSuperPin => 'Introduce el Super PIN';

  @override
  String get onlyPinYouNeedToRemember => 'El único PIN que necesitas recordar';

  @override
  String get confirmYourPin => 'Confirma el Super PIN';

  @override
  String get greetings => 'Bienvenido de nuevo';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get safetyScore => 'Puntuación de seguridad';

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
  String get recentlyAdded => 'Añadido recientemente';

  @override
  String get card => 'Tarjeta';

  @override
  String get cards => 'Tarjetas';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get addAccounts => 'Añadir cuentas';

  @override
  String get accountType => 'Tipo de cuenta';

  @override
  String get siteNameHelperText =>
      'Nombre del sitio (por ejemplo: Google, Facebook)';

  @override
  String get emailUserNameNumberHelperText =>
      'Correo electrónico o nombre de usuario o número';

  @override
  String get password => 'Contraseña';

  @override
  String get bankName => 'Nombre del banco';

  @override
  String get holderName => 'Nombre del titular';

  @override
  String get expireOn => 'Caduca en';

  @override
  String get greenPin => 'PIN verde';

  @override
  String get addSuccessfully => 'Añadido con éxito';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get add => 'Añadir';

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get all => 'Todo';

  @override
  String get error => 'Error';

  @override
  String get deleteWarning => 'Esta acción no se puede deshacer';

  @override
  String get writeNoteHelperText => 'Escribe notas';

  @override
  String get pwEncrptionAlgorithm => 'Algoritmo de encriptación de contraseña';

  @override
  String get pwEncryptionAlgorithmSubtitle =>
      'Al cambiar el algoritmo de encriptación, tus contraseñas existentes no se verán afectadas. Sin embargo, las nuevas contraseñas serán encriptadas usando el algoritmo seleccionado.';

  @override
  String get pwGenerator => 'Generador de contraseñas';

  @override
  String get includeNumbers => 'Incluir números';

  @override
  String get includeSymbols => 'Incluir símbolos';

  @override
  String get copied => 'Copiado';

  @override
  String get security => 'Seguridad';

  @override
  String get securitySubtitle => 'Cambiar contraseña, autodestrucción';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Cambiar idioma';
}
