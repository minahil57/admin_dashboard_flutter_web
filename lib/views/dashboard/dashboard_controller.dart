import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_admin_panel/models/tree_node.dart';

class DashboardController extends GetxController {
   final controller00 = ValueNotifier<bool>(false);
   static  List<MyTreeNode> roots = <MyTreeNode>[
    MyTreeNode(
      title: 'Assets',
      accCode: '0010234001203',
      balance: '100000',
      isActive: false.obs,
      level: 1,
      children: <MyTreeNode>[
        MyTreeNode(
          level: 2,
          isActive: false.obs,
          title: 'Asset 1',
          accCode: '00102',
          balance: '10000',
          children: <MyTreeNode>[
            MyTreeNode(
              level: 3,
               isActive: false.obs,
              title: 'Asset 1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: <MyTreeNode>[
            MyTreeNode(
              level: 4,
               isActive: false.obs,
              title: 'Assets 1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: [
                MyTreeNode(
              level: 5,
               isActive: false.obs,
              title: 'Assets 1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: [
                MyTreeNode(
              level: 6,
                isActive: false.obs,
              title: 'Assets 1.1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
              ],
                ),
              ],
            
            ),
          ],
        ),
          ],
        ),
         MyTreeNode(
          level: 2,
          isActive: false.obs,
          title: 'Asset 2',
          accCode: '00102',
          balance: '10000',
          children: <MyTreeNode>[
            MyTreeNode(
              level: 3,
               isActive: false.obs,
              title: 'Asset 2.1',
              accCode: '0010234001203',
              balance: '100000',
              children: <MyTreeNode>[
            MyTreeNode(
              level: 4,
               isActive: false.obs,
              title: 'Assets 2.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: [
                MyTreeNode(
              level: 5,
               isActive: false.obs,
              title: 'Assets 2.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: [
                MyTreeNode(
              level: 6,
                isActive: false.obs,
              title: 'Assets 2.1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
             MyTreeNode(
              level: 6,
                isActive: false.obs,
              title: 'Assets 2.1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
             MyTreeNode(
              level: 6,
                isActive: false.obs,
              title: 'Assets 2.1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
              ],
                ),
              ],
            
            ),
             MyTreeNode(
              level: 5,
                isActive: false.obs,
              title: 'Assets 2.1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
             MyTreeNode(
              level: 5,
                isActive: false.obs,
              title: 'Assets 2.1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
          ],
        ),
          ],
        ),
        MyTreeNode(
          title: 'Asset 3',
          level: 2,
            isActive: false.obs,
          accCode: '00102340013',
          balance: '10000',
        ),
      ],
    ),
    MyTreeNode(
      level: 1,
      title: 'Liabilities',
      isActive: false.obs,
      accCode: '0010234001203',
      balance: '100000',
      children: <MyTreeNode>[
        MyTreeNode(
          level: 2,
          title: 'Liability 1',
          isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
          children: <MyTreeNode>[
            MyTreeNode(
              level: 3,
              title: 'Liability 1.1',
              isActive: false.obs,
              accCode: '0010234001203',
              balance: '100000',
            ),
          ],
        ),
        MyTreeNode(
          level: 2,
          title: 'Liability 2',
            isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
        )
      ],
    ),
      MyTreeNode(
        level: 1,
      title: 'Equity',
      accCode: '0010234001203',
        isActive: false.obs,
      balance: '100000',
      children: <MyTreeNode>[
        MyTreeNode(
          level: 2,
          title: 'Equity 1',
           isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
          children: <MyTreeNode>[
            MyTreeNode(
              level: 3,
              title: 'Equity 1.1',
              isActive: false.obs,
              accCode: '0010234001203',
              balance: '100000',
            ),
          ],
        ),
        MyTreeNode(
          level: 2,
          title: 'Equity 2',
           isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
        )
      ],
    ),
      MyTreeNode(
        level: 1,
      title: 'Revenue',
        isActive: false.obs,
      accCode: '0010234001203',
      balance: '100000',
      children: <MyTreeNode>[
        MyTreeNode(
          level: 2,
          title: 'Revenue 1',
       isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
          children: <MyTreeNode>[
            MyTreeNode(
              level: 3,
              title: 'Revenue 1.1',
                isActive: false.obs,
              accCode: '0010234001203',
              balance: '100000',
            ),
          ],
        ),
        MyTreeNode(
          level: 1,
          title: 'Revenue 2',
           isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
        )
      ],
    ),
      MyTreeNode(
        level: 1,
      title: 'Expenses',
      accCode: '0010234001203',
       isActive: false.obs,
      balance: '100000',
      children: <MyTreeNode>[
        MyTreeNode(
          level: 2,
          title: 'Expenses 1',
            isActive: false.obs,

          accCode: '0010234001203',
          balance: '100000',
          children: <MyTreeNode>[
            MyTreeNode( isActive: false.obs,
              level: 3,
              title: 'Expenses 1.1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: [
                MyTreeNode(
              level: 4,
               isActive: false.obs,
              title: 'Expenses 1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
              children: [
                MyTreeNode(
              level: 5,
                isActive: false.obs,
              title: 'Expenses 1.1.1.1.1',
              accCode: '0010234001203',
              balance: '100000',
            ),
              ]
            ),
              ],
            ),
          ],
        ),
        MyTreeNode(
          level: 2,
          title: 'Expenses 2',
          isActive: false.obs,
          accCode: '0010234001203',
          balance: '100000',
        )
      ],
    ),
  ];

  late final TreeController<MyTreeNode> treeController;
 RxBool isOn = false.obs;

  void toggle(value) {
      
  
  }

    @override
  void onInit() {
    super.onInit();
    treeController = TreeController<MyTreeNode>(
      roots: roots,
      childrenProvider: (MyTreeNode node) => node.children,
    );
  }
  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }
}