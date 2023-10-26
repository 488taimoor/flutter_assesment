import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/network/mock/mock_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_handler_interceptor.dart';
import 'interceptors/network_connection_interceptor.dart';

class ServiceConfig {
  ServiceConfig(this.baseOptions, {required this.mockEnvironment});

  final BaseOptions baseOptions;
  final bool mockEnvironment;

  Set<Interceptor> getInterceptors() {
    final interceptors = <Interceptor>{}..addAll(
        {
          AuthInterceptor(),
          NetworkConnectionInterceptor(),
          ErrorHandlerInterceptor(),
          if (mockEnvironment) MockInterceptor(),
          //TODO:Uncomment this when network cachcing is needed
          // CacheInterceptor(
          //     cacheOptions: CacheOptions(endpointsToCache: [
          //   Endpoints.home,
          // ])),
          if (kDebugMode)
            PrettyDioLogger(requestHeader: true, requestBody: true)
        },
      );

    return interceptors;
  }
}
