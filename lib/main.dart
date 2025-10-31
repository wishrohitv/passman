import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
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
  runApp(PassManagerApp());
}

class PassManagerApp extends StatelessWidget {
  const PassManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ], //2. registered route observer
        theme: lightTheme,
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
        ), //BottomNavBarPage(),
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
