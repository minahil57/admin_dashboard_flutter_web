import 'package:get/get.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree_controller.dart';
import 'package:getx_admin_panel/views/accounts_tree/widgets/add_button.dart';
import 'package:getx_admin_panel/views/accounts_tree/widgets/search_bar.dart';

import '../../../core/imports/core_imports.dart';

class TopBarAccountTree extends GetView<DashboardController> {
  const TopBarAccountTree({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Accounts Listing',style: getBoldStyle(fontSize: 24,fontWeight: FontWeight.w500),),
           SearchTextField(searchController: controller.searchController ,),
          const CustomButton(),
        ],
      ),
    );
  }
}
