import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_admin_panel/core/helpers/toast.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';
// import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

// RxDouble rowHeight = 100.0.obs;
// RxDouble gridHeight = calculateGridHeight().obs;
// double calculateGridHeight() {
//   double rowHeights = 50; // Approximate height of a row
//   const headerHeight = 70.0; // Approximate height of the header
//   const footerHeight = 100.0; // Approximate height of the footer if any
//   log(rowHeight.value.toString());
//   return rowHeight.value + headerHeight + footerHeight;
// }

class PlutoTable extends GetView<AddPurchaseController> {
   PlutoTable({super.key});
  late  PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    final AddPurchaseController controller = Get.put(AddPurchaseController());

    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall,
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.62,
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : PlutoGrid(
                              onLoaded: (PlutoGridOnLoadedEvent event) {
                                stateManager = event.stateManager;
                                stateManager.setShowColumnFilter(true);
                              },
                              columns: controller.columns,
                              rows: controller.rows,
                              createHeader: (stateManager) =>
                                  Header(stateManager: stateManager),
                              onChanged: (PlutoGridOnChangedEvent event) {
                                stateManager.notifyListeners();
                              },
                              onRowChecked: controller.handleOnRowChecked,
                              createFooter: (stateManager) {
                                stateManager.setPageSize(5,
                                    notify: false); // default 40
                                return PlutoPagination(stateManager);
                              },
                              configuration: PlutoGridConfiguration(
                                enableMoveDownAfterSelecting: false,
                                columnSize: const PlutoGridColumnSizeConfig(
                                  autoSizeMode: PlutoAutoSizeMode.equal,
                                ),


                                style: PlutoGridStyleConfig(
                                  checkedColor: kcPrimaryColor,
                                  iconSize: 16,
                                  activatedColor: kcGreenColor.withOpacity(0.5),
                                  columnFilterHeight: 35.0,
                                  oddRowColor: kcLightGrey.withOpacity(0.3),
                                  gridBorderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  gridPopupBorderRadius:
                                      BorderRadius.circular(10),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({
    required this.stateManager,
    super.key,
  });

  final PlutoGridStateManager stateManager;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int addCount = 1;

  int addedCount = 0;

  PlutoGridSelectingMode gridSelectingMode = PlutoGridSelectingMode.row;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.stateManager.setSelectingMode(gridSelectingMode);
    });
  }

  bool validateLastRow(PlutoGridStateManager stateManager) {
    if (stateManager.refRows.isEmpty) {
      return false;
    }

    final lastRow = stateManager.refRows.last;
    final accountName = lastRow.cells['account_name']?.value ?? '';
    final accountCode = lastRow.cells['account_code']?.value ?? '';
    final debit = lastRow.cells['debit']?.value ?? 0.0;
    final tax = lastRow.cells['tax']?.value ?? 0.0;
    final vat = lastRow.cells['vat']?.value ?? 0.0;

    log(accountName);

    log(accountCode);

    log(debit.toString());

    log(tax.toString());

    log(vat.toString());

    if (accountName != 'Account Name' &&
        accountCode != 'Account Code' &&
        debit != 0.0 &&
        tax != 0.0 &&
        vat != 0.0) {
      return true;
    }

    return false;
  }

