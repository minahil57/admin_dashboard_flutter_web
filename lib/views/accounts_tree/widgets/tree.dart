import 'dart:developer';

import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree_controller.dart';

import '../../../core/imports/core_imports.dart';
import '../../../models/tree_node.dart';
import 'my_tree_tile.dart';

class AccountsTree extends GetView<DashboardController> {
  const AccountsTree({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Expanded(
      child:
      FutureBuilder<List<MyTreeNode>>(
        key: ValueKey(controller.searchQuery.value),
        future: controller.itemMasterService.getAccountTree(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MyTreeNode>> snapshot) {
          log(snapshot.toString());
          // late TreeController <MyTreeNode> treeController ;
          controller.treeController = TreeController<MyTreeNode>(
            roots: snapshot.data ?? controller.itemMasterService.accounts,
            parentProvider: (MyTreeNode node) => node.parent,
            childrenProvider: (MyTreeNode node) => node.children,
          );
          return snapshot.connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator(
                  color: kcWhitecolor,
                )
              :
          TreeView<MyTreeNode>(
                  key: controller.key,
                  treeController: controller.treeController,
                  nodeBuilder:
                      (BuildContext context, TreeEntry<MyTreeNode> entry) {
                    return MyTreeTile(
                      key: ValueKey(entry.node),
                      entry: entry,
                      onTap: () =>
                          controller.treeController.toggleExpansion(entry.node),
                    );
                  },
                );
        },
      ),
    );
  }
}
