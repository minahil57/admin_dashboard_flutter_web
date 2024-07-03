import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/services/item_master_service.dart';
import 'package:getx_admin_panel/views/item_master/item_master_controller.dart';
import 'package:go_router/go_router.dart';

class AddItemsController extends GetxController{
   final modifiedDateController = TextEditingController();
  final createdDateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ItemMasterService itemMasterService = ItemMasterService();
      final controller = Get.put(ItemMasterController());
  void onSavePress(ItemMaster model,BuildContext context) {

    controller.itemMasterList.add(model);
     controller.itemDataSource.updateDataSource(controller.itemMasterList);
  
   itemMasterService.postItemMaster(model);
   context.go('/item_master');
   
  }
   final TextEditingController itemNumberController = TextEditingController();
  final TextEditingController vatController = TextEditingController();
  final TextEditingController volumeController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController inventoryUOMController = TextEditingController();
  final TextEditingController thicknessController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController supplierController = TextEditingController();
  final TextEditingController packingTypeController = TextEditingController();
  final TextEditingController reorderLevelController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController packingUOMController = TextEditingController();
  final TextEditingController maxQtyController = TextEditingController();
  final TextEditingController shapeController = TextEditingController();
  final TextEditingController subCategoryController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController minQtyController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController stockTypeController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController oneBtController = TextEditingController();


  TextEditingController getController(String label) {
    switch (label) {
      case 'Item Number *':
        return itemNumberController;
      case 'Vat':
        return vatController;
      case 'Volumn':
        return volumeController;
      case 'Length':
        return lengthController;
      case 'Description *':
        return descriptionController;
      case 'Inventory UOM *':
        return inventoryUOMController;
      case 'Thickness':
        return thicknessController;
      case 'Height':
        return heightController;
      case 'Supplier':
        return supplierController;
      case 'Packing Type':
        return packingTypeController;
      case 'Recorder Level':
        return reorderLevelController;
      case 'Size':
        return sizeController;
      case 'Category':
        return categoryController;
      case 'Packing UOM':
        return packingUOMController;
      case 'Max QTY':
        return maxQtyController;
      case 'Shape':
        return shapeController;
      case 'Sub Category':
        return subCategoryController;
      case 'Sale Price':
        return salePriceController;
      case 'Min QTY':
        return minQtyController;
      case 'Weight':
        return weightController;
      case 'Stock Type':
        return stockTypeController;
      case 'Purchase Price':
        return purchasePriceController;
      case 'Width':
        return widthController;
      case '1BT':
        return oneBtController;
      case 'Modified Date':
        return modifiedDateController;
      case 'Created Date':
        return createdDateController;
      default:
        return TextEditingController();
    }
    }
    List<String> getItems(String label) {
    if (label == 'Vat') {
      return ['VAT 1', 'VAT 2', 'VAT 3'];
    } else if (label == 'Inventory UOM *') {
      return ['UOM 1', 'UOM 2', 'UOM 3'];
    } else if (label == 'Packing Type') {
      return ['Packing Type 1', 'Packing Type 2', 'Packing Type 3'];
    } else if (label == 'Packing UOM') {
      return ['Packing UOM 1', 'Packing UOM 2', 'Packing UOM 3'];
    } else if (label == 'Supplier') {
      return ['Supplier 1', 'Supplier 2', 'Supplier 3'];
    } else if (label == 'Category') {
      return ['Category 1', 'Category 2', 'Category 3'];
    } else if (label == 'Sub Category') {
      return ['SubCategory 1', 'SubCategory 2', 'SubCategory 3'];
    } else if (label == 'Stock Type') {
      return ['Stock Type 1', 'Stock Type 2', 'Stock Type 3'];
    } else {
      return [];
    }
  }

  void onCancelPress() {
 
  }
}