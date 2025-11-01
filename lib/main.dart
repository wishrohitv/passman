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

class PassManagerApp extends StatefulWidget {
  const PassManagerApp({super.key});

  @override
  State<PassManagerApp> createState() => _PassManagerAppState();
}

class _PassManagerAppState extends State<PassManagerApp> {
  Map<String, Locale> avl = {
    "bho": Locale('bho'),
    "en": Locale('en'),
    "es": Locale('es'),
    "hi": Locale('hi'),
    "ru": Locale('ru'),
    "zh": Locale('zh'),
  };

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: true,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: lightTheme,
      localeResolutionCallback: (locale, supportedLocales) {
        return locale;
      },
      locale: avl[settingsProvider.appLanguage],

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      home: FutureBuilder(
        future: _isUser(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasData || snapshot.data != null) {
            return snapshot.data! ? VerifyPinPage() : SetupPage();
          } else {
            return Text("Something went wrong in the app");
          }
        },
      ),
    );
  }

  Future<bool> _isUser(BuildContext context) async {
    final authViewmodelProvider = AuthViewmodel();
    if (authViewmodelProvider.appPassword != null) {
      return true;
    } else {
      return false;
    }
  }
}
