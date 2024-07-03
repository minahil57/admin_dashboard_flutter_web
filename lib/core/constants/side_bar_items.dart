
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class SideBarItem {
  final String value;
  final IconData ? icon;
  final String route;
  final List<SideBarItem>? children;

  const SideBarItem({
    required this.value,
    this.icon,
    required this.route,
    this.children,
  });
  AdminMenuItem toAdminMenuItem() {
    return AdminMenuItem(
      title: value,
      icon: icon,
      route: route,
      children: children?.map((child) => child.toAdminMenuItem()).toList() ?? [],
    );
  }
  
}

enum SideBarItems {
  dashboard(
    SideBarItem(
    value: "Dashboard",
    icon: Icons.dashboard,
    route: "/",
  ),),
  finance(SideBarItem(
    value: "Finance",
    icon: Icons.monetization_on,
    route: "/",
    children: [
      SideBarItem(
        value: "Transaction",
        route: "",
        children: [
          SideBarItem(
            value: "Accounts Tree",
            route: "/accounts_tree",
          ),
        ],
      ),
    ],
  ));

  final SideBarItem item;

  const SideBarItems(this.item);
}
 List<AdminMenuItem> items = SideBarItems.values
      .map((e) => e.item.toAdminMenuItem())
      .toList();