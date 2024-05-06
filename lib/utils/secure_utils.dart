// import 'dart:convert';
// import 'dart:math';
//
// import 'package:encrypt/encrypt.dart';
//
// class SecurityUtil {
//   static final Key _key = Key.fromBase64(generateSecureKey());
//   static final IV _iv = IV.fromBase64(generateSecureIV());
//   static final Encrypter _encrypter = Encrypter(AES(_key, mode: AESMode.cbc));
//
//   static String generateSecureKey() {
//     var rnd = Random.secure();
//     var keyBytes = List<int>.generate(16, (i) => rnd.nextInt(256));
//     return base64UrlEncode(keyBytes);
//   }
//
//   static String generateSecureIV() {
//     var rnd = Random.secure();
//     var ivBytes = List<int>.generate(16, (i) => rnd.nextInt(256));
//     return base64UrlEncode(ivBytes);
//   }
//
//   static String encrypt(String text) {
//     final encrypted = _encrypter.encrypt(text, iv: _iv);
//     return encrypted.base64;
//   }
//
//   static String decrypt(String encryptedText) {
//     final decrypted = _encrypter.decrypt64(encryptedText, iv: _iv);
//     return decrypted;
//   }
// }
