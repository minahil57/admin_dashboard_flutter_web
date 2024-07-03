
import 'package:get/get.dart';
import 'package:getx_admin_panel/models/item_model.dart';
import 'package:getx_admin_panel/views/item_master/widgets/data_source.dart';

class ItemMasterController extends GetxController {
  RxBool isEdit = false.obs;
  RxBool isAdd = false.obs;
  RxString selectedYear = '2022'.obs;
 
  late ItemDataSource itemDataSource;

  RxList<ItemMaster> itemMasterList = <ItemMaster>[
    ItemMaster(
      itemNo: '001',
      itemDescription: 'Sample item 1',
      purchasePrice: 100,
      salePrice: 150,
      minLevel: 10,
      maxLevel: 100,
      supplier: 'Supplier A',
      vat: 'VAT 1',
      category: 'Category 1',
      subCategory: 'SubCategory 1',
      unitMeasurement: 'Unit 1',
      packingType: 'Packing Type 1',
      size: 'Large',
      shape: 'Rectangle',
      weight: '10 kg',
      fixedAsset: 'Yes',
      sales: '100 units',
      loggedInUser: 'User A',
      width: '10 cm',
      height: '20 cm',
      volume: '200 cm3',
      isActive: true,
      stockType: 'Type A',
      primaryUOM: 'UOM A',
      convToInvUOM: 1,
      convToPriUOM: 2,
      length: '30 cm',
      thickness: '5 cm',
      service: 'Service A',
      inventory: 'Inventory A',
      reorderLevel: 'Low',
      isEditable: 1,
    ),
    ItemMaster(
      itemNo: '002',
      itemDescription: 'Sample item 2',
      purchasePrice: 120,
      salePrice: 180,
      minLevel: 15,
      maxLevel: 150,
      supplier: 'Supplier B',
      vat: 'VAT 2',
      category: 'Category 2',
      subCategory: 'SubCategory 2',
      unitMeasurement: 'Unit 2',
      packingType: 'Packing Type 2',
      size: 'Medium',
      shape: 'Square',
      weight: '15 kg',
      fixedAsset: 'No',
      sales: '120 units',
      loggedInUser: 'User B',
      width: '12 cm',
      height: '22 cm',
      volume: '220 cm3',
      isActive: false,
      stockType: 'Type B',
      primaryUOM: 'UOM B',
      convToInvUOM: 2,
      convToPriUOM: 3,
      length: '32 cm',
      thickness: '6 cm',
      service: 'Service B',
      inventory: 'Inventory B',
      reorderLevel: 'Medium',
      isEditable: 0,
    ),
    ItemMaster(
      itemNo: '003',
      itemDescription: 'Sample item 3',
      purchasePrice: 150,
      salePrice: 200,
      minLevel: 20,
      maxLevel: 200,
      supplier: 'Supplier C',
      vat: 'VAT 3',
      category: 'Category 3',
      subCategory: 'SubCategory 3',
      unitMeasurement: 'Unit 3',
      packingType: 'Packing Type 3',
      size: 'Small',
      shape: 'Circle',
      weight: '5 kg',
      fixedAsset: 'Yes',
      sales: '150 units',
      loggedInUser: 'User C',
      width: '8 cm',
      height: '18 cm',
      volume: '180 cm3',
      isActive: true,
      stockType: 'Type C',
      primaryUOM: 'UOM C',
      convToInvUOM: 3,
      convToPriUOM: 4,
      length: '28 cm',
      thickness: '4 cm',
      service: 'Service C',
      inventory: 'Inventory C',
      reorderLevel: 'High',
      isEditable: 1,
    ),
  ].obs;
  @override
  void onInit() {
    itemDataSource = ItemDataSource(items: itemMasterList);
    super.onInit();
  }

  void onYearChange(String? value) {
    selectedYear.value = value!;
  }

  void onAddPress() {
    isAdd.value = true;
  }

  
}
