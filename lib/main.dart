import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:passman/core/config/constants.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/core/themes/light_theme.dart';
import 'package:passman/features/auth/repositories/auth_local_repository.dart';
import 'package:passman/features/auth/view/pages/verify_pin_page.dart';
import 'package:passman/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:passman/features/auth/view/pages/setup_page.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:passman/hive_registrar.g.dart';
import 'package:passman/l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
  Hive
    ..init(path.path)
    ..registerAdapters();
  await Hive.openBox(
    Constants.settingDbName,
    encryptionCipher: HiveAesCipher(utf8.encode(Constants.settingDbEncryptKey)),
  );
  final authLocalRepository = AuthLocalRepository();
  await Future.delayed(Duration(milliseconds: 1));
  await Hive.openBox(
    Constants.dbName,
    encryptionCipher: HiveAesCipher(
      Utf8Encoder().convert(authLocalRepository.accountDbEncryptionKey),
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: PassManagerApp(),
    ),
  );
}

class PassManagerApp extends StatelessWidget {
  const PassManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewmodelProvider = Provider.of<AuthViewmodel>(
      context,
      listen: true,
    );
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: true,
    );

    return MaterialApp(
      key: ValueKey(settingsProvider.appLanguage),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: lightTheme,
      localeResolutionCallback: (locale, supportedLocales) {
        return locale;
      },
      locale: settingsProvider.appLanguage,

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      home: buildLayout(authViewmodelProvider.appPassword),
    );
  }

  Widget buildLayout(String? pw) {
    if (pw == null) {
      return SetupPage();
    } else {
      return VerifyPinPage();
    }
  }
}
