import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:getx_admin_panel/core/constants/string_manager.dart';
import 'package:getx_admin_panel/services/authentication_service.dart';
import 'package:getx_admin_panel/user_data/current_userDetail.dart';

import '../core/dio_instance.dart';
import '../models/tree_node.dart';
import '../models/user_model.dart';

class ItemMasterService{
  List<MyTreeNode> accounts = [];
  final AuthenticationService authenticationService = AuthenticationService();
  bool isInitalized = false;
  Future<List<MyTreeNode>> initialiseItemMasterService() async{
    if(isInitalized) return accounts;
    // final token = await _getToken();
    accounts = await getAccountTree();
    return accounts;
  }


  Future<List<MyTreeNode>> getAccountTree() async {
    final url = '${StringManager.startingUrl}/finanace/accounttrees/getaccounttree';


    log('I am here');
    try {
      EasyLoading.show();
     userData ??  await authenticationService.getToken();

      log("Fetching");
      log(userData.toString());
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'accept': '*/*',
            'apikey': StringManager.apiKey,
            'Authorization': 'Bearer ${userData!.data.accessToken}',
            'db': StringManager.db,
            'lang': StringManager.lang,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'financialYear': 'FY 2021',
          'activeAccounts': true,
          'approvedOnly': true,
        },
      );
      log("Fetched");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<MyTreeNode> accountTree = data.map((json) => MyTreeNode.fromJson(json)).toList();
        EasyLoading.dismiss();
        log(data.toString());
        isInitalized = true;
        return accountTree;
      } else {
        EasyLoading.dismiss();
        isInitalized = false;
        return [];
      }
    } catch (e) {
      EasyLoading.dismiss();
      isInitalized = false;
      log(e.toString());
      return [];
    }
  }



}

