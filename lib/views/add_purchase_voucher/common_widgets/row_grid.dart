import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/search_bar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VoucherItemsDataGrid extends GetView<AddPurchaseController> {
  const VoucherItemsDataGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: GetBuilder<AddPurchaseController>(builder: (controller) {
            return Obx(() {
              if (controller.isLoading.value)
              // Check if voucherItemsSource is initialized
              // if (controller.voucherItemsSource.value == null ||
              //     controller.voucherItemsSource.value!.accNums.isEmpty)
              {
                return const CircularProgressIndicator(); // or any loading widget
              } else {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kcLightGrey,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      )),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Wrap(
                            runAlignment: WrapAlignment.end,
                            spacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_box_outlined)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.save)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_from_queue)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete_outline)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_done)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.filter_alt_off_outlined)),
                            ],
                          ),
                        ],
                      ),
                      SearchBarText(
                        controllers: controller.searchControllers,
                        onChanged: (index, value) {
                          controller.voucherItemsSource.value!
                              .updateSearchValue(index, value);
                        },
                      ),
                      ValueListenableBuilder<BuildContext?>(
                        valueListenable: controller.contextNotifier,
                        builder: (context, contextValue, child) {
                          if (contextValue == null) {
                            return const CircularProgressIndicator(); // or some loading indicator
                          }

                          return Focus(
                            autofocus: false,
                            onKeyEvent: (node, event) {
                              if (event is KeyDownEvent) {
                                if (event.logicalKey == LogicalKeyboardKey.enter) {
                                  // Start editing the current cell
                                  final details = controller.currentRowColumnIndex.value;
                                  if (details != null) {
                                    // controller.startEditing(details.rowIndex, details.columnIndex);
                                  }
                                  return KeyEventResult.handled;
                                } else if (event.logicalKey == LogicalKeyboardKey.tab) {
                                  // Move focus to the next cell
                                  final details = controller.currentRowColumnIndex.value;
                                  if (details != null) {
                                    final totalColumns = 8; // Update this based on the number of columns you have
                                    final totalRows = controller.voucherItemsSource.value!.rows.length;
                                    controller.moveNextCell(details.rowIndex, details.columnIndex, totalColumns, totalRows);
                                  }
                                  return KeyEventResult.handled;
                                }
                              }
                              return KeyEventResult.ignored;
                            },
                            child: SfTheme(
                              data: SfThemeData(
                                dataGridThemeData: SfDataGridThemeData(
                                  headerColor: kcPrimaryColor,
                                  // Example of customizing header color
                                  gridLineColor: Colors.grey[400],
                                  columnDragIndicatorColor: Colors.pink,
                                  columnResizeIndicatorColor: kcBlackColor,
                                  indentColumnColor: kcPrimaryColor,
                                  // columnDragIndicatorStrokeWidth: 40,
                                  filterIcon: const Icon(
                                    Icons.filter_alt,
                                  ),
                                  rowHoverColor: Colors.grey[400],
                                  rowHoverTextStyle: getRegularStyle(),
                                ),
                              ),
                              child: SfDataGrid(
                                headerGridLinesVisibility:
                                    GridLinesVisibility.both,
                                controller: controller.dataGridController,
                                selectionManager: controller.customSelectionManager,
                                tableSummaryRows:
                                    controller.getTableSummaryRows(),
                                allowEditing: true,
                                allowColumnsResizing: true,
                                onCellTap: (DataGridCellTapDetails details) {
                                  controller.setCurrentCell(details);
                                  // RowColumnIndex rowColumnIndex,   GridColumn column
                                  controller.startEditing(
                                  controller.voucherItemsSource.value!.dataGridRows[details.rowColumnIndex.rowIndex],
                                    details.rowColumnIndex
                                    ,details.column
                                      );
                                },
                                // onKeyDown: (KeyEvent event, DataGridCellKeyEventDetails details) {
                                //   _gridController.handleKeyEvent(event, details.rowColumnIndex.rowIndex, details.rowColumnIndex.columnIndex);
                                // },
                                editingGestureType: EditingGestureType
                                    .tap, // Disable default double-tap to edit
                                key: GlobalKey(),
                                columnResizeMode: ColumnResizeMode.onResize,
                                gridLinesVisibility: GridLinesVisibility.both,
                                navigationMode: GridNavigationMode.cell,
                                selectionMode: SelectionMode.single,
                                columnWidthMode: ColumnWidthMode.fill,
                                columnWidthCalculationRange:
                                    ColumnWidthCalculationRange.allRows,
                                source: controller.voucherItemsSource.value!,
                                onColumnResizeUpdate:
                                    (ColumnResizeUpdateDetails args) {
                                 return controller.onColumnResize(args);
                                },
                                columns: <GridColumn>[
                                  GridColumn(
                                    width: controller.accNameColumnWidth.value,
                                    columnName: 'accountCode',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Account Code',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.accNameColumnWidth.value,
                                    columnName: 'accountName',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Account Name',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.debitColumnWidth.value,
                                    columnName: 'debit',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Debit',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.taxColumnWidth.value,
                                    columnName: 'tax',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Tax',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.vatColumnWidth.value,
                                    columnName: 'vat',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Vat',
                                        style:
                                            getRegularStyle(color: kcWhitecolor),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.taxColumnWidth.value,
                                    columnName: 'totalNarration',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Total Narration',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.cc1ColumnWidth.value,
                                    columnName: 'costCenter1',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Cost Center 1',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.cc2ColumnWidth.value,
                                    columnName: 'costCenter2',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Cost Center 2',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.cc3ColumnWidth.value,
                                    columnName: 'costCenter3',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Cost Center 3',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    width: controller.cc4ColumnWidth.value,
                                    columnName: 'costCenter4',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Cost Center 4',
                                        style: getRegularStyle(
                                          color: kcWhitecolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // GridColumn(
                                  //   columnName: 'action',
                                  //   label: Container(
                                  //     padding: const EdgeInsets.symmetric(horizontal: 5),
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(
                                  //       'Action',
                                  //       style: getRegularStyle(
                                  //         color: kcWhitecolor,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            });
          }),
        ),
      ],
    );
  }
}
