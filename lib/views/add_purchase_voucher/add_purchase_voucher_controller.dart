import 'dart:developer' as dv;
import 'dart:math';
// import 'dart:math';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/models/purchase_voucher_dropdowns.dart';
import 'package:getx_admin_panel/models/voucher_items.dart';
import 'package:getx_admin_panel/services/account_tree_service.dart';
import 'package:getx_admin_panel/services/purchase_voucher_service.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/data_source.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/searchable_dropdown.dart';
import 'package:getx_admin_panel/views/item_master/item_master_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field_with_top_label.dart';
import 'package:getx_admin_panel/widgets/semiRounded_button.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../widgets/rounded_drop_down.dart';

class AddPurchaseController extends GetxController {
  final Rx<BuildContext?> _context = Rx<BuildContext?>(null);
  final ValueNotifier<BuildContext?> _contextNotifier = ValueNotifier<BuildContext?>(null);

  ValueNotifier<BuildContext?> get contextNotifier => _contextNotifier;

  BuildContext? get context => _context.value;
  final modifiedDateController = TextEditingController();
  final createdDateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ItemMasterService itemMasterService = ItemMasterService();
  final controller = Get.put(ItemMasterController());
  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = false.obs;
  RxBool showAddRowForm = false.obs;
  RxList<XFile> images = <XFile>[].obs;
  late DropzoneViewController dropzoneViewController;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;
  RxBool isFirstRowValue = true.obs;
  List<Account> accounts = [];
  List<CostCenter> cc1 = [];
  List<CostCenter> cc2 = [];
  List<CostCenter> cc3 = [];
  List<CostCenter> cc4 = [];
  List<Currency> currencies = [];
  List<Supplier> suppliers = [];
  List<Tax> taxes = [];
  List<Type> types = [];
  List<Voucher> vouchers = [];
  RxList<String> accNums = <String>[].obs;
  RxList<String> accNames = <String>[].obs;

  // Separate lists for CostCenter names
  RxList<String> cc1Names = <String>[].obs;
  RxList<String> cc2Names = <String>[].obs;
  RxList<String> cc3Names = <String>[].obs;
  RxList<String> cc4Names = <String>[].obs;
  RxList<String> paymentType = <String>[].obs;
  RxList<String> currency = <String>[].obs;
  RxList<String> taxCode = <String>[].obs;
  RxList<PlutoColumn> columns = <PlutoColumn>[].obs;
  RxList<PlutoRow> rows = <PlutoRow>[].obs;
  final PurchaseVoucherService purchaseVoucherService =
      PurchaseVoucherService();
  RxDouble accCodeColumnWidth = 0.00.obs;
  RxDouble accNameColumnWidth =0.00.obs;
  RxDouble debitColumnWidth=0.00.obs;
  RxDouble taxColumnWidth=0.00.obs;
  RxDouble vatColumnWidth=0.00.obs;
  RxDouble cc1ColumnWidth=0.00.obs;
  RxDouble cc2ColumnWidth=0.00.obs;
  RxDouble cc3ColumnWidth=0.00.obs;
  RxDouble cc4ColumnWidth=0.00.obs;
  final TextEditingController voucherNoController = TextEditingController();
  final TextEditingController voucherDateController = TextEditingController();
  final TextEditingController paymentTypeController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController conversionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController baseCurrencyAmountController =
      TextEditingController();
  final TextEditingController refNoController = TextEditingController();
  final TextEditingController chequeNoController = TextEditingController();
  final TextEditingController chequeDateController = TextEditingController();
  final TextEditingController paidToController = TextEditingController();
  final TextEditingController taxCodeController = TextEditingController();
  final TextEditingController costCenter1Controller = TextEditingController();
  final TextEditingController costCenter2Controller = TextEditingController();
  final TextEditingController costCenter3Controller = TextEditingController();
  final TextEditingController costCenter4Controller = TextEditingController();
  final TextEditingController narrationController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  Random random = Random();
  // Add Row Form Controllers
  final TextEditingController accountCodeController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController debitController = TextEditingController();
  final TextEditingController taxController = TextEditingController();
  final TextEditingController vatController = TextEditingController();
  final TextEditingController rowCostCenter1Controller =
      TextEditingController();
  final TextEditingController rowCostCenter2Controller =
      TextEditingController();
  final TextEditingController rowCostCenter3Controller =
      TextEditingController();
  final TextEditingController rowCostCenter4Controller =
      TextEditingController();
  final TextEditingController rownarrationController = TextEditingController();
  List<List<String>> table_rows = [];
 List<VoucherItems> voucherItems = [];
  late List<TextEditingController> searchControllers;
  // var  stateManager = Rx<PlutoGridStateManager?>(null);

