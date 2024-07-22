import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/constants/side_bar_items.dart';
import 'package:getx_admin_panel/core/helpers/ui_helpers.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/models/purcahse_voucher_model.dart';
import 'package:getx_admin_panel/models/voucher_items.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///Dart import
// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/dealer.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Set dealer's data collection to data grid source.
class VoucherItemsSource extends DataGridSource {
  /// Creates the dealer data source class with required details.
  VoucherItemsSource() {
    textStyle = const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black87);

    items = _getDealerDetails(100);
    buildDataGridRows();
  }

  late List<VoucherItems> items;

  late List<DataGridRow> dataGridRows;

  late TextStyle textStyle;

  Random random = Random();

  TextEditingController editingController = TextEditingController();

  dynamic newCellValue;

  bool isDatePickerVisible = false;

  /// Building the [DataGridRow]'s.
  void buildDataGridRows() {
    dataGridRows = items
        .map<DataGridRow>((VoucherItems item) => item.getDataGridRow())
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((DataGridCell dataGridCell) {
      final bool isRightAlign = dataGridCell.columnName == 'vat' ||
          dataGridCell.columnName == 'tax' ||
          dataGridCell.columnName == 'debit';

      String value = dataGridCell.value.toString();

      if (dataGridCell.columnName == 'debit') {
        value = NumberFormat.currency(locale: 'en_US', symbol: r'AE')
            .format(dataGridCell.value);
      } else if (dataGridCell.columnName == 'tax' ||
          dataGridCell.columnName == 'vat') {
        value = NumberFormat.currency(locale: 'en_US', symbol: r'%')
            .format(dataGridCell.value);
      }

      return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: isRightAlign ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          value,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList());
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    if (column.columnName == 'accountName') {
      return _buildDropDownWidget(displayText, submitCell, _shipCountry);
    } else if (column.columnName == 'accountCode') {
      return _buildDropDownWidget(
          displayText , submitCell, _shipCountry);
    } else if (column.columnName == 'costCenter3') {
      return _buildDropDownWidget(
          displayText , submitCell, _shipCountry);
    } else if (column.columnName == 'costCenter1') {
      return _buildDropDownWidget(
          displayText , submitCell, _shipCountry);
    } else if (column.columnName == 'costCenter2') {
      return _buildDropDownWidget(
          displayText, submitCell, _shipCountry);
    } else if (column.columnName == 'costCenter4') {
      return _buildDropDownWidget(
          displayText , submitCell, _shipCountry);
    } else {
      return _buildTextFieldWidget(displayText, column, submitCell);
    }
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) async {
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
  }

  RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
    return isNumericKeyBoard
        ? columnName == 'Price'
            ? RegExp('[0-9.]')
            : RegExp('[0-9]')
        : RegExp('[a-zA-Z ]');
  }

  /// Building a [TextField] for numeric and text column.
  Widget _buildTextFieldWidget(
      String displayText, GridColumn column, CellSubmit submitCell) {
    final bool isTextAlignRight = column.columnName == 'tax' ||
        column.columnName == 'vat' ||
        column.columnName == 'debit';

    final bool isNumericKeyBoardType = column.columnName == 'vat' ||
        column.columnName == 'tax' ||
        column.columnName == 'debit';

    // Holds regular expression pattern based on the column type.
    final RegExp regExp = _getRegExp(isNumericKeyBoardType, column.columnName);

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment:
          isTextAlignRight ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isTextAlignRight ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        // keyboardAppearance: kcPrimaryColor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kcPrimaryColor))),
        style: textStyle,
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
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }

  /// Building a [DatePicker] for datetime column.
  Widget _buildDateTimePicker(String displayText, CellSubmit submitCell) {
    final DateTime selectedDate = DateTime.parse(displayText);
    final DateTime firstDate = DateTime.parse('1999-01-01');
    final DateTime lastDate = DateTime.parse('2016-12-31');

    // To restrict the multiple time calls for the datepicker.
    isDatePickerVisible = false;
    displayText = DateFormat('MM/dd/yyyy').format(DateTime.parse(displayText));
    return Builder(
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: Focus(
            autofocus: true,
            focusNode: FocusNode()
              ..addListener(() async {
                if (!isDatePickerVisible) {
                  isDatePickerVisible = true;
                  await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: firstDate,
                      lastDate: lastDate,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                  primary: kcPrimaryColorDark)),
                          child: child!,
                        );
                      }).then((DateTime? value) {
                    newCellValue = value;

                    /// Call [CellSubmit] callback to fire the canSubmitCell and
                    /// onCellSubmit to commit the new value in single place.
                    submitCell();
                  });
                }
              }),
            child: Text(
              displayText,
              textAlign: TextAlign.right,
              style: textStyle,
            ),
          ),
        );
      },
    );
  }

  //// Drop down color of items
  Color dropDownColor() {
    return const Color(0xFFEEE8F4);
  }

  /// Building a [DropDown] for combo box column.
  Widget _buildDropDownWidget(
      String displayText, CellSubmit submitCell, List<String> items) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: CustomDropdown<String>.search(
        items: items,
        onChanged: (String? newValue) {
          newCellValue = newValue ?? '';
        },



      ),
    );
  }
  // ------------- Populating the dealer info collection's. ----------------
  // ------------------------------------------------------------------------

  List<VoucherItems> _getDealerDetails(int count) {
    final List<VoucherItems> itemDetails = <VoucherItems>[];
    final List<DateTime> shippedDate = getDateBetween(2001, 2016, count);
    for (int i = 1; i <= count; i++) {
      final String selectedShipCountry = _shipCountry[random.nextInt(5)];
      final List<String> selectedShipCities = _shipCity[selectedShipCountry]!;
      final VoucherItems ord = VoucherItems(
        _productNo[random.nextInt(15)],
        selectedShipCountry,
        selectedShipCountry,
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)].toDouble(),
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        selectedShipCountry,
        selectedShipCountry,
        selectedShipCountry,
        selectedShipCountry,
        selectedShipCountry,
      );
      itemDetails.add(ord);
    }

    return itemDetails;
  }

  /// Helps to populate the random number between the [min] and [max] value.
  int next(int min, int max) => min + random.nextInt(max - min);

  /// Populate the random date between the [startYear] and [endYear]
  List<DateTime> getDateBetween(int startYear, int endYear, int count) {
    final List<DateTime> date = <DateTime>[];
    for (int i = 0; i < count; i++) {
      final int year = next(startYear, endYear);
      final int month = random.nextInt(12);
      final int day = random.nextInt(30);
      date.add(DateTime(year, month, day));
    }

    return date;
  }

  final Map<String, List<String>> _shipCity = <String, List<String>>{
    'Argentina': <String>['Rosario', 'Catamarca', 'Formosa', 'Salta'],
    'Austria': <String>['Graz', 'Salzburg', 'Linz', 'Wels'],
    'Belgium': <String>['Bruxelles', 'Charleroi', 'Namur', 'Mons'],
    'Brazil': <String>[
      'Campinas',
      'Resende',
      'Recife',
      'Manaus',
    ],
    'Canada': <String>[
      'Alberta',
      'Montreal',
      'Tsawwassen',
      'Vancouver',
    ],
    'Denmark': <String>[
      'Svendborg',
      'Farum',
      'Åarhus',
      'København',
    ],
    'Finland': <String>['Helsinki', 'Espoo', 'Oulu'],
    'France': <String>[
      'Lille',
      'Lyon',
      'Marseille',
      'Nantes',
      'Paris',
      'Reims',
      'Strasbourg',
      'Toulouse',
      'Versailles'
    ],
    'Germany': <String>[
      'Aachen',
      'Berlin',
      'Brandenburg',
      'Cunewalde',
      'Frankfurt',
      'Köln',
      'Leipzig',
      'Mannheim',
      'München',
      'Münster',
      'Stuttgart'
    ],
    'Ireland': <String>['Cork', 'Waterford', 'Bray', 'Athlone'],
    'Italy': <String>[
      'Bergamo',
      'Reggio Calabria',
      'Torino',
      'Genoa',
    ],
    'Mexico': <String>[
      'Mexico City',
      'Puebla',
      'León',
      'Zapopan',
    ],
    'Norway': <String>['Stavern', 'Hamar', 'Harstad', 'Narvik'],
    'Poland': <String>['Warszawa', 'Gdynia', 'Rybnik', 'Legnica'],
    'Portugal': <String>['Lisboa', 'Albufeira', 'Elvas', 'Estremoz'],
    'Spain': <String>[
      'Barcelona',
      'Madrid',
      'Sevilla',
      'Bilboa',
    ],
    'Sweden': <String>['Bräcke', 'Piteå', 'Robertsfors', 'Luleå'],
    'Switzerland': <String>[
      'Bern',
      'Genève',
      'Charrat',
      'Châtillens',
    ],
    'UK': <String>['Colchester', 'Hedge End', 'London', 'Bristol'],
    'USA': <String>[
      'Albuquerque',
      'Anchorage',
      'Boise',
      'Butte',
      'Elgin',
      'Eugene',
      'Kirkland',
      'Lander',
      'Portland',
      'San Francisco',
      'Seattle',
    ],
    'Venezuela': <String>[
      'Barquisimeto',
      'Caracas',
      'Isla de Margarita',
      'San Cristóbal',
      'Cantaura',
    ],
  };

  final List<String> _customersMale = <String>[
    'Adams',
    'Owens',
    'Thomas',
    'Doran',
    'Jefferson',
    'Spencer',
    'Vargas',
    'Grimes',
    'Edwards',
    'Stark',
    'Cruise',
    'Fitz',
    'Chief',
    'Blanc',
    'Stone',
    'Williams',
    'Jobs',
    'Holmes'
  ];

  final List<String> _customersFemale = <String>[
    'Crowley',
    'Waddell',
    'Irvine',
    'Keefe',
    'Ellis',
    'Gable',
    'Mendoza',
    'Rooney',
    'Lane',
    'Landry',
    'Perry',
    'Perez',
    'Newberry',
    'Betts',
    'Fitzgerald',
  ];

  final List<int> _productNo = <int>[
    1803,
    1345,
    4523,
    4932,
    9475,
    5243,
    4263,
    2435,
    3527,
    3634,
    2523,
    3652,
    3524,
    6532,
    2123
  ];

  final List<String> _shipCountry = <String>[
    'Argentina',
    'Austria',
    'Belgium',
    'Brazil',
    'Canada',
    'Denmark',
    'Finland',
    'France',
    'Germany',
    'Ireland',
    'Italy',
    'Mexico',
    'Norway',
    'Poland',
    'Portugal',
    'Spain',
    'Sweden',
    'UK',
    'USA',
  ];
}

