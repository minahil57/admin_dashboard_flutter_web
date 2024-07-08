import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/services/item_master_service.dart';

class DashboardController extends GetxController {
   final controller00 = ValueNotifier<bool>(false);
   bool _isDisposed = false;
   final ItemMasterService itemMasterService = ItemMasterService();
    RxList<MyTreeNode> roots = <MyTreeNode>[
    // MyTreeNode(
    //   accountName: 'Assets',
    //   accountCode: '0010234001203',
    //   balance: 100000.00,
    //   isActive: false,
    //   isSelected: false,
    //   level: 1,
    //   children: <MyTreeNode>[
    //     MyTreeNode(
    //       level: 2,
    //       isActive: false,
    //       isSelected: false,
    //       accountName: 'Asset 1',
    //       accountCode: '00102',
    //       balance: 10000,
    //       children: <MyTreeNode>[
    //         MyTreeNode(
    //           level: 3,
    //            isActive: false,
    //           isSelected: false,
    //           accountName: 'Asset 1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           children: <MyTreeNode>[
    //         MyTreeNode(
    //           level: 4,
    //            isActive: false,
    //           isSelected: false,
    //           accountName: 'Assets 1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           children: [
    //             MyTreeNode(
    //           level: 5,
    //               isSelected: false,
    //            isActive: false,
    //           accountName: 'Assets 1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           children: [
    //             MyTreeNode(
    //           level: 6,
    //               isSelected: false,
    //             isActive: false,
    //           accountName: 'Assets 1.1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //           ],
    //             ),
    //           ],
    //
    //         ),
    //       ],
    //     ),
    //       ],
    //     ),
    //      MyTreeNode(
    //       level: 2,
    //       isActive: false,
    //        isSelected: false,
    //       accountName: 'Asset 2',
    //       accountCode: '00102',
    //       balance: 10000,
    //       children: <MyTreeNode>[
    //         MyTreeNode(
    //           isSelected: false,
    //           level: 3,
    //            isActive: false,
    //           accountName: 'Asset 2.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           children: <MyTreeNode>[
    //         MyTreeNode(
    //           level: 4,
    //           isSelected: false,
    //            isActive: false,
    //           accountName: 'Assets 2.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           children: [
    //             MyTreeNode(
    //           level: 5,
    //            isActive: false,
    //               isSelected: false,
    //           accountName: 'Assets 2.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           children: [
    //             MyTreeNode(
    //           level: 6,
    //             isActive: false,
    //               isSelected: false,
    //           accountName: 'Assets 2.1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //          MyTreeNode(
    //           level: 6,
    //             isActive: false,
    //            isSelected: false,
    //           accountName: 'Assets 2.1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //          MyTreeNode(
    //           level: 6,
    //             isActive: false,
    //           accountName: 'Assets 2.1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //            isSelected: false,
    //
    //         ),
    //           ],
    //             ),
    //           ],
    //
    //         ),
    //          MyTreeNode(
    //           level: 5,
    //             isActive: false,
    //            isSelected: false,
    //           accountName: 'Assets 2.1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //          MyTreeNode(
    //           level: 5,
    //             isActive: false,
    //           accountName: 'Assets 2.1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //            isSelected: false,
    //         ),
    //       ],
    //     ),
    //       ],
    //     ),
    //     MyTreeNode(
    //       accountName: 'Asset 3',
    //       level: 2,
    //         isActive: false,
    //       isSelected: false,
    //       accountCode: '00102340013',
    //       balance: 10000,
    //     ),
    //   ],
    // ),
    // MyTreeNode(
    //   level: 1,
    //   accountName: 'Liabilities',
    //   isActive: false,
    //   isSelected: false,
    //   accountCode: '0010234001203',
    //   balance: 100000,
    //   children: <MyTreeNode>[
    //     MyTreeNode(
    //       level: 2,
    //       isSelected: false,
    //       accountName: 'Liability 1',
    //       isActive: false,
    //       accountCode: '0010234001203',
    //       balance: 10000,
    //       children: <MyTreeNode>[
    //         MyTreeNode(
    //           isSelected: false,
    //           level: 3,
    //           accountName: 'Liability 1.1',
    //           isActive: false,
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //       ],
    //     ),
    //     MyTreeNode(
    //       level: 2,
    //       accountName: 'Liability 2',
    //         isActive: false,
    //       accountCode: '0010234001203',
    //       isSelected: false,
    //       balance:100000,
    //     )
    //   ],
    // ),
    //   MyTreeNode(
    //     level: 1,
    //   accountName: 'Equity',
    //   accountCode: '0010234001203',
    //     isActive: false,
    //     isSelected: false,
    //   balance: 100000,
    //   children: <MyTreeNode>[
    //     MyTreeNode(
    //       level: 2,
    //       accountName: 'Equity 1',
    //        isActive: false,
    //       isSelected: false,
    //       accountCode: '0010234001203',
    //       balance: 100000,
    //       children: <MyTreeNode>[
    //         MyTreeNode(
    //           level: 3,
    //           isSelected: false,
    //           accountName: 'Equity 1.1',
    //           isActive: false,
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //       ],
    //     ),
    //     MyTreeNode(
    //       level: 2,
    //       accountName: 'Equity 2',
    //        isActive: false,
    //       isSelected: false,
    //       accountCode: '0010234001203',
    //       balance: 100000,
    //     )
    //   ],
    // ),
    //   MyTreeNode(
    //     level: 1,
    //   accountName: 'Revenue',
    //     isActive: false,
    //   accountCode: '0010234001203',
    //     isSelected: false,
    //   balance: 100000,
    //   children: <MyTreeNode>[
    //     MyTreeNode(
    //       level: 2,
    //       accountName: 'Revenue 1',
    //       isSelected: false,
    //    isActive: false,
    //       accountCode: '0010234001203',
    //       balance: 100000,
    //       children: <MyTreeNode>[
    //         MyTreeNode(
    //           isSelected: false,
    //           level: 3,
    //           accountName: 'Revenue 1.1',
    //             isActive: false,
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //       ],
    //     ),
    //     MyTreeNode(
    //       level: 1,
    //       accountName: 'Revenue 2',
    //        isActive: false,
    //       accountCode: '0010234001203',
    //       balance: 100000,
    //       isSelected: false,
    //     )
    //   ],
    // ),
    //   MyTreeNode(
    //     level: 1,
    //   accountName: 'Expenses',
    //   accountCode: '0010234001203',
    //    isActive: false,
    //   balance: 100000,
    //     isSelected: false,
    //   children: <MyTreeNode>[
    //     MyTreeNode(
    //       isSelected: false,
    //       level: 2,
    //       accountName: 'Expenses 1',
    //         isActive: false,
    //
    //       accountCode: '0010234001203',
    //       balance: 100000,
    //       children: <MyTreeNode>[
    //         MyTreeNode( isActive: false,
    //           level: 3,
    //           accountName: 'Expenses 1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //           isSelected: false,
    //           children: [
    //             MyTreeNode(
    //           level: 4,
    //            isActive: false,
    //           accountName: 'Expenses 1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //                 isSelected: false,
    //           children: [
    //             MyTreeNode(
    //           level: 5,
    //             isActive: false,
    //               isSelected: false,
    //           accountName: 'Expenses 1.1.1.1.1',
    //           accountCode: '0010234001203',
    //           balance: 100000,
    //         ),
    //           ]
    //         ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     MyTreeNode(
    //       level: 2,
    //       accountName: 'Expenses 2',
    //       isActive: false,
    //       accountCode: '0010234001203',
    //       balance: 100000,
    //       isSelected: false,
    //     )
    //   ],
    // ),
  ].obs;


