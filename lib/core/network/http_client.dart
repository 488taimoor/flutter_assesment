import 'package:dio/dio.dart';

import 'service_config.dart';

abstract class HttpClient {
  late final Dio client;
  late final ServiceConfig serviceConfig;
}

final Dio newdio = Dio();

class DioHttpClient implements HttpClient {
  factory DioHttpClient(ServiceConfig serviceConfig) {
    final httpClient =
        DioHttpClient._internal(serviceConfig, Dio(serviceConfig.baseOptions));
    httpClient.client.interceptors.addAll(serviceConfig.getInterceptors());
    return httpClient;
  }

  DioHttpClient._internal(this.serviceConfig, this.client);

  @override
  Dio client;

  @override
  ServiceConfig serviceConfig;
}
