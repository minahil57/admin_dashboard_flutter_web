import 'dart:developer';

import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';

class SideBarController extends GetxController{
  //  List<AdminMenuItem> items = SideBarItems.values
  //     .map((e) => e.item.toAdminMenuItem())
  //     .toList();
     List<AdminMenuItem> items = [
          const AdminMenuItem(title: "Dashboard", icon: Icons.dashboard, route: "/"),
          const AdminMenuItem(title: "Finance", icon: Icons.monetization_on,
            children: [
              AdminMenuItem(title: "Transaction", children: [
                AdminMenuItem(title: "Accounts Tree", route: "/accounts_tree"),
              ]),
            ]),
        ];
  int getSideBarItem(AdminMenuItem item) {
    for (var value in items) {
      if (value.title.toLowerCase() == item.title.toLowerCase()) {
        log(value.title);
        log(items.indexOf(value).toString());
        return items.indexOf(value);
      }
    }
    return 0;
  }

}
