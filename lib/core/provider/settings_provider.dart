import 'package:flutter/material.dart';
import 'package:passman/core/config/constants.dart';
import 'package:passman/core/enum/encryption_type_enum.dart';

class SettingsProvider extends ChangeNotifier {
  static final SettingsProvider _instance = SettingsProvider._internal();
  SettingsProvider._internal();

  String userName = "";
  String userSelectedAvatar = Constants.avalaibleAvatars.first;
  String? appPassword;
  EncryptionTypeEnum selectedEncryptionAlgorithm = EncryptionTypeEnum.aes256cbc;

  late String accountDbEncrypitionKey;
  late String pwEncrypitionKey;

  String initialVector = "keepYourKeySafeBroAndKeyLength32";

  set setUserName(String name) {
    userName = name;
  }

  set setUserSelectedAvatar(String avatar) {
    userSelectedAvatar = avatar;
  }

  set setAppPassword(String password) {
    appPassword = password;
  }

  set setSelectedEncryptionAlgorithm(EncryptionTypeEnum type) {
    selectedEncryptionAlgorithm = type;
  }

  set setAccountDbEncrypitionKey(String key) {
    accountDbEncrypitionKey = key;
  }

  set setPwEncrypitionKey(String key) {
    pwEncrypitionKey = key;
  }

  set setInitialVector(String vector) {
    initialVector = vector;
  }

  factory SettingsProvider() {
    return _instance;
  }
}