  void addNewRow() {
    // log(validateLastRow(widget.stateManager).toString());
    if (widget.stateManager.refRows.isEmpty) {
      widget.stateManager.appendRows([
        PlutoRow(
          cells: {
            'account_code': PlutoCell(value: 'Account Code'),
            'account_name': PlutoCell(value: 'Account Name'),
            'debit': PlutoCell(value: 0.00),
            'tax': PlutoCell(value: 0.00),
            'vat': PlutoCell(value: 0.00),
            'total_narration': PlutoCell(value: 0.00),
            'cost_center_1': PlutoCell(value: 'CC1.1'),
            'cost_center_2': PlutoCell(value: 'CC2.3'),
            'cost_center_3': PlutoCell(value: 'CC3.1'),
            'cost_center_4': PlutoCell(value: 'CC4.2'),
          },
        ),
      ]);

      widget.stateManager.setKeepFocus(true);
      return;
    } else if (!validateLastRow(widget.stateManager)) {
      showToast(
          message:
              'Please enter Account Name, Account Code, Debit, Tax, and VAT values before adding a new row.');
      return;
    }

    widget.stateManager.appendRows([
      PlutoRow(
        cells: {
          'account_code': PlutoCell(value: 'Account Code'),
          'account_name': PlutoCell(value: 'Account Name'),
          'debit': PlutoCell(value: 0.00),
          'tax': PlutoCell(value: 0.00),
          'vat': PlutoCell(value: 0.00),
          'total_narration': PlutoCell(value: 0.00),
          'cost_center_1': PlutoCell(value: 'CC1.1'),
          'cost_center_2': PlutoCell(value: 'CC2.3'),
          'cost_center_3': PlutoCell(value: 'CC3.1'),
          'cost_center_4': PlutoCell(value: 'CC4.2'),
        },
      ),
    ]);

    widget.stateManager.setKeepFocus(true);

    // log(rowHeight.value.toString());
  }

  void handleAddRows() {
    final newRows = widget.stateManager.getNewRows(count: addCount);

    for (var e in newRows) {
      e.cells['status']!.value = 'created';
    }

    widget.stateManager.appendRows(newRows);

    widget.stateManager.setCurrentCell(
      newRows.first.cells.entries.first.value,
      widget.stateManager.refRows.length - 1,
    );

    widget.stateManager.moveScrollByRow(
      PlutoMoveDirection.down,
      widget.stateManager.refRows.length - 2,
    );

    widget.stateManager.setKeepFocus(true);
  }

  Future<void> handleSaveAll() async {
    widget.stateManager.setShowLoading(true);
    widget.stateManager.setShowLoading(false);
  }

  void handleRemoveCurrentColumnButton() {
    final currentColumn = widget.stateManager.currentColumn;

    if (currentColumn == null) {
      return;
    }

    widget.stateManager.removeColumns([currentColumn]);
  }

  void handleRemoveCurrentRowButton() {
    widget.stateManager.removeCurrentRow();
    // setState(() {
    //   rowHeight.value = rowHeight.value - 50;
    //   gridHeight = calculateGridHeight().obs;
    // });
  }

  void handleRemoveSelectedRowsButton() {
    // for (int i = 0; i <= widget.stateManager.currentSelectingRows.length; i++) {
    //   log(i.toString());
    //
    //     rowHeight.value = rowHeight.value - 30;
    //     gridHeight = calculateGridHeight().obs;
    //
    // }
    // setState(() {
    //
    // });

    widget.stateManager.removeRows(widget.stateManager.currentSelectingRows);
  }

  void handleFiltering() {
    widget.stateManager
        .setShowColumnFilter(!widget.stateManager.showColumnFilter);
  }

  void setGridSelectingMode(PlutoGridSelectingMode? mode) {
    if (mode == null || gridSelectingMode == mode) {
      return;
    }

    setState(() {
      gridSelectingMode = mode;
      widget.stateManager.setSelectingMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          runAlignment: WrapAlignment.end,
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            IconButton(
                onPressed: addNewRow, icon: const Icon(Icons.add_box_outlined)),
            IconButton(onPressed: handleSaveAll, icon: const Icon(Icons.save)),
            IconButton(
                onPressed: handleRemoveCurrentColumnButton,
                icon: const Icon(Icons.remove_from_queue)),
            IconButton(
                onPressed: handleRemoveCurrentRowButton,
                icon: const Icon(Icons.delete_outline)),
            IconButton(
                onPressed: handleRemoveSelectedRowsButton,
                icon: const Icon(Icons.remove_done)),
            IconButton(
                onPressed: handleFiltering,
                icon: const Icon(Icons.filter_alt_off_outlined)),
          ],
        ),
      ),
    );
  }
}
