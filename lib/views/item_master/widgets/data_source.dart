
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class ItemDataSource extends DataGridSource {
  ItemDataSource({required List<ItemMaster> items}) {
    _item = items
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'itemNo', value: e.itemNo),
              DataGridCell<String>(columnName: 'description', value: e.itemDescription),
              DataGridCell<String>(
                  columnName: 'basaeUnit', value: e.unitMeasurement),
              DataGridCell<String>(columnName: 'packingType', value: e.packingType),
              DataGridCell<String>(
                  columnName: 'brand', value: e.vat),
              DataGridCell(columnName: 'supplier', value: e.supplier),
              DataGridCell(columnName: 'purchasePrice', value: e.purchasePrice),
              DataGridCell(columnName: 'salePrice', value: e.salePrice),
              const DataGridCell(columnName: 'actions',value: ''),
              
             
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
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          dataGridCell.value == '' ? '-' : dataGridCell.value.toString(),
          softWrap: true,
          style: getRegularStyle(
            fontSize: 12,
          ),
        ),
      );
    }).toList());
  }
  void updateDataSource(List<ItemMaster> newData) {
    _item = newData.map<DataGridRow>((e) => DataGridRow(cells: [
         
              DataGridCell<String>(columnName: 'itemNo', value: e.itemNo),
              DataGridCell<String>(columnName: 'description', value: e.itemDescription),
              DataGridCell<String>(
                  columnName: 'basaeUnit', value: e.unitMeasurement),
              DataGridCell<String>(columnName: 'packingType', value: e.packingType),
              DataGridCell<String>(
                  columnName: 'brand', value: e.vat),
              DataGridCell(columnName: 'supplier', value: e.supplier),
              DataGridCell(columnName: 'purchasePrice', value: e.purchasePrice),
              DataGridCell(columnName: 'salePrice', value: e.salePrice),
                const DataGridCell(columnName: 'actions',value: ''),
        ])).toList();
    notifyListeners();
  }
}
