import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/views/add_primary_account/add_primary_account_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PrimaryAccountDataGrid extends GetView<AddPrimaryAccountController> {
  const PrimaryAccountDataGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPrimaryAccountController());

    return Column(
      mainAxisSize: MainAxisSize.min, // Add this to prevent Column from taking up all available space
      children: [
        // Add other widgets here if needed
        Flexible(
          fit: FlexFit.loose,
          child: SfTheme(
            data: SfThemeData(
              dataGridThemeData: SfDataGridThemeData(
                headerColor: kcPrimaryColor,
                gridLineColor: Colors.grey[400],
                rowHoverColor: Colors.grey[200],
                rowHoverTextStyle: getRegularStyle(
                  fontSize: 14,
                ),
              ),
            ),
            child: SfDataGrid(
              allowSorting: true,
              allowColumnsResizing: true,
              defaultColumnWidth: 320,
              columnWidthMode: ColumnWidthMode.values[0],
              source: controller.primaryAccountSource,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'accountCode',
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Account Code',
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: kcWhitecolor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'description',
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Description',

                      style: getRegularStyle(
                        color: kcWhitecolor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'accountType',
                  label: Text(
                    'AccountType',
                    style: getRegularStyle(
                      color: kcWhitecolor,
                      fontSize: 16,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'balanceType',
                  label: Text(
                    'Balance Type',
                    style: getRegularStyle(
                      color: kcWhitecolor,
                      fontSize: 16,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'actions',
                  label: Text(
                    'Actions',
                    style: getRegularStyle(
                      color: kcWhitecolor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );


  }
}
