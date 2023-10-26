import 'package:dio/dio.dart';
import 'package:mobile/core/resources/strings.dart';

class ErrorHandlerInterceptor extends Interceptor {
  final int notAuthorizedCode = 420;
  final int serverErrorCode = 500;
  final errorTag = 'Error Intercepted: ';

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw _TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.sendTimeout:
        throw _TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.receiveTimeout:
        throw _TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.badResponse:
        {
          if (err.response?.statusCode == notAuthorizedCode) {
            throw _UnauthorizedException(requestOptions: err.requestOptions);
          } else if (err.response != null &&
              err.response!.statusCode! >= serverErrorCode) {
            throw _CommonException(requestOptions: err.requestOptions);
          } else {
            throw _BackendException(
                requestOptions: err.requestOptions, response: err.response);
          }
        }
      case DioExceptionType.unknown:
        {
          throw _TimeoutException(requestOptions: err.requestOptions);
        }
    }
    return handler.next(err);
  }
}

class _TimeoutException extends DioException {
  _TimeoutException({required super.requestOptions});

  @override
  String toString() {
    return Strings.timeoutError;
  }
}

class _CommonException extends DioException {
  _CommonException({required super.requestOptions});

  @override
  String toString() {
    return Strings.commonError;
  }
}

class _UnauthorizedException extends DioException {
  _UnauthorizedException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions) {
    _forceLogout();
  }

  void _forceLogout() async {
    ///Implement force logout here.
  }

  @override
  String toString() {
    return Strings.unauthorizedError;
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException({required super.requestOptions}) {
    _showNoInternetScreen();
  }

  void _showNoInternetScreen() {
    //MealPlanetApp.appContext?.push(PagePath.noInternetConnection);
  }

  @override
  String toString() {
    return Strings.emptyString;
  }
}

class _BackendException extends DioException {
  String _message = '';
  late int _statusCode;

  _BackendException({
    required RequestOptions requestOptions,
    required Response? response,
  }) : super(requestOptions: requestOptions) {
    _statusCode = response?.statusCode ?? -1;
    if (response?.data == null) {
      _message = Strings.commonError;
      return;
    }
    final errorData = response?.data as Map<String, dynamic>?;
    if (errorData != null) {
      final messageData = errorData['message'].toString();
      _message = messageData.isNotEmpty ? messageData : Strings.commonError;
    } else {
      _message = Strings.commonError;
    }
  }

  @override
  String get message => _message;

  @override
  Object? get error => _statusCode;

  @override
  String toString() => message;
}
