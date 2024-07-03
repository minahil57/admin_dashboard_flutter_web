
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/helpers/ui_helpers.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/views/add_items/add_items_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_drop_down.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';

class AddItemView extends GetView<AddItemsController> {
  const AddItemView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(AddItemsController());

    return Scaffold(
      backgroundColor: kcWhitecolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            Text('Create Item', style: getMediumStyle()),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: kcWhitecolor,
                  border: Border.all(color: kcPrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: kcPrimaryColor, spreadRadius: 1, blurRadius: 1),
                  ],
                ),
                child: Form(
                  key: itemController.formKey,
                  child: Column(
                    children: [
                      _buildRow(
                        ['Item Number *', 'Vat', 'Volumn', 'Length'],
                        context,
                      ),
                      _buildRow(
                        [
                          'Description *',
                          'Inventory UOM *',
                          'Thickness',
                          'Height'
                        ],
                        context,
                      ),
                      _buildRow(
                        ['Supplier', 'Packing Type', 'Recorder Level', 'Size'],
                        context,
                      ),
                      _buildRow(
                        ['Category', 'Packing UOM', 'Max QTY', 'Shape'],
                        context,
                      ),
                      _buildRow(
                        ['Sub Category', 'Sale Price', 'Min QTY', 'Weight'],
                        context,
                      ),
                      _buildRow(
                        ['Stock Type', 'Purchase Price', 'Width', '1BT'],
                        context,
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35.0),
                                backgroundColor: kcPrimaryColor,
                                foregroundColor: kcWhitecolor,
                              ),
                              onPressed: () {
                                if (itemController.formKey.currentState
                                        ?.validate() ==
                                    true) {
                                  itemController.onSavePress(
                                    ItemMaster(
                                      length: 'test',
                                      thickness: 'test',
                                      service: 'test',
                                      inventory: 'test',
                                      reorderLevel: 'test',
                                      isEditable: 0,
                                        itemNo: itemController
                                            .itemNumberController.text,
                                        itemDescription: itemController
                                            .descriptionController.text,
                                        purchasePrice: int.tryParse(itemController
                                            .purchasePriceController.text),
                                        salePrice: int.tryParse(itemController
                                            .salePriceController.text),
                                        minLevel: 0,
                                        maxLevel: 0,
                                        supplier: itemController
                                            .supplierController.text,
                                        vat: itemController.vatController.text,
                                        category: itemController
                                            .categoryController.text,
                                        subCategory: itemController
                                            .subCategoryController.text,
                                        unitMeasurement: 'Kgs',
                                        packingType: itemController
                                            .packingTypeController.text,
                                        size: itemController.sizeController.text,
                                        shape:
                                            itemController.shapeController.text,
                                        weight:
                                            itemController.weightController.text,
                                        fixedAsset: 'True',
                                        sales: itemController
                                            .salePriceController.text,
                                        loggedInUser: 'Minhail',
                                        width: '2',
                                        height: '4',
                                        volume: '45',
                                        stockType: itemController
                                            .stockTypeController.text,
                                        primaryUOM: 'Primary',
                                        convToInvUOM: 3,
                                        convToPriUOM: 5
                                        ),context
                                  );
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                itemController.onCancelPress();
                              },
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    List<String> labels,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: labels.map((label) => _buildField(label, context)).toList(),
      ),
    );
  }

  Widget _buildField(String label, BuildContext context) {
    final itemController = Get.put(AddItemsController());
    if (label == 'Vat' ||
        label == 'Inventory UOM *' ||
        label == 'Packing Type' ||
        label == 'Packing UOM' ||
        label == 'Supplier' ||
        label == 'Category' ||
        label == 'Sub Category' ||
        label == 'Stock Type') {
      return RoundedDropDownField(
        label: label,
        items: _getDropdownItems(label),
        controller: itemController.getController(label),
      );
    } else {
      return RoundedTextField(
          label: label, controller: itemController.getController(label));
    }
  }

  List<DropdownMenuItem<String>> _getDropdownItems(String label) {
    final itemController = Get.put(AddItemsController());
    List<String> items = itemController.getItems(label);

    return items.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: getRegularStyle(fontSize: 12),
        ),
      );
    }).toList();
  }
}
