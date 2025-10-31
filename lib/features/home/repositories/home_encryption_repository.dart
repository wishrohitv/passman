import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt/aes.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt/xor.dart';
import 'package:passman/core/config/constants.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/core/enum/encryption_type_enum.dart';

class HomeEncryptionRepository {
  Future<String> hashData(String data) async {
    var key = utf8.encode(Constants.settingDbEncryptKey);
    var bytes = utf8.encode(data);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    // print("HMAC digest as bytes: ${digest.bytes}");
    // print("HMAC digest as hex string: $digest");
    return digest.toString();
  }

  late EncryptDecryptData _encryptDecryptData;
  Future<String?> encryptData({
    required EncryptionTypeEnum encryptionType,
    required String plainText,
    required String secretKey,
  }) async {
    if (encryptionType == EncryptionTypeEnum.aes256cbc) {
      _encryptDecryptData = AES256CBC(iv: SettingsProvider().initialVector);
      final encryptedText = await _encryptDecryptData.encryptData(
        secretKey: secretKey,
        plainText: plainText,
      );
      return encryptedText;
    } else if (encryptionType == EncryptionTypeEnum.xor) {
      _encryptDecryptData = XorEncryption();
      final excryptedText = await _encryptDecryptData.encryptData(
        secretKey: secretKey,
        plainText: plainText,
      );
      return excryptedText;
    } else {
      return throw UnimplementedError();
    }
  }

  Future<String?> decryptData({
    required EncryptionTypeEnum encryptionType,
    required String encryptedText,
    required String secretKey,
  }) async {
    if (encryptionType == EncryptionTypeEnum.aes256cbc) {
      _encryptDecryptData = AES256CBC(iv: SettingsProvider().initialVector);
      final decryptedText = await _encryptDecryptData.decryptData(
        secretKey: secretKey,
        encryptedText: encryptedText,
      );
      return decryptedText;
    } else if (encryptionType == EncryptionTypeEnum.xor) {
      _encryptDecryptData = XorEncryption();
      final decryptedText = await _encryptDecryptData.decryptData(
        secretKey: secretKey,
        encryptedText: encryptedText,
      );
      return decryptedText;
    } else {
      return throw UnimplementedError();
    }
  }
}

abstract class EncryptDecryptData {
  Future<String?> encryptData({
    required String secretKey,
    required String plainText,
  });

  Future<String?> decryptData({
    required String secretKey,
    required String encryptedText,
  });
}

class AES256CBC extends EncryptDecryptData {
  AES256CBC({required this.iv});
  final String iv;
  @override
  Future<String?> encryptData({
    required String secretKey,
    required String plainText,
  }) async {
    AES aes = AES(secretKey: secretKey, iv: iv);
    String? encryptedText = await aes.encryptAES256CBC(plainText);
    return encryptedText;
  }

  @override
  Future<String?> decryptData({
    required String secretKey,
    required String encryptedText,
  }) async {
    AES aes = AES(secretKey: secretKey, iv: iv);
    String? decryptedText = await aes.decryptAES256CBC(encryptedText);
    return decryptedText;
  }
}

class XorEncryption extends EncryptDecryptData {
  XOR xor = XOR();

  @override
  Future<String?> encryptData({
    required String secretKey,
    required String plainText,
  }) async {
    String encryptTxt = xor.xorEncode(plainText, secretKey: secretKey);
    return encryptTxt;
  }

  @override
  Future<String?> decryptData({
    required String secretKey,
    required String encryptedText,
  }) async {
    String decryptTxt = xor.xorDecode(encryptedText, secretKey: secretKey);
    return decryptTxt;
  }
}
