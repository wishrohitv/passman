import 'package:hive_ce/hive.dart';
import 'package:passman/core/config/constants.dart';

class HomeLocalRepository {
  final Box _box = Hive.box(Constants.dbName);
  Iterable<dynamic> _acounts = [];

  // HomeLocalRepository._(this._box);

  // static Future<HomeLocalRepository> init() async {
  //   final authLocalRepository = await AuthLocalRepository.init();
  //   await Future.delayed(Duration(milliseconds: 1));
  //   final box = await Hive.openBox(
  //     Constants.dbName,
  //     encryptionCipher: HiveAesCipher(
  //       Utf8Encoder().convert(authLocalRepository.accountDbEncryptionKey!),
  //     ),
  //   );
  //   final repo = HomeLocalRepository._(box);
  //   repo._loadValue();
  //   return repo;
  // }
  HomeLocalRepository() {
    _loadValue();
  }

  void _loadValue() {
    _acounts = getAccount();
  }

  Iterable<dynamic> get accounts {
    return _acounts;
  }

  Future<void> addAccount(int id, account) async {
    await _box.put(id, account);
    _loadValue();
  }

  Iterable<dynamic> getAccount() {
    final account = _box.values;
    // return reversed list
    return account.toList().reversed;
  }

  Future<void> deleteAccounts(int id) async {
    await _box.delete(id);
    _loadValue();
  }

  Future<void> destroyDatabase() async {
    await _box.deleteFromDisk();
  }
}
