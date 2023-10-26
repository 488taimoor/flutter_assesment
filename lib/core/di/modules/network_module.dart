import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile/app/app_config.dart';
import 'package:mobile/core/network/http_client.dart';
import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/core/network/service_config.dart';
import 'package:mobile/core/resources/constants.dart';

abstract class NetworkModule {
  static late KiwiContainer _container;

  static void setup({
    required KiwiContainer container,
    required AppConfig appConfig,
  }) {
    _container = container;
    _setupServiceConfig(appConfig);
    _setupDioClient();
    _setupRestClient();
  }

  static void _setupServiceConfig(AppConfig appConfig) {
    _container.registerSingleton<ServiceConfig>(
      (_) => ServiceConfig(
          BaseOptions(
            baseUrl: appConfig.baseUrl,
            connectTimeout: Constants.connectTimeout,
            receiveTimeout: Constants.receiveTimeout,
          ),
          mockEnvironment: appConfig.mock),
    );
  }

  static void _setupDioClient() {
    _container.registerSingleton<DioHttpClient>(
      (_) => DioHttpClient(
        _container.resolve(),
      ),
    );
  }

  static void _setupRestClient() {
    _container.registerSingleton<RestAPIClient>(
      (_) => RestAPIClient(_container.resolve<DioHttpClient>().client),
    );
  }
}
