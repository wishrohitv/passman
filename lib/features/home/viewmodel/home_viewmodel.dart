import 'package:flutter/widgets.dart';
import 'package:passman/core/enum/encryption_type_enum.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/features/home/repositories/home_encryption_repository.dart';
import 'package:passman/features/home/repositories/home_local_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final HomeLocalRepository _homeLocalRepository = HomeLocalRepository();
  final SettingsProvider _settingsProvider = SettingsProvider();
  final HomeEncryptionRepository _homeEncryptionRepository =
      HomeEncryptionRepository();

  HomeViewmodel() {
    init();
  }
  void init() {
    _acounts = getAccount();
    notifyListeners();
  }

  Iterable<dynamic> _acounts = [];
  Iterable<dynamic> get accounts {
    return _acounts;
  }

  Future<void> addAccount(int id, account) async {
    await _homeLocalRepository.addAccount(id, account);
    _acounts = _homeLocalRepository.accounts;
    notifyListeners();
  }

  Iterable<dynamic> getAccount() {
    final account = _homeLocalRepository.getAccount();
    return account;
  }

  Future<void> deleteAccounts(int id) async {
    await _homeLocalRepository.deleteAccounts(id);
    _acounts = _homeLocalRepository.accounts;
    notifyListeners();
  }

  void destroyDatabase() async {
    await _homeLocalRepository.destroyDatabase();
    notifyListeners();
  }

  Future<String?> encryptData(String data) async {
    final ecData = await _homeEncryptionRepository.encryptData(
      encryptionType: SettingsProvider().selectedEncryptionAlgorithm,
      plainText: data,
      secretKey: SettingsProvider().pwEncrypitionKey,
    );
    return ecData;
  }

  Future<String?> decryptData(String data, EncryptionTypeEnum ecType) async {
    final ecData = await _homeEncryptionRepository.decryptData(
      encryptionType: ecType,
      encryptedText: data,
      secretKey: _settingsProvider.pwEncrypitionKey,
    );
    return ecData;
  }

  Future<String> hashData(String text) async {
    final hashed = await _homeEncryptionRepository.hashData(text);
    return hashed;
  }
}
