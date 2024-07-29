
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:getx_admin_panel/core/constants/string_manager.dart';
import 'package:getx_admin_panel/models/user_model.dart';
import 'package:getx_admin_panel/user_data/current_user_detail.dart';


class AuthenticationService {
  Future<void> getToken() async {

    // final dio = Dio();
    //
    // dio.options.headers['accept'] = '*/*';
    // dio.options.headers['apikey'] = 'V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    // dio.options.headers['Authorization'] = 'Bearer V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    // dio.options.headers['Content-Type'] = 'application/json';
    //
    // final data = {
    //   'email': 'asad74@gmail.com',
    //   'password': 'Cairo@4321'
    // };
    //
    // try {
    //   final response = await dio.post('https://dev.api.newcrm.freemyip.com/api/identity/auth/gettoken', data: data);
    //   print('Response data: ${response.data}');
    // } catch (e) {
    //   if (e is DioException) {
    //     print('Error response data: ${e.response?.data}');
    //     print('Error status code: ${e.response?.statusCode}');
    //     print('Request data: ${e.requestOptions.data}');
    //     print('Request headers: ${e.requestOptions.headers}');
    //   } else {
    //     print('Unexpected error: $e');
    //   }
    // }
    final url = '${StringManager.startingUrl}/identity/auth/gettoken';
    const apikey = 'V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const authToken = 'Bearer V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const email = 'asad74@gmail.com';
    const password = 'Cairo@4321';
    try {
      // EasyLoading.show();
      log('I am trying');
      final response = await Dio().post(
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