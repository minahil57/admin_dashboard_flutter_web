import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/searchable_dropdown.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';

import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/voucher_items.dart';

import '../../../models/purchase_voucher_dropdowns.dart';

class VoucherItemsSource extends DataGridSource {
  VoucherItemsSource(this.accNums,
      this.accNames,
      this.cc1Names,
      this.cc2Names,
      this.cc3Names,
      this.cc4Names,
      this.items,
      this.accounts,
      this.context,) {
    buildDataGridRows();
  }

  final List<String> accNums;
  final BuildContext? context;
  final List<Account> accounts;
  final List<String> accNames;
  final List<String> cc1Names;
  final List<String> cc2Names;
  final List<String> cc3Names;
  final List<String> cc4Names;
  final List<VoucherItems> items;

  late List<DataGridRow> dataGridRows;

  TextEditingController editingController = TextEditingController();
  dynamic newCellValue;
  bool isDatePickerVisible = false;

  List<String> searchValues = List.filled(10, '');
  String searchValue = '';

  /// Building the [DataGridRow]'s.
  void buildDataGridRows() {
    dataGridRows = items
        .map<DataGridRow>((VoucherItems item) => item.getDataGridRow())
        .toList();
  }

  void addSearchRow() {
    dataGridRows.insert(
        0,
        DataGridRow(
            cells: List.generate(
                10,
                    (index) =>
                const DataGridCell(columnName: 'Search', value: ''))));
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    bool isHighlighted = false;
    if (searchValue.isNotEmpty) {
      isHighlighted = row.getCells().any(
              (DataGridCell cell) =>
              cell.value.toString().contains(searchValue));
    }
    int rowIndex = dataGridRows.indexOf(row);
    return DataGridRowAdapter(
      color:
      isHighlighted ? Colors.yellow.withOpacity(0.3) : Colors.transparent,
      cells: row.getCells().map<Widget>((DataGridCell dataGridCell) {
        final bool isRightAlign = dataGridCell.columnName == 'vat' ||
            dataGridCell.columnName == 'tax' ||
            dataGridCell.columnName == 'debit';
        String value = dataGridCell.value.toString();
        if (dataGridCell.columnName == 'debit') {
          value = NumberFormat.currency(locale: 'ar_UAE', symbol: r'AE')
              .format(dataGridCell.value);
        } else if (dataGridCell.columnName == 'tax' ||
            dataGridCell.columnName == 'vat') {
          value =
              NumberFormat.percentPattern('en_US').format(dataGridCell.value);
        }
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment:
          isRightAlign ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget? buildEditWidget(
      DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex,
      GridColumn column,
      CellSubmit submitCell,) {
    final focusNode = FocusNode();
    final String displayText = dataGridRow
        .getCells()
        .firstWhereOrNull((DataGridCell dataGridCell) =>
    dataGridCell.columnName == column.columnName)
        ?.value
        ?.toString() ??
        '';

    newCellValue = null;

    if (column.columnName == 'accountName') {
      return _buildDropDownWidget(
          displayText, submitCell, accNames, column.columnName,dataGridRow,rowColumnIndex,column);
    } else if (column.columnName == 'accountCode') {
      return _buildDropDownWidget(
          displayText, submitCell, accNums, column.columnName,dataGridRow,rowColumnIndex,column);
    } else if (column.columnName == 'costCenter3') {
      return _buildDropDownWidget(
          displayText, submitCell, cc3Names, column.columnName,dataGridRow,rowColumnIndex,column);
    } else if (column.columnName == 'costCenter1') {
      return _buildDropDownWidget(
          displayText, submitCell, cc1Names, column.columnName,dataGridRow,rowColumnIndex,column);
    } else if (column.columnName == 'costCenter2') {
      return _buildDropDownWidget(
          displayText, submitCell, cc2Names, column.columnName,dataGridRow,rowColumnIndex,column);
    } else if (column.columnName == 'costCenter4') {
      return _buildDropDownWidget(
          displayText, submitCell, cc4Names, column.columnName,dataGridRow,rowColumnIndex,column);
    } else {
      return _buildTextFieldWidget(
        displayText,
        column,
        submitCell,
      );
    }
  }

  @override
  Future<void> onCellSubmit(
      DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex,
      GridColumn column,
      ) async {
    final dynamic oldValue = dataGridRow
        .getCells()
        .firstWhereOrNull((DataGridCell dataGridCell) =>
    dataGridCell.columnName == column.columnName)
        ?.value ??
        '';

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    // Updating the value in the data model
    if (column.columnName == 'accountCode') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'accountCode', value: newCellValue);
      items[dataRowIndex].accountCode = newCellValue;
    } else if (column.columnName == 'accountName') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'accountName', value: newCellValue);
      items[dataRowIndex].accountName = newCellValue;
    } else if (column.columnName == 'debit') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'debit', value: newCellValue);
      items[dataRowIndex].amountDebit = newCellValue as int;
    } else if (column.columnName == 'tax') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'tax', value: newCellValue);
      items[dataRowIndex].taxCode = newCellValue as int;
    } else if (column.columnName == 'vat') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'vat', value: newCellValue);
      items[dataRowIndex].vat = newCellValue as int;
    } else if (column.columnName == 'totalNarration') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: 'totalNarration', value: newCellValue);
      items[dataRowIndex].narration = newCellValue;
    } else if (column.columnName == 'costCenter1') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'costCenter1', value: newCellValue);
      items[dataRowIndex].costCenter1 = newCellValue;
    } else if (column.columnName == 'costCenter2') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'costCenter2', value: newCellValue);
      items[dataRowIndex].costCenter2 = newCellValue;
    } else if (column.columnName == 'costCenter3') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'costCenter3', value: newCellValue);
      items[dataRowIndex].costCenter3 = newCellValue;
    } else {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'costCenter4', value: newCellValue);
      items[dataRowIndex].costCenter4 = newCellValue;
    }

    notifyListeners(); // Assuming this is in a DataGridSource subclass
  }

  void performSearch(String value) {
    searchValue = value;
    if (searchValue.isEmpty) {
      dataGridRows = items
          .map<DataGridRow>((VoucherItems item) => item.getDataGridRow())
          .toList();
    } else {
      dataGridRows = items
          .where((item) {
        return item.accountCode.contains(searchValues[0]) &&
            item.accountName.contains(searchValues[1]) &&
            item.costCenter1.contains(searchValues[6]) &&
            item.costCenter2.contains(searchValues[7]) &&
            item.costCenter3.contains(searchValues[8]) &&
            item.costCenter4.contains(searchValues[9]) &&
            item.vat.toString().contains(searchValues[4]) &&
            item.narration.contains(searchValues[5]) &&
            item.taxCode.toString().contains(searchValues[3]) &&
            item.amountDebit.toString().contains(searchValues[2]);
      })
          .map<DataGridRow>((VoucherItems item) => item.getDataGridRow())
          .toList();
    }
    notifyListeners();
  }

  void updateSearchValue(int index, String value) {
    searchValues[index] = value;
    performSearch(value);
  }

  RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
    return isNumericKeyBoard
        ? columnName == 'Price'
        ? RegExp('[0-9.]')
        : RegExp('[0-9]')
        : RegExp('[a-zA-Z ]');
  }

  Widget _buildTextFieldWidget(String displayText,
      GridColumn column,
      CellSubmit submitCell,) {
    final bool isTextAlignRight = column.columnName == 'tax' ||
        column.columnName == 'vat' ||
        column.columnName == 'debit';

    final bool isNumericKeyBoardType = column.columnName == 'vat' ||
        column.columnName == 'tax' ||
        column.columnName == 'debit';

    final RegExp regExp = _getRegExp(isNumericKeyBoardType, column.columnName);

    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          submitCell();
          // No need to return KeyEventResult
        }

      },
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isTextAlignRight ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kcPrimaryColor),
          ),
        ),
        style: getRegularStyle(),
        cursorColor: kcPrimaryColor,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(regExp)
        ],
        keyboardType:
        isNumericKeyBoardType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericKeyBoardType) {
              newCellValue = column.columnName == 'debit'
                  ? double.parse(value)
                  : int.parse(value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }

  Color dropDownColor() {
    return const Color(0xFFEEE8F4);
  }

  Widget _buildDropDownWidget(String displayText,
      CellSubmit submitCell,
      List<String> items,
      String columnName,
      DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex,
      GridColumn column,
      ) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          submitCell();
          // No need to return KeyEventResult
        }
      },
      child: Container(
        alignment: Alignment.centerLeft,
        child: SearchableDropdownRenderer(
          items: items,
          text: displayText,
          context: context!,
          onSubmitted: (String? value) {
            submitCell();
          },
          onChanged: (String? value) {
            if (value != null) {
              newCellValue = value;
              _updateRelatedField(value, columnName,dataGridRow,rowColumnIndex,column);
            } else {
              newCellValue = '';
            }
          },
        ),
      ),
    );
  }

  void _updateRelatedField(String value, String columnName,DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex,
      GridColumn column,) {
    int rowIndex;

    if (columnName == 'accountCode') {
      rowIndex = dataGridRows.indexWhere((row) {
        return row.getCells().any((cell) => cell.columnName == 'accountCode' && cell.value == value);
      });
    } else if (columnName == 'accountName') {
      rowIndex = dataGridRows.indexWhere((row) {
        return row.getCells().any((cell) => cell.columnName == 'accountName' && cell.value == value);
      });
    } else {
      print('Error: Unsupported column name.');
      return;
    }

    // if (rowIndex == -1) {
    //   print('Error: Row with specified value not found.');
    //   return;
    // }

    if (columnName == 'accountCode') {
      Account? selectedAccount =
      accounts.firstWhereOrNull((account) => account.id == value);
      if (selectedAccount != null) {
        // newCellValue = selectedAccount.name;
        // onCellSubmit( dataGridRow,
        //    rowColumnIndex,
        //    column,);
        _updateDataGridRow(rowColumnIndex.rowIndex, 'accountName', selectedAccount.name,value,rowColumnIndex,dataGridRow);
      }
    } else if (columnName == 'accountName') {
      Account? selectedAccount =
      accounts.firstWhereOrNull((account) => account.name == value);
      if (selectedAccount != null) {
        // newCellValue = selectedAccount.id;
        // onCellSubmit( dataGridRow,
        //   rowColumnIndex,
        //   column,);
        _updateDataGridRow(rowColumnIndex.rowIndex, 'accountCode', selectedAccount.id,value,rowColumnIndex,dataGridRow);
      }
    }
  }

  void _updateDataGridRow(int rowIndex, String columnName, String newValue,String value,RowColumnIndex rowColumnIndex, DataGridRow dataGridRow ) {
    if (rowIndex < 0 || rowIndex >= dataGridRows.length) {
      print('Error: Invalid rowIndex.');
      return;
    }
    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);
    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell<String>(columnName: 'accountCode', value: newCellValue);
    DataGridRow oldRow = dataGridRows[rowIndex];

    List<DataGridCell> updatedCells = oldRow.getCells().map((cell) {
      if (cell.columnName == columnName) {
        return DataGridCell<String>(columnName: columnName, value: newValue);
      } else {
        return cell;
      }
    }).toList();

    DataGridRow newRow = DataGridRow(cells: updatedCells);



    dataGridRows[rowIndex] = newRow;

    if (columnName == 'accountCode') {
      items[rowIndex].accountCode = newValue;
    } else if (columnName == 'accountName') {
      items[rowIndex].accountName = newValue;
    }
    newCellValue = value;

    notifyListeners();
  }
}


