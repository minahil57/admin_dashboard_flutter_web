import 'dart:developer';
import 'dart:ui_web';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_admin_panel/core/constants/string_manager.dart';

import '../core/dio_instance.dart';
import '../models/user_model.dart';
import '../user_data/current_userDetail.dart';

class AuthenticationService {
  Future<void> getToken() async {
    final url = '${StringManager.startingUrl}/identity/auth/gettoken';
    const apikey = 'V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const authToken = 'Bearer V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const email = 'asad74@gmail.com';
    const password = '12345678';
    try {
      // EasyLoading.show();
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'accept': '*/*',
            'apikey': apikey,
            'Authorization': authToken,
            'Content-Type': 'application/json',
          },
        ),

        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        userData = UserApiResponse.fromJson(response.data);
        // final token = userData!.data.accessToken;
        // EasyLoading.dismiss();
        // return token;
      } else {
        // EasyLoading.dismiss();
        // return '';
      }
    } catch (e) {
      log(e.toString());
      // EasyLoading.dismiss();
      // return '';
    }
  }
}