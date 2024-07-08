import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/views/add_primary_account/widgets/data_source.dart';

class AddPrimaryAccountController extends GetxController {  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController= TextEditingController();
  final TextEditingController accountTypeController = TextEditingController();
  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = false.obs;
  late PrimaryAccountSource primaryAccountSource;
  RxList<MyTreeNode> acc = <MyTreeNode>[
    MyTreeNode(accountName: 'Asset', accountCode: '100-001-100', balance: 02349348, level: 1, isActive: false,balanceType: 'Debit',description: 'This is and Asset', isSelected: false),
    MyTreeNode(accountName: 'Liability', accountCode: '100-001-102', balance: 023493481, level: 1, isActive: false,balanceType: 'Credit',description: 'This is and Liabality',isSelected: false),
    MyTreeNode(accountName: 'Expense', accountCode: '100-001-103', balance: 023493481, level: 1, isActive: false,balanceType: 'Debit',description: 'This is and Equity',isSelected: false),
    MyTreeNode(accountName: 'Equity', accountCode: '100-001-104', balance: 023493481, level: 1, isActive: false,balanceType: 'Credit',description: 'This is and Expense',isSelected: false),
    MyTreeNode(accountName: 'Revenue', accountCode: '100-001-105', balance: 023493481, level: 1, isActive: false,balanceType: 'Debit',description: 'This is and Revenue',isSelected: false)
  ].obs;
  @override
  void onInit(){
    super.onInit();
    primaryAccountSource = PrimaryAccountSource(accounts: acc);
  }
  void addToList(MyTreeNode newAcc){
    acc.add(newAcc);
    primaryAccountSource.updateDataSource(acc);

  }
}