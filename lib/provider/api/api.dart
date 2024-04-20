import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/auth.dart';


final apiProvider = Provider<APIProvider>((ref) => APIProvider(ref: ref));

class APIProvider {
  final Ref ref;

  APIProvider({required this.ref});

  Dio get dio => createDio();
  Dio get externalDio => createDio(isExternal: true);

  String get serverUrl => 'https://flutterauth.pythonanywhere.com/api';

  Dio createDio({bool isExternal = false}) {
    var dio = Dio(BaseOptions(
      baseUrl: isExternal ? '' : serverUrl,
    ));
    //..interceptors.add(DioCacheInterceptor(options: options))
    dio.interceptors.addAll({
      AppInterceptors(dio, ref, isExternal: isExternal),
    });
    return dio;
  }
  AuthRoute get authRoute => AuthRoute(dio);
  
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  final bool isExternal;
  final Ref ref;

  AppInterceptors(this.dio, this.ref, {this.isExternal = false});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('\nAPI request: ${options.uri}');

    if (isExternal) return handler.next(options);

    // var accessToken = ref.read(databaseProvider).getPref('accessToken');
    var accessToken = '';
    // bool? skipToken = options.extra['skipToken'];

    // if (accessToken != null) {
    //   if (skipToken ?? true)
    //     options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, err);
          case 401:
            throw UnauthorizedException(err.requestOptions, ref);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
          case 504:
            throw DeadlineExceededException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.unknown:
        break;
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Request Success: ${response.statusCode}\ndata: ${response.data}');
    if (response.statusCode.toString().startsWith('2'))
      response.extra['done'] = true;
    super.onResponse(response, handler);
  }
}

class BadRequestException extends DioException {
  final DioException error;
  BadRequestException(RequestOptions r, this.error) : super(requestOptions: r);

  @override
  String toString() {
    String message = '';
    try {
      message = error.response!.data['message'];
    } catch (e) {
      message = 'Invalid request';
    }
    print(errorToString(requestOptions, message));
    return message;
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    const message = 'Unknown error occurred, please try again later.';
    print(errorToString(requestOptions, message));
    return message;
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    const message = 'Conflict occurred';
    print(errorToString(requestOptions, message));
    return message;
  }
}

class UnauthorizedException extends DioException {
  final Ref ref;

  UnauthorizedException(RequestOptions r, this.ref) : super(requestOptions: r);

  @override
  String toString() {
    const message = 'Access denied';
    print(errorToString(requestOptions, message));
    logout();
    return message;
  }

  void logout() async {
    try {
      // await ref.read(databaseProvider).clearPreferences();
      // Toast.show('Authentication Failed.');
    } catch (e) {
      print(e);
      // Toast.show("Authentication Failed. Please restart the app and try again.");
    }
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    const message = 'Failed to find the server route';
    print(errorToString(requestOptions, message));
    return message;
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    const message = 'No internet connection detected, please try again.';
    print(errorToString(requestOptions, message));
    return message;
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    const message = 'The connection has timed out, please try again.';
    print(errorToString(requestOptions, message));
    return message;
  }
}

String errorToString(RequestOptions ro, String message) {
  return '\nAPI Error: ${ro.uri}\nMessage: $message';
}
