import 'package:flutter/material.dart';
import 'package:passman/core/enum/encryption_type_enum.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/features/auth/repositories/auth_local_repository.dart';
import 'package:passman/features/home/repositories/home_encryption_repository.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthLocalRepository _authLocalRepository = AuthLocalRepository();
  final SettingsProvider _settingsProvider = SettingsProvider();
  final HomeEncryptionRepository _homeEncryptionRepository =
      HomeEncryptionRepository();

  AuthViewmodel() {
    init();
  }
  void init() {
    // Assign initial values to gloable settings provdier
    _settingsProvider
      ..setUserName = _authLocalRepository.userName ?? ""
      ..setUserSelectedAvatar = _authLocalRepository.selectedAvatar
      ..appPassword = _authLocalRepository.appPassword
      ..setAccountDbEncrypitionKey = _authLocalRepository.accountDbEncryptionKey
      ..setSelectedEncryptionAlgorithm = EncryptionTypeEnum.values.byName(
        _authLocalRepository.encryptionAlgorithm,
      )
      ..pwEncrypitionKey = _authLocalRepository.pwEncryptionKey
      ..setAppLanguage = _authLocalRepository.appLanguage;
    notifyListeners();
  }

  String? get appPassword => _authLocalRepository.appPassword;
  String? get appLanguage => _authLocalRepository.appLanguage;
  Future<void> addUserName(String value) async {
    await _authLocalRepository.addUserName(value);
    _settingsProvider.setUserName = value;
    notifyListeners();
  }

  Future<void> addSelectedAvatar(String value) async {
    await _authLocalRepository.addSelectedAvatar(value);
    _settingsProvider.setUserSelectedAvatar = value;
    notifyListeners();
  }

  Future<void> addAppPassword(String value) async {
    await _authLocalRepository.addAppPassword(
      await _homeEncryptionRepository.hashData(value),
    );
    notifyListeners();
  }

  Future<void> addEncryptionAlgorithm(String value) async {
    await _authLocalRepository.addEncryptionAlgorithm(value);

    notifyListeners();
  }

  Future<void> addAccontDbEncryptionKey(String value) async {
    await _authLocalRepository.addAccountDbEncryptionKey(value);
    notifyListeners();
  }

  Future<void> addPwEncryptionKey(String value) async {
    await _authLocalRepository.addPwEncryptionKey(value);
    notifyListeners();
  }

  Future<void> addAppLanguage(String ln) async {
    await _authLocalRepository.addAppLanguage(ln);
    _settingsProvider.setAppLanguage = ln;
    notifyListeners();
  }
}
