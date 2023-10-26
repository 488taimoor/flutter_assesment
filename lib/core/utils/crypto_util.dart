///Utils to enable cryptography


// import 'dart:convert';
// import 'dart:developer';

// import 'package:encrypt/encrypt.dart';


// class CryptoUtil {
//   CryptoUtil._() {
//     final secretKey = AppConfig.cryptoSecretKey;
//     final secretIV = AppConfig.cryptoSecretIV;
//     final keyUtf8 = utf8.encode(secretKey);
//     final ivUtf8 = utf8.encode(secretIV);
//     final key = sha256.convert(keyUtf8).toString().substring(0, 32);
//     final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
//     _iv = IV.fromUtf8(iv);
//     _encryptor = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
//   }

//   static final CryptoUtil instance = CryptoUtil._();

//   late IV _iv;
//   late Encrypter _encryptor;

//   String? encrypt(String value) {
//     try {
//       return value.isNotEmpty
//           ? _encryptor.encrypt(value, iv: _iv).base64
//           : value;
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }

//   String? decrypt(String base64value) {
//     try {
//       final encrypted = Encrypted.fromBase64(base64value);
//       return _encryptor.decrypt(encrypted, iv: _iv);
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }

//   // static bool _isBase64(String value) {
//   //   if (value.runtimeType == String) {
//   //     final rx = RegExp(
//   //       r'^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$',
//   //       multiLine: true,
//   //       unicode: true,
//   //     );
//   //     final isBase64Valid = rx.hasMatch(value);

//   //     if (isBase64Valid == true) {
//   //       return true;
//   //     } else {
//   //       return false;
//   //     }
//   //   } else {
//   //     return false;
//   //   }
//   // }
// }
