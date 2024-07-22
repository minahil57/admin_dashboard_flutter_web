import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/models/purcahse_voucher_model.dart';
import 'package:getx_admin_panel/models/voucher_items.dart';
import 'package:getx_admin_panel/services/account_tree_service.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/data_source.dart';
import 'package:getx_admin_panel/views/item_master/item_master_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';
import 'package:getx_admin_panel/widgets/semiRounded_button.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../widgets/rounded_drop_down.dart';

class AddPurchaseController extends GetxController {
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

  @override
  void onInit() {
    voucherItemsSource = VoucherItemsSource();
    super.onInit();
  }

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {

      images.addAll(pickedImages);
      refresh();

    }
  }

  void removeImage(int index) {

    images.removeAt(index);
    refresh();

  }
  void addImage (XFile file,String url) {
    final mimeType = lookupMimeType(file.path);
    print(mimeType);
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
  late VoucherItemsSource voucherItemsSource ;


  void onAddRowFormPress(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    if(isMobile){
      showDialog(context: context,
          builder: (context) => Dialog(
            backgroundColor: kcWhitecolor,
            child: buildMobileForm(context),
          ),
      );
    }
    else{
      showAddRowForm.value = !showAddRowForm.value;
    }


  }


  void onAddNewRowAddPress(VoucherItems item){
    if(isFirstRowValue.value ) {
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
    List<String> items = [];

    if (label == 'Cost Center 1') {
      items = ['Cost Center 1.1', 'Cost Center 1.2', 'Cost Center 1.3'];
    } else if (label == 'Cost Center 2') {
      items = ['Cost Center 2.1', 'Cost Center 2.2', 'Cost Center 2.3'];
    } else if (label == 'Cost Center 3') {
      items = ['Cost Center 3.1', 'Cost Center 3.2', 'Cost Center 3.3'];
    } else if (label == 'Cost Center 4') {
      items = ['Cost Center 4.1', 'Cost Center 4.2', 'Cost Center 4.3'];
    } else if (label == 'Payment Type') {
      items = ['Payment Type1', 'Payment Type 2', 'Payment Type 3'];
    } else if (label == 'Currency') {
      items = ['Category 1', 'Category 2', 'Category 3'];
    } else if (label == 'Tax Code') {
      items = ['SubCategory 1', 'SubCategory 2', 'SubCategory 3'];
    } else if (label == 'Account Code') {
      items = ['1002313', '1234123', '2422424'];
    }

    return items;
  }

  Widget buildMobileForm(BuildContext context) {
    final controller = Get.put(AddPurchaseController());
    return

      Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.9 ,
          minWidth: 280.0,  // Minimum width constraint to avoid size missing error
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
  void addNewRow(AddPurchaseController controller) {
    Random random = Random();
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
