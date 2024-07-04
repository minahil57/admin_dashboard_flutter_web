
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/views/add_items/add_items_view.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree.dart';
import 'package:getx_admin_panel/views/add_primary_account/add_primary_account.dart';
import 'package:getx_admin_panel/views/dashboard/dashboard_view.dart';
import 'package:getx_admin_panel/views/item_master/item_master_view.dart';
import 'package:getx_admin_panel/views/reports/reports_view.dart';
import 'package:getx_admin_panel/views/sales/sales_view.dart';
import 'package:getx_admin_panel/views/side_bar/side_bar_view.dart';
import 'package:getx_admin_panel/views/start_up/start_up_view.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashScreen(),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return SideNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              name: 'dashboard',
              path: '/',
              pageBuilder: (context, state) {
                return  const MaterialPage(
                  child: DashboardView(),
                );
              },
            ),
          ],),
           StatefulShellBranch(routes: [
            GoRoute(
              name: 'Transaction',
              path: '/transaction',
            //    routes: [
            //     GoRoute(
            //   name: 'Accounts Tree',
            //   path: 'accounts_tree',
             
            //   pageBuilder: (context, state) {
            //     return const MaterialPage(
            //       child: ItemMasterView(),
            //     );
                
            //   },
            // ),
            //   ],
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: AddItemView(),
                );
              },
            ),
          ]),
        
          StatefulShellBranch(routes: [
            GoRoute(
              name: 'accounts_tree',
              path: '/accounts_tree',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: AccountsTreeView(),
                );
              },
            ),
          ]),
        
          StatefulShellBranch(routes: [
            GoRoute(
              name: 'report',
              path: '/report',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: ReportView(),
                );
              },
            ),
          ]),
          //     StatefulShellBranch(routes: [
          //   GoRoute(
          //     name: 'Accounts Tree',
          //     path: '/accounts_tree',
             
          //     pageBuilder: (context, state) {
          //       return const MaterialPage(
          //         child: ItemMasterView(),
          //       );
                
          //     },
          //   ),
          // ]),
          StatefulShellBranch(routes: [
            GoRoute(
              name: 'sales',
              path: '/sales',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: SalesView(),
                );
              },
            ),
          ]),
         StatefulShellBranch(routes: [
            GoRoute(
        path: '/add_primary_account',
        name: 'add-primary-account',
         builder: (context, state) => const AddPrimaryAccount(),
        ),
         ])
        ],
      ),
     
      
    ],
  );

