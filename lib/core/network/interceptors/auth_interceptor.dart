import 'package:dio/dio.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/core/network/network_keys.dart';
import 'package:mobile/data/sources/local/preferences/app_preferences.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  final _appPreferences = Injector.resolve<AppPreferences>();

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    String? token = _appPreferences.getUserAccessToken();
    if (token != null) {
      options.headers
          .addAll({NetworkKeys.authHeaderKey: '${NetworkKeys.bearer} $token'});
    }
    handler.next(options);
  }
}