  Rx<VoucherItemsSource?> voucherItemsSource = Rx<VoucherItemsSource?>(null);
  var editingRowIndex = (-1).obs;
  var editingColumnIndex = (-1).obs;

  void startEditing(int rowIndex, int columnIndex) {
    editingRowIndex.value = rowIndex;
    editingColumnIndex.value = columnIndex;
  }

  void stopEditing() {
    editingRowIndex.value = -1;
    editingColumnIndex.value = -1;
  }
  var isLoading = true.obs;
  var stateManager = Rx<PlutoGridStateManager?>(null);
  List<String> headers = [
    'Account Code',
    'Account Name',
    'Debit',
    'Tax',
    'VAT',
    'Total Narration',
    'Cost Center 1',
    'Cost Center 2',
    'Cost Center 3',
    'Cost Center 4',
    'Action',
  ];

  @override
  void onInit() {
    super.onInit();
    searchControllers = List.generate(10, (index) => TextEditingController());
    voucherItems = _getDealerDetails(5);
    initializeTable();
    initializeTableColumnWidth();

  }

  void initializeTableColumnWidth() {
    accCodeColumnWidth.value =  150 ;
    accNameColumnWidth.value =  210  ;
    debitColumnWidth.value =  150 ;
    taxColumnWidth.value =  150 ;
    vatColumnWidth.value =150 ;
    cc1ColumnWidth.value =  200 ;
    cc2ColumnWidth.value =  180 ;
    cc3ColumnWidth.value =  180 ;
    cc4ColumnWidth.value = 150;
  }
  bool onColumnResize(ColumnResizeUpdateDetails args){
    log("thisjcne,dcnlsmakjdh${args.width.toString()}" as num);
    if (args.column.columnName == 'accountCode') {
      accCodeColumnWidth.value = args.width;
    } else if (args.column.columnName == 'debit') {
      debitColumnWidth.value = args.width;
    } else if (args.column.columnName == 'accountName') {
      accNameColumnWidth.value = args.width;
    } else if (args.column.columnName == 'tax') {
      taxColumnWidth.value = args.width;
    } else if (args.column.columnName == 'costCenter3') {
      cc3ColumnWidth.value = args.width;
    } else if (args.column.columnName == 'vat') {
      vatColumnWidth.value = args.width;
    } else if (args.column.columnName == 'costCenter1') {
      cc1ColumnWidth.value = args.width;
    } else if (args.column.columnName == 'costCenter2') {
      cc2ColumnWidth.value = args.width;
    }
    else if (args.column.columnName == 'costCenter4') {
      cc2ColumnWidth.value = args.width;
    }
    else if (args.column.columnName == 'totalNarration') {
      cc2ColumnWidth.value = args.width;
    }

    return true;
  }

  List<GridTableSummaryRow> getTableSummaryRows() {
    final Color color = kcPrimaryColor.withOpacity(0.3);
    return <GridTableSummaryRow>[
      GridTableSummaryRow(
          color: color,
          title: 'Total Order Count: {count}',
          showSummaryInRow: true,
          columns: <GridSummaryColumn>[
            const GridSummaryColumn(
                name: 'debit',
                columnName: 'debit',
                summaryType: GridSummaryType.count,
            ),
          ],
          position: GridTableSummaryRowPosition.bottom,),

    ];
  }


  void setContext(BuildContext context) {
    _context.value = context;
    _contextNotifier.value = context;
  }

  bool checkCellReadOnly(PlutoRow row, PlutoCell cell) {
    return true; // Otherwise, allow editing
  }

