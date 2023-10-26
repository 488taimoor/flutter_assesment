import 'package:dio/dio.dart';
import 'package:mobile/core/utils/common_utils.dart';
import 'error_handler_interceptor.dart';

class NetworkConnectionInterceptor extends Interceptor {
  NetworkConnectionInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// Throw network exception in case of no connection
    if (await CommonUtils.hasNetwork()) {
      handler.next(options);
    } else {
      handler.reject(NoInternetConnectionException(requestOptions: RequestOptions(path: '', data: '')));
    }
  }
}
