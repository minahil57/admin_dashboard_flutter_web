import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree_controller.dart';
import 'package:getx_admin_panel/views/accounts_tree/widgets/heading_container.dart';
import 'package:getx_admin_panel/views/accounts_tree/widgets/top_bar.dart';
import 'package:getx_admin_panel/views/accounts_tree/widgets/tree.dart';

class AccountsTreeView extends GetView<DashboardController> {
  const AccountsTreeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kcWhitecolor.withOpacity(0.9),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpaceMedium,
            TopBarAccountTree(),
            verticalSpaceMedium,
            HeadingContainer(),
            verticalSpaceSmall,
            AccountsTree(),
          ],
        ),
      ),
    );
  }
}
