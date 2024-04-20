import 'package:dio/dio.dart';

class AuthRoute {
  final Dio dio;

  AuthRoute(this.dio);

  Future<Response<dynamic>> register({String? email, String? password, String? name}) async {
    try {
      var data = <String, dynamic>{};
      if(email != '') data['email'] = email;
      if(password != '') data['password'] = password;
      if(name != '') data['name'] = name;
      return await dio.post(
        '/register/',
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> verifyOTP({String? email, required int otp}) async {
    try {
      var data = <String, dynamic>{};
      if(email != '') data['email'] = email;
      data['otp'] = otp;
      return await dio.post(
        '/verify/',
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> login({required String email, required String password}) async {
    try {
      var data = <String, dynamic>{};
      if(email != '') data['email'] = email;
      data['password'] = password;
      return await dio.post(
        '/login/',
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }
}