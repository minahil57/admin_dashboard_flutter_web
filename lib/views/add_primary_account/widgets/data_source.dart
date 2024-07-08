import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PrimaryAccountSource extends DataGridSource {
  PrimaryAccountSource({required List<MyTreeNode> accounts}) {
    _item = accounts
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'accountCode', value: e.accountCode),
              DataGridCell(columnName: 'description', value: e.description == null ? '-' : e.description!),

              DataGridCell<String>(columnName: 'accountType', value: e.accountName),
              DataGridCell<String>(
                  columnName: 'balanceType', value: e.balanceType),
               DataGridCell(columnName: 'actions', value : e.isActive),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _item = [];

  @override
  List<DataGridRow> get rows => _item;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          // log(dataGridCell.value);
      return  Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: dataGridCell.columnName == 'actions' ? UnconstrainedBox(
          alignment: Alignment.topLeft,
              child: Switch(
                value: dataGridCell.value,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

                  // dataGridCell.value = value;
                },
              ),

        )
          : Text(
            dataGridCell.value == '' ? '-' : dataGridCell.value.toString(),
            softWrap: true,
            textAlign: TextAlign.start,
            style: getRegularStyle(
              fontSize: 14,
            ),

        ),
      );
    }).toList());
  }

  void updateDataSource(List<MyTreeNode> accounts) {
    _item = accounts
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'accountCode', value: e.accountCode),
              DataGridCell(columnName: 'description', value: e.description),
              DataGridCell<String>(columnName: 'accountType', value: e.accountName),

              DataGridCell<String>(
                  columnName: 'balanceType', value: e.balanceType),
             DataGridCell(columnName: 'actions', value: e.isActive),
            ],
          ),
        )
        .toList();
    notifyListeners();
  }
}
