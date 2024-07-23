import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VoucherItemsDataGrid extends GetView<AddPurchaseController> {
  const VoucherItemsDataGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPurchaseController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: GetBuilder<AddPurchaseController>(
        builder: (controller) {
          return Obx(() {
            // Check if voucherItemsSource is initialized
            if (controller.voucherItemsSource.value == null ||
                controller.voucherItemsSource.value!.accNums.isEmpty) {
              return CircularProgressIndicator(); // or any loading widget
            } else {
              return SfTheme(
                data: SfThemeData(
                  dataGridThemeData: SfDataGridThemeData(
                    headerColor:
                    kcPrimaryColor,
                    // Example of customizing header color
                    gridLineColor: Colors.grey[400],
                    columnDragIndicatorColor: kcMediumGrey,
                    indentColumnColor: kcPrimaryColor,
                    filterIcon: Icon(
                      Icons.filter_alt,
                    ),
                    rowHoverColor: Colors.grey[400],
                    rowHoverTextStyle: getRegularStyle(),
                  ),
                ),
                child: SfDataGrid(
                  allowEditing: true,
                  gridLinesVisibility: GridLinesVisibility.both,
                  editingGestureType: EditingGestureType.tap,
                  navigationMode: GridNavigationMode.cell,
                  selectionMode: SelectionMode.single,
                  columnWidthMode: ColumnWidthMode.fill,
                  source: controller.voucherItemsSource.value!,
                  defaultColumnWidth: 120,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'accountCode',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      columnName: 'accountName',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      columnName: 'debit',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      columnName: 'tax',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                      columnName: 'vat',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Vat',
                          style: getRegularStyle(color: kcWhitecolor),
                        ),
                      ),
                    ),
                    GridColumn(
                      columnName: 'totalNarration',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                      columnName: 'costCenter1',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      columnName: 'costCenter2',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      columnName: 'costCenter3',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      columnName: 'costCenter4',
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
              );
            }
          }

          );
        }

  ),
        ),
      ],
    );
  }
}

