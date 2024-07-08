import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_admin_panel/core/helpers/toast.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../models/tree_node.dart';
import '../models/user_model.dart';

class ItemMasterService{
  Future<void> postItemMaster(ItemMaster item) async {
    EasyLoading.show();
  // URL of the API endpoint
  const String apiUrl = 'http://qfinityinventoryapi.softaxusdemo.com/api/ItemMaster/Create';

  // Convert ItemMaster object to JSON
  Map<String, dynamic> itemJson = item.toJson();
  log(json.encode(itemJson));

  // Perform the POST request
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(itemJson),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successfully stored the data
      EasyLoading.dismiss();
    } else {
      // Error occurred while posting the data
     
      EasyLoading.dismiss();
    }
  } catch (e) {
    log(e.toString());

    showToast('An error occurred while posting ItemMaster');
    // Exception handling
    EasyLoading.dismiss();
  }
}


  Future<String> getToken() async {
    final dio = Dio();
    const url = 'https://dev.api.newcrm.freemyip.com/api/identity/auth/gettoken';
    const apikey = 'V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const authToken = 'Bearer V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const email = 'asad74@gmail.com';
    const password = '12345678';
    print('hehe');
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
        final apiResponse = ApiResponse.fromJson(response.data);
        final token = apiResponse.data.accessToken;
        print('Access Token: $token');
        // EasyLoading.dismiss();
        return token;
      } else {
        print('Failed to get token: ${response.statusCode}');
        // EasyLoading.dismiss();
        return '';
      }
    } catch (e) {
      print('Error: $e');
      // EasyLoading.dismiss();
      return '';
    }
  }
  Future<List<MyTreeNode>> getAccountTree(String accessToken) async {
    final dio = Dio();
    const url = 'https://dev.api.newcrm.freemyip.com/api/finanace/accounttrees/getaccounttree';
    const apikey = 'V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';
    const db = 'ePMS3001';
    const lang = 'V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';

    try {
      EasyLoading.show();
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'accept': '*/*',
            'apikey': apikey,
            'Authorization': 'Bearer $accessToken',
            'db': db,
            'lang': lang,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'financialYear': 'FY 2021',
          'activeAccounts': true,
          'approvedOnly': true,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        print(data);
        final List<MyTreeNode> accountTree = data.map((json) => MyTreeNode.fromJson(json)).toList();
        print('Account Tree: ${accountTree}');
        EasyLoading.dismiss();
        return accountTree;
      } else {
        EasyLoading.dismiss();
        print('Failed to get account tree: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      EasyLoading.dismiss();
      print('Error: $e');
      return [];
    }
  }



}

