import 'package:dio/dio.dart';
import 'package:mobile/core/resources/resources.dart';

class MockServerException extends DioException {
  MockServerException({required super.requestOptions});

  @override
  String? get message => Strings.mockServerError;

  @override
  String toString() {
    return Strings.mockServerError;
  }
}
