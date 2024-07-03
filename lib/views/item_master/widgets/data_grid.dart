
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/views/item_master/item_master_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGrid extends GetView<ItemMasterController> {
  const DataGrid({super.key});

  @override
  Widget build(BuildContext context)  {
    
    final controller = Get.put(ItemMasterController());

    return SfTheme(
      data: SfThemeData(
        dataGridThemeData: SfDataGridThemeData(
          headerColor: kcPrimaryColor, // Example of customizing header color
          gridLineColor: Colors.grey[200],
          rowHoverColor: Colors.grey[200],
          rowHoverTextStyle: getRegularStyle(),
        ),
      ),
      child:  SfDataGrid(
              columnWidthMode: ColumnWidthMode.values[0],
              source: controller.itemDataSource,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'itemNo',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Item No',
                      style: getRegularStyle(
                        color: kcWhitecolor,
                      ),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'description',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: getRegularStyle(
                        color: kcWhitecolor,
                      ),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'baseUnit',
                  label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Base Unit',
                style: getRegularStyle(
                  color: kcWhitecolor,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'packingType',
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Packing Type',
                style: getRegularStyle(
                  color: kcWhitecolor,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'brand',
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Brand',
                style: getRegularStyle(color: kcWhitecolor),
              ),
            ),
          ),
          GridColumn(
            columnName: 'supplier',
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Supplier',
                style: getRegularStyle(
                  color: kcWhitecolor,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'purchasePrice',
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Purchase Price',
                style: getRegularStyle(
                  color: kcWhitecolor,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'salePrice',
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'salePrice',
                style: getRegularStyle(
                  color: kcWhitecolor,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'action',
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                'Action',
                style: getRegularStyle(
                  color: kcWhitecolor,
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
