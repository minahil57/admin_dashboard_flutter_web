import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/views/dashboard/dashboard_controller.dart';
import 'package:getx_admin_panel/views/dashboard/widgets/add_button.dart';
import 'package:getx_admin_panel/views/dashboard/widgets/my_tree_tile.dart';
import 'package:getx_admin_panel/views/dashboard/widgets/search_bar.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return
    Scaffold(
      backgroundColor: kcWhitecolor.withOpacity(0.9),
      
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Accounts Listing',style: getBoldStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                  const SearchTextField(),
                   const CustomButton(),
                ],
              ),
            ),
            verticalSpaceSmall,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 65,
              decoration: const BoxDecoration(
                color: kcWhitecolor,
                boxShadow: [
                  BoxShadow(
                    color:kcPrimaryColor,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 0),
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('AccountName',style: getMediumStyle(),),
                    Text('AccountCode',style: getMediumStyle(),),
                    Text('AccountBalance',style: getMediumStyle(),),
                    Text('Accountlevel',style: getMediumStyle(),),
                    Text('AccountStatus',style: getMediumStyle(),),
                  ],
                            ),
              ),
            ),
            verticalSpaceSmall,
            Expanded(
              child: TreeView<MyTreeNode>(
                treeController:controller. treeController,
                nodeBuilder: (BuildContext context, TreeEntry<MyTreeNode> entry) {
                  return MyTreeTile(
                    key: ValueKey(entry.node),
                    entry: entry,
                    onTap: () => controller.treeController.toggleExpansion(entry.node),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

