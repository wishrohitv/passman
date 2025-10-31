import 'package:hive_ce/hive.dart';
part 'card_model.g.dart';

@HiveType(typeId: 1)
class CardModel {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String bankName;
  @HiveField(2)
  late String holderName;
  @HiveField(3)
  late String cardNumber;
  @HiveField(4)
  late String greenPin;
  @HiveField(5)
  late String cvvPin;
  @HiveField(6)
  late String expiryDate; // [YYYY, MM]
  @HiveField(7)
  late String note;
  @HiveField(8)
  late String encryptionAlgorithm;

  @override
  String toString() {
    return """
      CardModel(
        bankName: $bankName,
        holderName: $holderName,
        cardNumber: $cardNumber,
        greenPin: $greenPin,
        cvvPin: $cvvPin,
        expiryDate: $expiryDate,
        note: $note,
        encryptionAlgorithm: $encryptionAlgorithm,
      )
    """;
  }
}