  late TreeController <MyTreeNode> treeController ;


  void toggle(value,bool values) {
     value = values;
     log(value.toString());
     update();
  
  }
  // RxBool isLoading = false.obs;
  //   @override
  // void onReady() async{
  //   super.onReady();
  //   treeController = TreeController<MyTreeNode>(
  //     roots: roots,
  //     childrenProvider: (MyTreeNode node) => node.children,
  //   );
  //   final token = await itemMasterService.getToken();
  //   roots = await itemMasterService.getAccountTree(token);
  //
  //   update(
  //     roots,);
  //   refresh();
  //   treeController = TreeController<MyTreeNode>(
  //     roots: roots,
  //     childrenProvider: (MyTreeNode node) => node.children,
  //   );
  //   refresh();
  //
  // }
    @override
  Future<void> onInit() async {
    super.onInit();
    if (!_isDisposed) {
      treeController = TreeController<MyTreeNode>(
        roots: roots.value,
        childrenProvider: (MyTreeNode node) => node.children,
      );

      await getData();

      refresh();
    }
  }
  Future<List<MyTreeNode>> getData() async {
    final token = await itemMasterService.getToken();
    roots.value = await itemMasterService.getAccountTree(token);
    return roots;
  }
  @override
  void dispose() {
    treeController!.dispose();
    _isDisposed = true;
    super.dispose();
  }
}