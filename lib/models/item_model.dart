class ItemMaster {
  String? itemNo;
  String? itemDescription;
  int? purchasePrice;
  int? salePrice;
  int? minLevel;
  int? maxLevel;
  String? supplier;
  String? vat;
  String? category;
  String? subCategory;
  String? unitMeasurement;
  String? packingType;
  String? size;
  String? shape;
  String? weight;
  String? fixedAsset;
  String? sales;
  String? loggedInUser;
  String? width;
  String? height;
  String? volume;
  bool? isActive;
  String? stockType;
  String? primaryUOM;
  int? convToInvUOM;
  int? convToPriUOM;
  String? length;
  String? thickness;
  String? service;
  String? inventory;
  String? reorderLevel;
  int? isEditable;

  ItemMaster(
      {this.itemNo,
      this.itemDescription,
      this.purchasePrice,
      this.salePrice,
      this.minLevel,
      this.maxLevel,
      this.supplier,
      this.vat,
      this.category,
      this.subCategory,
      this.unitMeasurement,
      this.packingType,
      this.size,
      this.shape,
      this.weight,
      this.fixedAsset,
      this.sales,
      this.loggedInUser,
      this.width,
      this.height,
      this.volume,
      this.isActive,
      this.stockType,
      this.primaryUOM,
      this.convToInvUOM,
      this.convToPriUOM,
      this.length,
      this.thickness,
      this.service,
      this.inventory,
      this.reorderLevel,
      this.isEditable});

  ItemMaster.fromJson(Map<String, dynamic> json) {
    itemNo = json['itemNo'];
    itemDescription = json['itemDescription'];
    purchasePrice = json['purchasePrice'];
    salePrice = json['salePrice'];
    minLevel = json['minLevel'];
    maxLevel = json['maxLevel'];
    supplier = json['supplier'];
    vat = json['vat'];
    category = json['category'];
    subCategory = json['subCategory'];
    unitMeasurement = json['unitMeasurement'];
    packingType = json['packingType'];
    size = json['size'];
    shape = json['shape'];
    weight = json['weight'];
    fixedAsset = json['fixedAsset'];
    sales = json['sales'];
    loggedInUser = json['loggedInUser'];
    width = json['width'];
    height = json['height'];
    volume = json['volume'];
    isActive = json['isActive'];
    stockType = json['stockType'];
    primaryUOM = json['primaryUOM'];
    convToInvUOM = json['convToInvUOM'];
    convToPriUOM = json['convToPriUOM'];
    length = json['length'];
    thickness = json['thickness'];
    service = json['service'];
    inventory = json['inventory'];
    reorderLevel = json['reorderLevel'];
    isEditable = json['isEditable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemNo'] = itemNo;
    data['itemDescription'] = itemDescription;
    data['purchasePrice'] = purchasePrice;
    data['salePrice'] = salePrice;
    data['minLevel'] = minLevel;
    data['maxLevel'] = maxLevel;
    data['supplier'] = supplier;
    data['vat'] = vat;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['unitMeasurement'] = unitMeasurement;
    data['packingType'] = packingType;
    data['size'] = size;
    data['shape'] = shape;
    data['weight'] = weight;
    data['fixedAsset'] = fixedAsset;
    data['sales'] = sales;
    data['loggedInUser'] = loggedInUser;
    data['width'] = width;
    data['height'] = height;
    data['volume'] = volume;
    data['isActive'] = isActive;
    data['stockType'] = stockType;
    data['primaryUOM'] = primaryUOM;
    data['convToInvUOM'] = convToInvUOM;
    data['convToPriUOM'] = convToPriUOM;
    data['length'] = length;
    data['thickness'] = thickness;
    data['service'] = service;
    data['inventory'] = inventory;
    data['reorderLevel'] = reorderLevel;
    data['isEditable'] = isEditable;
    return data;
  }
}