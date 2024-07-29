
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';

class SideBarController extends GetxController {
  RxString selectedRoute = "/".obs;

  List<AdminMenuItem> items = [
    const AdminMenuItem(title: "Dashboard", icon: Icons.dashboard, route: "/"),
    const AdminMenuItem(title: "Finance", icon: Icons.monetization_on,
      children: [
        AdminMenuItem(title: "Transaction", children: [
          AdminMenuItem(title: "Accounts Tree", route: "/finance/transaction/accounts_tree"),
        ]),
      ],
    ),
    const AdminMenuItem(title: "Ap", icon: Icons.edit_document, children: [
      AdminMenuItem(title: "Purchase Voucher", route: "/ap/purchase_voucher"),
    ]),
    const AdminMenuItem(title: "Custom Grid", route: "/custom_grid"),
  ];

  int getSideBarItem(AdminMenuItem item, [List<AdminMenuItem>? menuItems, int parentIndex = -1]) {
    menuItems ??= items;

    for (int i = 0; i < menuItems.length; i++) {
      var currentItem = menuItems[i];
      if (currentItem.title.trim().toLowerCase() == item.title.trim().toLowerCase()) {
        return i;
      }
      if (currentItem.children.isNotEmpty) {
        var childIndex = getSideBarItem(item, currentItem.children, i);
        if (childIndex != -1) {
          return i; // Return the parent index instead of child index
        }
      }
    }
    return -1;
  }
}