  Future<void> initializeTable() async {
    try {
      isLoading.value = true;
      voucherItemsSource.value = VoucherItemsSource([], [], [], [], [], [],voucherItems,_context.value);
      //
      await fetchAllDropDowns(); // Assuming fetchAllDropDowns is an async method

      voucherItemsSource.value = VoucherItemsSource(
          accNums, accNames, cc1Names, cc2Names, cc3Names, cc4Names,voucherItems,_context.value);

      table_rows = [
        [
          '0123223',
          'Yasir Groups Limited',
          '0.00',
          '0.00',
          '0.00',
          '2500.00',
          '',
          '',
          '',
          '',
          ''
        ],
      ];

      columns.addAll([
        PlutoColumn(
          title: 'Account Code',
          field: 'account_code',
          enableAutoEditing: true,
          enableEditingMode: true,
          applyFormatterInEditing: true,
          checkReadOnly: (row, cell) => checkCellReadOnly(row, cell),
          type: PlutoColumnType.text(),
          // renderer: (rendererContext) => SearchableDropdownRenderer(
          //   context: rendererContext,
          //   items: accNums,
          //   text:
          //       rendererContext.row.cells[rendererContext.column.field]!.value,
          //   onChanged: (value) {
          //     rendererContext.row.cells[rendererContext.column.field]!.value =
          //         value;
          //   }, // Pass your list of cost center 4 names here
          // ),
          enableRowDrag: true,
        ),
        PlutoColumn(
          title: 'Account Name',
          field: 'account_name',
          type: PlutoColumnType.select(accNames.toList(),
              enableColumnFilter: true),
          // renderer: (rendererContext) => CustomDropDownCellRenderer.renderer(
          //   rendererContext,
          //   accNames.toList(), // Pass your list of cost center 4 names here
          // ),
        ),
        PlutoColumn(
          title: 'Debit',
          field: 'debit',
          type: PlutoColumnType.number(),
        ),
        PlutoColumn(
          title: 'Tax',
          field: 'tax',
          type: PlutoColumnType.number(),
        ),
        PlutoColumn(
          title: 'VAT',
          field: 'vat',
          type: PlutoColumnType.number(),
          footerRenderer: (rendererContext) {
            return PlutoAggregateColumnFooter(
              rendererContext: rendererContext,
              type: PlutoAggregateColumnType.count,
              format: '#,###',
              alignment: Alignment.center,
              titleSpanBuilder: (text) {
                return [
                  const TextSpan(text: 'Total Sum'),
                ];
              },
            );
          },
        ),
        PlutoColumn(
          title: 'Total Narration',
          field: 'total_narration',
          type: PlutoColumnType.number(),
          footerRenderer: (rendererContext) {
            return PlutoAggregateColumnFooter(
              rendererContext: rendererContext,
              type: PlutoAggregateColumnType.sum,
              format: '#,###',
              alignment: Alignment.center,
              titleSpanBuilder: (text) {
                return [
                  TextSpan(text: text),
                ];
              },
            );
          },
        ),
        PlutoColumn(
          title: 'Cost center 1',
          field: 'cost_center_1',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) => CustomDropDownCellRenderer.renderer(
            rendererContext,
            cc1Names.toList(), // Pass your list of cost center 4 names here
          ),
        ),
        PlutoColumn(
          title: 'Cost center 2',
          field: 'cost_center_2',
          type: PlutoColumnType.number(),
          renderer: (rendererContext) => CustomDropDownCellRenderer.renderer(
            rendererContext,
            cc2Names.toList(), // Pass your list of cost center 4 names here
          ),
        ),
        PlutoColumn(
          title: 'Cost center 3',
          field: 'cost_center_3',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) => CustomDropDownCellRenderer.renderer(
            rendererContext,
            cc3Names.toList(), // Pass your list of cost center 4 names here
          ),
        ),
        PlutoColumn(
          title: 'Cost center 4',
          field: 'cost_center_4',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) => CustomDropDownCellRenderer.renderer(
            rendererContext,
            accNums.toList(), // Pass your list of cost center 4 names here
          ),
        ),
      ].obs);

      rows.addAll([
        PlutoRow(
          cells: {
            'account_code': PlutoCell(value: ''),
            'account_name': PlutoCell(value: ''),
            'debit': PlutoCell(value: 0.00),
            'tax': PlutoCell(value: 0.00),
            'vat': PlutoCell(value: 0.00),
            'total_narration': PlutoCell(value: 0.00),
            'cost_center_1': PlutoCell(value: ''),
            'cost_center_2': PlutoCell(value: ''),
            'cost_center_3': PlutoCell(value: ''),
            'cost_center_4': PlutoCell(value: ''),
          },
        ),
      ].obs);

      update();
      isLoading.value = false; // Notify listeners to update the UI
    } catch (e) {
      isLoading.value = false;
      dv.log(e.toString());
      // Handle errors if fetchAllDropDowns fails
    }
  }

  void handleOnRowChecked(PlutoGridOnRowCheckedEvent event) {
    if (event.isRow) {
      // or event.isAll
    } else {
      // print(stateManager.value!.checkedRows.length);
    }
  }

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      images.addAll(pickedImages);
      refresh();
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    refresh();
  }

  void addImage(XFile file, String url) {
    // final mimeType = lookupMimeType(file.path);
    // print(mimeType);
    // if (FileChecker.isImageFile(file)) {
    images.add(file);
    refresh();
    // } else {
    //  showToast( message: 'The Selected File is not and image');
    // }
  }
  // RxList<VoucherItems> voucherItemData = <VoucherItems>[
  //   VoucherItems(recordId: 000 , accountCode: '', accountName: '', taxCode: 000 , amountCredit: 000 , amountDebit: 000 , vat: 000 , total: 000 , conRate: 000 , conAmount: 000 , narration: '', costCenter1: '', costCenter2: '', costCenter3: '', costCenter4: '',),
  // ].obs;

  void onAddRowFormPress(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    if (isMobile) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: kcWhitecolor,
          child: buildMobileForm(context),
        ),
      );
    } else {
      showAddRowForm.value = !showAddRowForm.value;
    }
  }

  void onAddNewRowAddPress(VoucherItems item) {
    if (isFirstRowValue.value) {
      // voucherItemData.clear();
      // voucherItemData.add(item);
      // voucherItemsSource.updateDataSource(voucherItemData);
      isFirstRowValue.value = false;
      refresh();
      return;
    }
    // voucherItemData.add(item);
    // voucherItemsSource.updateDataSource(voucherItemData);
    refresh();
  }

  void onSavePress(ItemMaster model, BuildContext context) {
    controller.itemMasterList.add(model);
    controller.itemDataSource.updateDataSource(controller.itemMasterList);

    context.go('/item_master');
  }

  Future<void> fetchAllDropDowns() async {
    try {
      EasyLoading.show();
      ApiResponse apiResponse =
          await purchaseVoucherService.fetchPurchaseDropdownsData();

      // Assign each value to a separate list
      accounts = apiResponse.accounts;
      cc1 = apiResponse.cc1;
      cc2 = apiResponse.cc2;
      cc3 = apiResponse.cc3;
      cc4 = apiResponse.cc4;
      currencies = apiResponse.currencies;
      suppliers = apiResponse.suppliers;
      taxes = apiResponse.taxes;
      types = apiResponse.types;
      vouchers = apiResponse.vouchers;

      accNums = accounts.map((account) => account.id).toList().obs;
      accNames = accounts.map((account) => account.name).toList().obs;

      // Separate lists for CostCenter names
      cc1Names = cc1.map((costCenter) => costCenter.name).toList().obs;
      cc2Names = cc2.map((costCenter) => costCenter.name).toList().obs;
      cc3Names = cc3.map((costCenter) => costCenter.name).toList().obs;
      cc4Names = cc4.map((costCenter) => costCenter.name).toList().obs;
      taxCode = taxes.map((tax) => tax.description).toList().obs;
      paymentType = types.map((type) => type.name).toList().obs;
      currency = currencies.map((currency) => currency.name).toList().obs;

      dv.log(cc4Names.length.toString());
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  TextEditingController getController(String label) {
    switch (label) {
      case 'Voucher No':
        return voucherNoController;
      case 'Voucher Date':
        return voucherDateController;
      case 'Payment Type':
        return paymentTypeController;
      case 'Account(Cr)':
        return accountController;
      case 'Currency':
        return currencyController;
      case 'Conversion Rate':
        return conversionController;
      case 'Amount':
        return amountController;
      case 'Base Currency Amount(Cr)':
        return baseCurrencyAmountController;
      case 'Ref No':
        return refNoController;
      case 'Cheque No':
        return chequeNoController;
      case 'Cheque Date':
        return chequeDateController;
      case 'Paid To':
        return paidToController;
      case 'Tax Code':
        return taxCodeController;
      case 'Cost Center 1':
        return costCenter1Controller;
      case 'Cost Center 2':
        return costCenter2Controller;
      case 'Cost Center 3':
        return costCenter3Controller;
      case 'Cost Center 4':
        return costCenter4Controller;
      case 'Narration':
        return narrationController;
      case 'Account Code':
        return accountCodeController;
      case 'Account Name':
        return accountNameController;
      case 'Debit':
        return debitController;
      case 'Tax':
        return taxController;
      case 'Vat':
        return vatController;
      default:
        return TextEditingController();
    }
  }

  List<String> getItems(String label) {
    RxList<String> items = <String>[].obs;

    if (label == 'Cost Center 1') {
      items.value = cc1Names;
    } else if (label == 'Cost Center 2') {
      items.value = cc2Names;
    } else if (label == 'Cost Center 3') {
      items.value = cc3Names;
    } else if (label == 'Cost Center 4') {
      items.value = cc4Names;
    } else if (label == 'Payment Type') {
      items.value = paymentType;
    } else if (label == 'Currency') {
      items.value = currency;
    } else if (label == 'Tax Code') {
      items.value = taxCode;
    } else if (label == 'Account Code') {
      items.value = accNums;
    }

    return items;
  }

  Widget buildMobileForm(BuildContext context) {
    final controller = Get.put(AddPurchaseController());
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        minWidth: 280.0, // Minimum width constraint to avoid size missing error
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundedDropDownField(
                label: 'Account Code',
                items: controller.getItems('Account Code'),
                controller: controller.getController('Account Code'),
              ),
              verticalSpaceSmall,
              RoundedTextField(
                label: 'Account Name',
                controller: controller.getController('Account Name'),
              ),
              verticalSpaceSmall,
              RoundedTextField(
                label: 'Debit',
                controller: controller.getController('Debit'),
              ),
              verticalSpaceSmall,
              RoundedTextField(
                label: 'Tax',
                controller: controller.getController('Tax'),
              ),
              verticalSpaceSmall,
              RoundedTextField(
                label: 'Vat',
                controller: controller.getController('Vat'),
              ),
              verticalSpaceSmall,
              RoundedDropDownField(
                label: 'Cost Center 1',
                items: controller.getItems('Cost Center 1'),
                controller: controller.rowCostCenter1Controller,
              ),
              verticalSpaceSmall,
              RoundedDropDownField(
                label: 'Cost Center 2',
                items: controller.getItems('Cost Center 4'),
                controller: controller.rowCostCenter2Controller,
              ),
              verticalSpaceSmall,
              RoundedDropDownField(
                label: 'Cost Center 3',
                items: controller.getItems('Cost Center 4'),
                controller: controller.rowCostCenter3Controller,
              ),
              verticalSpaceSmall,
              RoundedDropDownField(
                label: 'Cost Center 4',
                items: controller.getItems('Cost Center 4'),
                controller: controller.rowCostCenter4Controller,
              ),
              verticalSpaceSmall,
              RoundedTextField(
                label: 'Narration',
                controller: controller.rownarrationController,
              ),
              verticalSpaceSmall,
              ResponsiveButton(
                text: 'Add',
                onPressed: () {
                  addNewRow(controller);
                  context.pop();
                },
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
  List<VoucherItems> _getDealerDetails(int count) {
    final List<VoucherItems> itemDetails = <VoucherItems>[];

    for (int i = 1; i <= count; i++) {
      final VoucherItems ord = VoucherItems(
        _productNo[random.nextInt(15)],
        'Select Acc no',
        'Select Acc Name',
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)].toDouble(),
        _productNo[random.nextInt(15)],
        _productNo[random.nextInt(15)],
        'Enter Narration',
        'Select CostCenter 1',
        'Select CostCenter 2',
        'Select CostCenter 3',
        'Select CostCenter 4',
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
    2123,
  ];

  void addNewRow(AddPurchaseController controller) {
    // Random random = Random();
    // controller.onAddNewRowAddPress(VoucherItems(
    //   recordId: random.nextInt(100),
    //   accountCode: controller.accountCodeController.text,
    //   accountName: controller.accountNameController.text,
    //   taxCode: int.parse(taxController.text),
    //   amountCredit: 0,
    //   amountDebit: 23490,
    //   vat: 15,
    //   total: 0,
    //   conRate: 0,
    //   conAmount: 0,
    //   narration: controller.rownarrationController.text,
    //   costCenter1: controller.rowCostCenter1Controller.text,
    //   costCenter2: controller.rowCostCenter2Controller.text,
    //   costCenter3: controller.rowCostCenter3Controller.text,
    //   costCenter4: controller.rowCostCenter4Controller.text,
    // ));
  }
  void onCancelPress() {}
}
