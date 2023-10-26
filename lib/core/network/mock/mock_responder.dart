import 'dart:convert';

import 'package:flutter/services.dart';

class MockResponder {
  final Duration responseDelay;

  MockResponder({this.responseDelay = const Duration(milliseconds: 1000)});

  ///To load Json string from json file and decode it to Map
  Future<Map<String, dynamic>> _loadResponseMapFromJson(
      String assetFilePath) async {
    final response = await rootBundle.loadString(assetFilePath);
    final Map<String, dynamic> jsonMap = await json.decode(response);
    return jsonMap;
  }

  ///The method will return Map<String, dynamic> with given delay
  Future<dynamic> getResponse(String mockStubPath) async {
    await Future.delayed(responseDelay);
    return await _loadResponseMapFromJson(mockStubPath);
  }
}
