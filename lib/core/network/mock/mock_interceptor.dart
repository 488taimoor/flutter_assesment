import 'package:dio/dio.dart';
import 'package:mobile/core/network/mock/mock_exception.dart';
import 'package:mobile/core/network/mock/mock_responder.dart';
import 'package:mobile/core/network/network_keys.dart';
class MockInterceptor extends Interceptor {
  MockResponder mockResponder = MockResponder(
    responseDelay: const Duration(milliseconds: 500),
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final mockStubPath = options.headers.containsKey(NetworkKeys.mockStub)
        ? options.headers[NetworkKeys.mockStub] as String
        : '';
    if (mockStubPath.isNotEmpty) {
      final data = await mockResponder.getResponse(mockStubPath);
      if (data == null) {
        handler.reject(MockServerException(requestOptions: options));
        return;
      }
      final response = Response(data: data, requestOptions: options);
      handler.resolve(response);
    } else {
      ///If endpoint is not set to mock proceed with remote request
      handler.next(options);
    }
  }
}
