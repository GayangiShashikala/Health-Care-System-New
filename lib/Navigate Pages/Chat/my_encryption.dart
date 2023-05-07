import 'package:encrypt/encrypt.dart';

class EncryptData {
  final key = Key.fromUtf8('my 32 length key................');
  final iv = IV.fromLength(16);
  late Encrypted en;

  encryptAES(String plainText) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    en = Encrypted.fromBase64(encrypted.base64);

    return encrypted.base64;
  }

  String decryptAES(Encrypted message) {
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(message, iv: iv);
    return decrypted;
  }

  Encrypted setEncrypted(String encryptedString) {
    return Encrypted.from64(encryptedString);
  }
}