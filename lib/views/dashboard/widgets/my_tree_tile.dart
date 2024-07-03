import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/views/dashboard/dashboard_controller.dart';

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
                indent: 24,
                color: kcVeryLightGrey,
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            controller.treeController
                                    .getExpansionState(entry.node)
                                ? Icons.arrow_drop_down
                                : Icons.arrow_right,
                          ),
                          SizedBox(
                            width: entry.node.level == 2
                                ? 70
                                : entry.node.level == 3
                                    ? 60
                                    : entry.node.level == 4
                                        ? 50
                                        : entry.node.level == 5
                                            ? 40
                                            : entry.node.level == 6
                                                ? 30
                                                : 100,
                            child: Text(
                              entry.node.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: getBoldStyle(
                                fontSize: entry.node.level == 2
                                    ? 15
                                    : entry.node.level == 3
                                        ? 14
                                        : entry.node.level == 4
                                            ? 13
                                            : entry.node.level == 5
                                                ? 12
                                                : entry.node.level == 6
                                                    ? 11
                                                    : 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          entry.node.accCode,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Balance : ${entry.node.balance}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(
                            fontSize: 14,
                            color: entry.node.balance == '100000'
                                ? kcGreenColor
                                : kcRedColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          'Level ${entry.node.level}',
                          style: getRegularStyle(fontSize: 14),
                        ),
                      ),
                      Obx(
                        () => UnconstrainedBox(
                          child: Switch(
                            value: entry.node.isActive.value,
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
                            }),
                            onChanged: (value) {
                              entry.node.isActive.value = value;
                            },
                          ),
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
