import 'package:dio/dio.dart';
import 'package:getx_admin_panel/core/constants/string_manager.dart';
import 'package:getx_admin_panel/models/purchase_voucher_dropdowns.dart';
import 'package:getx_admin_panel/services/authentication_service.dart';
import 'package:getx_admin_panel/user_data/current_user_detail.dart';

import '../core/dio_instance.dart';
class PurchaseVoucherService{
  final AuthenticationService authenticationService = AuthenticationService();


  Future<void> createPaymentVoucher() async {

    final url = '${StringManager.startingUrl}/finanace/paymentvouchers/createpaymentvoucher';

    final data = {
      "transactionMethod": "string",
      "postingDate": "2024-07-10T06:11:48.775Z",
      "currency": "string",
      "chequeNo": "string",
      "chequeDate": "2024-07-10T06:11:48.775Z",
      "paidTo": "string",
      "refNo": "string",
      "accountCode": "string",
      "accountName": "string",
      "vatAccountCode": "string",
      "creditAmount": 0,
      "conRate": 0,
      "conAmount": 0,
      "narration": "string",
      "financialYear": "string",
      "taxCode": 0,
      "taxInclusive": true,
      "costCenter1": "string",
      "costCenter2": "string",
      "costCenter3": "string",
      "costCenter4": "string",
      "createdBy": "string",
      "createdOn": "2024-07-10T06:11:48.775Z",
      "voucherItems": [
        {
          "recordId": 0,
          "accountCode": "string",
          "accountName": "string",
          "taxCode": 0,
          "amountCredit": 0,
          "amountDebit": 0,
          "vat": 0,
          "total": 0,
          "conRate": 0,
          "conAmount": 0,
          "narration": "string",
          "costCenter1": "string",
          "costCenter2": "string",
          "costCenter3": "string",
          "costCenter4": "string"
        }
      ],
      "voucherAttachments": [
        {
          "recordId": 0,
          "fileName": "string",
          "description": "string"
        }
      ]
    };

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'accept': '*/*',
            'apikey': StringManager.apiKey,
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );

      // print('Response status: ${response.statusCode}');
      // print('Response data: ${response.data}');
    } catch (e) {
      // print('Error: $e');
    }
  }



// Define the models as shown earlier (Account, CostCenter, Currency, Supplier, Tax, Type, Voucher, ApiResponse)

  Future<ApiResponse> fetchPurchaseDropdownsData() async {

    userData ??   await authenticationService.getToken();
    final String url = '${StringManager.startingUrl}/finanace/purchasevouchers/getpurchasedropdownsdata?financialYear=FY%202021';
    final String authorization = 'Bearer ${userData!.data.accessToken}';
    // final String authorization = 'Bearer V+kBloEwqqVho1PINmQI0VJQwSBX2l/e';

    try {
      final Response response = await dio.get(
        url,
        options: Options(
          headers: {
            'accept': '*/*',
            'apikey': StringManager.apiKey,
        'Authorization': authorization,
            'db': StringManager.db,
            'lang': StringManager.lang,
          },
          validateStatus: (status) {
            return status! < 500; // Accept all responses with status code less than 500
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data['data']; // Directly use response.data
        return ApiResponse.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  // void main() async {
  //




}