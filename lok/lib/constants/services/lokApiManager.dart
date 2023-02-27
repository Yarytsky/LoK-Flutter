import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lok/App/MainPage.dart';
import 'package:lok/L&R/Login.dart';
import 'package:lok/constants/models/user.dart';

class MoviesApiService{
  final _dio = Dio();

  MoviesApiService() {
    _dio.options.baseUrl = 'https://localhost:7203';
  }

  // void login(EmailController, PasswordController) async{
  //   Response response = await _dio.post('/auth/signin',
  //   data: {EmailController, PasswordController});
  //   print(response.statusCode);
  // }

  // void login(String email, password, controller1, controller2) async {
  //   Response response = await _dio.post('https://localhost:7203/auth/signin');
  //   data:
  //   {
  //     'usernameOrEmail': controller1,
  //   }
  // }
}