// class VoucherItemsSource extends DataGridSource {
//   VoucherItemsSource({required List<VoucherItems> items}) {
//     _items = items
//         .map<DataGridRow>(
//           (e) => DataGridRow(
//         cells: [
//           DataGridCell<String>(columnName: 'accountCode', value: e.accountCode),
//           DataGridCell<String>(columnName: 'accountName', value: e.accountName),
//           DataGridCell<int>(columnName: 'debit', value: e.amountDebit),
//           DataGridCell<int>(columnName: 'tax', value: e.taxCode),
//           DataGridCell<int>(columnName: 'vat', value: e.vat),
//           DataGridCell<String>(columnName: 'totalNarration', value: e.narration),
//           DataGridCell<String>(columnName: 'costCenter1', value: e.costCenter1),
//           DataGridCell<String>(columnName: 'costCenter2', value: e.costCenter2),
//           DataGridCell<String>(columnName: 'costCenter3', value: e.costCenter3),
//           DataGridCell<String>(columnName: 'costCenter4', value: e.costCenter4),
//           const DataGridCell(columnName: 'actions', value: ''),
//         ],
//       ),
//     ).toList();
//   }
//
//   List<DataGridRow> _items = [];
//
//   @override
//   List<DataGridRow> get rows => _items;
//
//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     final controller = Get.put(AddPurchaseController());
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((dataGridCell) {
//         return dataGridCell.columnName == 'actions'
//             ? Visibility(
//           visible: !controller.isFirstRowValue.value,
//           child: Row(
//             children: [
//               const Icon(
//                 Icons.edit,
//                 color: kcGreenColor,
//                 size: 18,
//               ),
//               horizontalSpaceMedium,
//               const Icon(
//                 Icons.delete_outline,
//                 color: kcRedColor,
//                 size: 18,
//               ),
//             ],
//           ),
//         )
//             : Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             dataGridCell.value == '' ? '-' : dataGridCell.value.toString(),
//             softWrap: true,
//             style: getRegularStyle(
//               fontSize: 12,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   void updateDataSource(List<VoucherItems> newData) {
//     _items = newData
//         .map<DataGridRow>(
//           (e) => DataGridRow(
//         cells: [
//           DataGridCell<String>(columnName: 'accountCode', value: e.accountCode),
//           DataGridCell<String>(columnName: 'accountName', value: e.accountName),
//           DataGridCell<int>(columnName: 'debit', value: e.amountDebit),
//           DataGridCell<int>(columnName: 'tax', value: e.taxCode),
//           DataGridCell<int>(columnName: 'vat', value: e.vat),
//     DataGridCell<String>(columnName: 'totalNarration', value: e.narration),
//           DataGridCell<String>(columnName: 'costCenter1', value: e.costCenter1),
//           DataGridCell<String>(columnName: 'costCenter2', value: e.costCenter2),
//           DataGridCell<String>(columnName: 'costCenter3', value: e.costCenter3),
//           DataGridCell<String>(columnName: 'costCenter4', value: e.costCenter4),
//           const DataGridCell(columnName: 'actions', value: ''),
//         ],
//       ),
//     ).toList();
//     notifyListeners();
//   }
//
//   dynamic newCellValue;
//
//   /// Helps to control the editable text in the [TextField] widget.
//   TextEditingController editingController = TextEditingController();
//
//   @override
//   Future<void> onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) async {
//     final dynamic oldValue = dataGridRow
//         .getCells()
//         .firstWhereOrNull((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
//         ?.value ?? '';
//
//     final int dataRowIndex = _items.indexOf(dataGridRow);
//
//     if (newCellValue == null || oldValue == newCellValue) {
//       return;
//     }
//
//     if (column.columnName == 'id') {
//       _items[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
//           DataGridCell<int>(columnName: 'id', value: newCellValue);
//     } else if (column.columnName == 'name') {
//       _items[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
//           DataGridCell<String>(columnName: 'name', value: newCellValue);
//     } else if (column.columnName == 'designation') {
//       _items[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
//           DataGridCell<String>(columnName: 'designation', value: newCellValue);
//     } else {
//       _items[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
//           DataGridCell<int>(columnName: 'salary', value: newCellValue);
//     }
//     notifyListeners();
//   }
//
//   @override
//   Widget? buildEditWidget(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
//     // Determine the current cell value to display in the TextField
//     final dynamic oldValue = dataGridRow
//         .getCells()
//         .firstWhereOrNull((DataGridCell dataGridCell) =>
//     dataGridCell.columnName == column.columnName)
//         ?.value ?? '';
//
//     // Reset newCellValue to null initially
//     dynamic newCellValue;
//
//     // Determine if the column represents a numeric type
//     final bool isNumericType = column.columnName == 'id' || column.columnName == 'salary';
//
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
//       child: TextField(
//         autofocus: true,
//         controller: editingController..text = oldValue.toString(),
//         textAlign: isNumericType ? TextAlign.right : TextAlign.left,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
//         ),
//         keyboardType: isNumericType ? TextInputType.number : TextInputType.text,
//         onChanged: (String value) {
//           if (value.isNotEmpty) {
//             if (isNumericType) {
//               newCellValue = int.tryParse(value) ?? oldValue;
//             } else {
//               newCellValue = value;
//             }
//           } else {
//             newCellValue = null;
//           }
//         },
//         onSubmitted: (String value) {
//           // Call the submitCell callback to commit the new value
//           submitCell();
//         },
//       ),
//     );
//   }
//
// }
