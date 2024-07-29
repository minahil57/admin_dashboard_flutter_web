import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree_controller.dart';

import '../../../core/imports/core_imports.dart';

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
    TextSpan highlightText(String text, String query) {
      if (query.isEmpty) {
        return TextSpan(
          text: text,
          style: entry.node.level == 1
              ? getBoldStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )
              : getRegularStyle(
                  fontSize: getResponsiveSmallFontSize(context),
                ),
        );
      }
      final matches = RegExp(query, caseSensitive: false).allMatches(text);
      if (matches.isEmpty) {
        return TextSpan(
          text: text,
          style: entry.node.level == 1
              ? getBoldStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )
              : getRegularStyle(
                  fontSize: getResponsiveSmallFontSize(context),
                ),
        );
      }
      final List<TextSpan> spans = [];
      int start = 0;
      for (final match in matches) {
        if (match.start > start) {
          spans.add(TextSpan(
            text: text.substring(start, match.start),
            style: entry.node.level == 1
                ? getBoldStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
                : getRegularStyle(
                    fontSize: getResponsiveSmallFontSize(context),
                  ),
          ));
        }
        spans.add(TextSpan(
          text: text.substring(match.start, match.end),
          style: TextStyle(
            backgroundColor: Colors.yellow, // Highlight color
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveSmallFontSize(context),
          ),
        ));
        start = match.end;
      }
      if (start < text.length) {
        spans.add(TextSpan(
          text: text.substring(start),
          style: getRegularStyle(fontSize: getResponsiveSmallFontSize(context)),
        ));
      }
      return TextSpan(children: spans);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TreeIndentation(
              entry: entry,
              guide: const IndentGuide.connectingLines(
                indent: 24,
                thickness: 2,
                color: kcVeryLightGrey,
                connectBranches: true,
              ),
              child: GestureDetector(
                onTap: onTap,
                onDoubleTap: () {
                  controller.showContextMenu(context,entry.node);
                },
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(),
                    1: FixedColumnWidth(230), // Account code column
                    2: FixedColumnWidth(250), // Balance column
                    3: FixedColumnWidth(80), // Level column
                    4: FixedColumnWidth(80),
                  },
                  // textBaseline: TextBaseline.ideographic,
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              controller.treeController
                                          .getExpansionState(entry.node) &&
                                      entry.node.children.isNotEmpty
                                  ? Icons.keyboard_arrow_down
                                  : entry.node.children.isEmpty
                                      ? Icons.keyboard_control
                                      : Icons.keyboard_arrow_right,
                              color: kcBlackColor,
                              size: 18,
                            ),
                            // const SizedBox(width: 8),
                            Flexible(
                              flex: 2,
                              child: Obx(
                                () => RichText(
                                  text: highlightText(entry.node.accountName,
                                      controller.searchQuery.value),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          entry.node.accountCode,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(
                              fontSize: getResponsiveSmallFontSize(context)),
                        ),
                        Text(
                          '${entry.node.balance}',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(
                            fontSize: getResponsiveSmallFontSize(context),
                            color: entry.node.balance > 0
                                ? kcGreenColor
                                : entry.node.balance == 0.00
                                    ? Colors.blueAccent
                                    : kcRedColor,
                          ),
                        ),
                        Text(
                          '${entry.node.level}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getRegularStyle(
                              fontSize: getResponsiveSmallFontSize(context)),
                        ),
                        UnconstrainedBox(
                          child: Obx(
                            () => Switch(
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
                                  return kcPrimaryColor;
                                },
                              ),
                              onChanged: (value) {
                                _showConfirmationDialog(
                                    context,
                                    entry.node.isActive,
                                    entry.node.accountName);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, RxBool isActive, String title) {
    bool currentValue = isActive.value;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm'),
          content: Text(
            'Are you sure you want to ${currentValue ? 'deactivate' : 'activate'} $title?',
            style: getRegularStyle(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: getRegularStyle(
                  color: currentValue ? kcGreenColor : kcRedColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.toggle(isActive);
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes',
                style: getRegularStyle(
                  color: currentValue ? kcRedColor : kcGreenColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
