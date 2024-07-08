import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree_controller.dart';

class MyTreeTile extends GetView<DashboardController> {
  const MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
  });

  final TreeEntry<MyTreeNode> entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TreeIndentation(
              entry: entry,
              guide: const IndentGuide.connectingLines(
                indent: 6,
                thickness: 2,
                color: kcVeryLightGrey,
                connectBranches: true
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  // margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric( vertical: 8),
                  decoration: const BoxDecoration(
                    color: kcWhitecolor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            controller.treeController!
                                    .getExpansionState(entry.node) && entry.node.children.isNotEmpty
                                ? Icons.keyboard_arrow_down
                                :  entry.node.children.isEmpty ?
                                Icons.keyboard_control :
                            entry.node.children.isEmpty && controller.treeController!
                                .getExpansionState(entry.node) ?
                            Icons.keyboard_control:
                            Icons.keyboard_arrow_right,
                            color: kcBlackColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: entry.node.level == 2
                                ? 100
                                : entry.node.level == 3
                                    ? 80
                                    : entry.node.level == 4
                                        ? 70
                                        : entry.node.level == 5
                                            ? 70
                                            : entry.node.level == 6
                                                ? 60 
                                                : 100,
                            child: Text(
                              entry.node.accountName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: entry.node.level == 1 ?
                              getBoldStyle(
                                fontSize: 
                                     18,
                                    
                                fontWeight: FontWeight.w600,
                              ):
                              getRegularStyle(
                                fontSize:  entry.node.level == 2
                                    ? 14
                                    : entry.node.level == 3
                                        ? 14
                                        : entry.node.level == 4
                                            ? 14
                                            : entry.node.level == 5
                                                ? 13
                                                : entry.node.level == 6
                                                    ? 12
                                                    : 14,
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          entry.node.accountCode,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          'Balance : ${entry.node.balance}',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(
                            fontSize: 16,
                            color: entry.node.balance > 0
                                ? kcGreenColor :
                            entry.node.balance == 0.00 ?
                                Colors.blueAccent
                                : kcRedColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          '${entry.node.level}',
                          style: getRegularStyle(fontSize: 16),
                        ),
                      ),

                         UnconstrainedBox(
                          child: Switch(
                            value: entry.node.isActive,
                            activeColor: kcPrimaryColor,
                            activeTrackColor: kcWhitecolor,
                            inactiveTrackColor: kcWhitecolor,
                            inactiveThumbColor: kcPrimaryColor,
                            trackOutlineColor:
                                WidgetStateProperty.resolveWith<Color?>(
                                    (Set<WidgetState> states) {
                              if (states.contains(WidgetState.disabled)) {
                                return kcPrimaryColor;
                              }
                              return kcPrimaryColor; // Use the default color.
                            },),
                            onChanged: (value) {
                               controller.toggle(entry.node.isActive,value);
                            },
                          ),
                        ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
