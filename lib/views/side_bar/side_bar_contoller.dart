import 'dart:developer';

import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';

class SideBarController extends GetxController{
  RxString selectedRoute = "/".obs;
  //  List<AdminMenuItem> items = SideBarItems.values
  //     .map((e) => e.item.toAdminMenuItem())
  //     .toList();
     List<AdminMenuItem> items = [
          const AdminMenuItem(title: "Dashboard", icon: Icons.dashboard, route: "/"),
          const AdminMenuItem(title: "Finance", icon: Icons.monetization_on,
            children: [
              AdminMenuItem(title: "Transaction", children: [
                AdminMenuItem(title: "Accounts Tree", route: "/accounts_tree"),
              ],),
            ],),
       AdminMenuItem(title: "Ap",  icon: Icons.edit_document,children: [
         AdminMenuItem(title: "Purchase Voucher", route: "/purchase"),
       ],),

        ];
 int getSideBarItem(AdminMenuItem item, [List<AdminMenuItem>? menuItems, int parentIndex = -1]) {
  menuItems ??= items;

  for (int i = 0; i < menuItems.length; i++) {
    log(menuItems[i].title);
    var currentItem = menuItems[i];
    if (currentItem.title.trim().toLowerCase() == item.title.trim().toLowerCase()) {
      return i ;  
    }
    if (currentItem.children.isNotEmpty) {
      var childIndex = getSideBarItem(item, currentItem.children, i);
      if (childIndex != -1) {
        // selectedRoute.value = currentItem.children[childIndex <= 0 ? 0 : childIndex].route!;
        // log(childIndex.toString());
        // log(currentItem.children[childIndex == -1 ? 0 : childIndex].route!);
        return parentIndex == -1 ? i + 1 : parentIndex;
        // return childIndex;
      }
    }
  }
  return -1;
}
// String findSelectedRoute(int index){
//   log(index.toString());
//   var selectedRoute = items[index].route;
//   log('selected route is $selectedRoute');
//   if (items[index].children.isNotEmpty) {
//     selectedRoute = findSelectedRoute(index + 1);
//   }

//   return selectedRoute!;
// }

}