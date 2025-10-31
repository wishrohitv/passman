import 'package:hive_ce/hive.dart';
import 'package:passman/core/config/constants.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/core/utils/gen_random_text.dart';

class AuthLocalRepository {
  final Box _box = Hive.box(Constants.settingDbName);

  String? get userName => _box.get("userName");
  String get selectedAvatar => _box.get("selectedAvatar");
  String? get appPassword {
    return _box.get("appPassword");
  }

  String get encryptionAlgorithm {
    // Ensure a default value is set
    String? ea = _box.get("encryptionAlgorithm");
    if (ea == null || ea.isEmpty) {
      ea = SettingsProvider().selectedEncryptionAlgorithm.name;
      addEncryptionAlgorithm(ea);
    }
    return ea;
  }

  String get accountDbEncryptionKey {
    String? ec = _box.get("accountDbEncryptionKey");
    if (ec == null || ec.isEmpty) {
      ec = generateRandomText();
      addAccountDbEncryptionKey(ec);
    }
    return ec;
  }

  String get pwEncryptionKey {
    String? pw = _box.get("pwEncryptionKey");
    if (pw == null || pw.isEmpty) {
      pw = generateRandomText();
      addPwEncryptionKey(pw);
    }
    return pw;
  }

  // AuthLocalRepository._(this._box);

  // /// Factory-style async initializer
  // static Future<AuthLocalRepository> init() async {
  //   final box = await Hive.openBox(
  //     Constants.settingDbName,
  //     encryptionCipher: HiveAesCipher(
  //       utf8.encode(Constants.settingDbEncryptKey),
  //     ),
  //   );

  //   final repo = AuthLocalRepository._(box);

  //   return repo;
  // }

  // ---- Updaters ----
  Future<void> addUserName(String value) async {
    await _box.put("userName", value);
  }

  Future<void> addSelectedAvatar(String value) async {
    await _box.put("selectedAvatar", value);
  }

  Future<void> addAppPassword(String value) async {
    await _box.put("appPassword", value);
  }

  Future<void> addEncryptionAlgorithm(String value) async {
    await _box.put("encryptionAlgorithm", value);
  }

  Future<void> addAccountDbEncryptionKey(String value) async {
    await _box.put("accountDbEncryptionKey", value);
  }

  Future<void> addPwEncryptionKey(String value) async {
    await _box.put("pwEncryptionKey", value);
  }
}
