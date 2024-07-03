import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_admin_panel/core/helpers/toast.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:http/http.dart' as http;

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
}

