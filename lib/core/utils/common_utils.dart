import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CommonUtils {
  Future<bool> checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
    return false;
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool validatePhoneNumber(String value) {
    String pattern = r'(^[0-9]{8,15}$)';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String maskPhoneCharacters(String inputString) {
    const maskLength = 6;
    if (inputString.length <= maskLength) {
      /// Mask the entire string if it's shorter or equal to 6 characters
      return '*' * inputString.length;
    } else {
      String maskedPart = '*' * maskLength;
      String remainingPart = inputString.substring(maskLength);
      return maskedPart + remainingPart;
    }
  }

  static String maskCardNumberCharacters(String inputString) {
    const maskLength = 4;
    if (inputString.length <= maskLength) {
      /// Mask the entire string if it's shorter or equal to 6 characters
      return 'x' * inputString.length;
    } else {
      String maskedPart = 'x' * maskLength;
      String remainingPart = inputString.substring(inputString.length - 5);
      return maskedPart + remainingPart;
    }
  }

  ///To convert Svg Icon to marker using
  // static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
  //   BuildContext context,
  //   String assetName, [
  //   Size size = const Size(35, 35),
  // ]) async {
  //   final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);
  //   double devicePixelRatio = 0;
  //   if (context.mounted) {
  //     devicePixelRatio = View.of(context).devicePixelRatio;
  //   }
  //   int width = (size.width * devicePixelRatio).toInt();
  //   int height = (size.height * devicePixelRatio).toInt();
  //   final scaleFactor =
  //       min(width / pictureInfo.size.width, height / pictureInfo.size.height);
  //   final recorder = PictureRecorder();
  //   Canvas(recorder)
  //     ..scale(scaleFactor)
  //     ..drawPicture(pictureInfo.picture);
  //   final rasterPicture = recorder.endRecording();
  //   final image = rasterPicture.toImageSync(width, height);
  //   final bytes = (await image.toByteData(format: ImageByteFormat.png))!;
  //   return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  // }

  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  // Function for mask the given text except last four letters
  static String maskStringExceptLastFour(String text) {
    if (text.length <= 4) {
      return text; // No need to mask if string length is 4 or less
    }
    String maskedPart =
        '*' * (text.length - 4); // Mask all letters except last 4
    String lastFour = text.substring(text.length - 4); // Get the last 4 letters
    return maskedPart + lastFour;
  }
}
