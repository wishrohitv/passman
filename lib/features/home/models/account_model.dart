import 'package:hive_ce/hive.dart';
part 'account_model.g.dart';

@HiveType(typeId: 0)
class AccountModel {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String siteName;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String password;
  @HiveField(4)
  late String note;
  @HiveField(5)
  late String accountType;
  @HiveField(6)
  late String icon;
  @HiveField(7)
  late String encryptionAlgorithm;

  @override
  String toString() {
    return """
    AccountModel {
      id: $id,
      siteName: $siteName,
      email: $email,
      password: $password,
      note: $note,
      accountType: $accountType,
      icon: $icon,
      encryptionAlgorithm: $encryptionAlgorithm
    }
    """;
  }
}
