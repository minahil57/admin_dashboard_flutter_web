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
    MyTreeNode(title: 'Asset', accCode: '100-001-100', balance: '023493481', level: 1, isActive: false,balanceType: 'Debit',description: 'This is and Asset'),
    MyTreeNode(title: 'Liability', accCode: '100-001-102', balance: '023493481', level: 1, isActive: false,balanceType: 'Credit',description: 'This is and Liabality'),
    MyTreeNode(title: 'Expense', accCode: '100-001-103', balance: '023493481', level: 1, isActive: false,balanceType: 'Debit',description: 'This is and Equity'),
    MyTreeNode(title: 'Equity', accCode: '100-001-104', balance: '023493481', level: 1, isActive: false,balanceType: 'Credit',description: 'This is and Expense'),
    MyTreeNode(title: 'Revenue', accCode: '100-001-105', balance: '023493481', level: 1, isActive: false,balanceType: 'Debit',description: 'This is and Revenue')
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