class EditableDataGridCell extends StatefulWidget {
  final String displayText;
  final GridColumn column;
  final CellSubmit submitCell;
  // final bool isTextAlignRight;
  // final bool isNumericKeyBoardType;
  // final RegExp regExp;
  final FocusNode focusNode;

  EditableDataGridCell({
    required this.displayText,
    required this.column,
    required this.submitCell,
    // required this.isTextAlignRight,
    // required this.isNumericKeyBoardType,
    // required this.regExp,
    required this.focusNode,
  });

  @override
  _EditableDataGridCellState createState() => _EditableDataGridCellState();
}

class _EditableDataGridCellState extends State<EditableDataGridCell> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.displayText);
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        // Ensure the text field is in focus when the focus node is active
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: widget.focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
          widget.focusNode.requestFocus(); // Focus the text field
          return; // No need to return a result
        }
      },
      child: TextField(
        autofocus: true,
        controller: _controller,
        focusNode: widget.focusNode,
        // textAlign: widget.isTextAlignRight ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        style: TextStyle(fontSize: 14),
        cursorColor: Colors.blue,
        inputFormatters: <TextInputFormatter>[
          // FilteringTextInputFormatter.allow(widget.regExp),
        ],
        // keyboardType: widget.isNumericKeyBoardType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            // if (widget.isNumericKeyBoardType) {
            //   // Handle numeric values
            // } else {
            //   // Handle text values
            // }
          } else {
            // Handle empty values
          }
        },
        onSubmitted: (String value) {
          widget.submitCell(); // Submit the cell when Enter is pressed
        },
      ),
    );
  }
}
