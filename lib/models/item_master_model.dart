class ItemMasterModel {
  int id;
  String itemCode;
  String itemName;
  String itemDescription;
  String itemCategory;
  String itemSubCategory;
  String length;
  String width;
  String height;
  String weight;
  String volume;
  String unit;
  String createdDate;
  String modifiedDate;

  ItemMasterModel(
      {required this.id,
      required this.itemCode,
      required this.itemName,
      required this.itemDescription,
      required this.itemCategory,
      required this.itemSubCategory,
      required this.length,
      required this.width,
      required this.height,
      required this.weight,
      required this.volume,
      required this.unit,
      required this.createdDate,
      required this.modifiedDate});
}
