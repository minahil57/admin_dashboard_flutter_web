class Account {
  String id;
  String name;

  Account({required this.id, required this.name});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class CostCenter {
  String id;
  String name;

  CostCenter({required this.id, required this.name});

  factory CostCenter.fromJson(Map<String, dynamic> json) {
    return CostCenter(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Currency {
  String id;
  String name;
  double conversionRate;

  Currency({required this.id, required this.name, required this.conversionRate});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      name: json['name'],
      conversionRate: json['conversionRate'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'conversionRate': conversionRate,
    };
  }
}

class Supplier {
  String id;
  String name;

  Supplier({required this.id, required this.name});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Tax {
  int recordId;
  String description;
  double rate;
  double salesTaxRate;

  Tax({required this.recordId, required this.description, required this.rate, required this.salesTaxRate});

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      recordId: json['recordId'],
      description: json['description'],
      rate: json['rate'].toDouble(),
      salesTaxRate: json['salesTaxRate'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'description': description,
      'rate': rate,
      'salesTaxRate': salesTaxRate,
    };
  }
}

class Type {
  String id;
  String name;

  Type({required this.id, required this.name});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Voucher {
  String voucherNo;

  Voucher({required this.voucherNo});

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      voucherNo: json['voucherNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voucherNo': voucherNo,
    };
  }
}

class ApiResponse {
  List<Account> accounts;
  List<CostCenter> cc1;
  List<CostCenter> cc2;
  List<CostCenter> cc3;
  List<CostCenter> cc4;
  List<Currency> currencies;
  List<Supplier> suppliers;
  List<Tax> taxes;
  List<Type> types;
  List<Voucher> vouchers;

  ApiResponse({
    required this.accounts,
    required this.cc1,
    required this.cc2,
    required this.cc3,
    required this.cc4,
    required this.currencies,
    required this.suppliers,
    required this.taxes,
    required this.types,
    required this.vouchers,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      accounts: (json['accounts'] as List).map((i) => Account.fromJson(i)).toList(),
      cc1: (json['cc1'] as List).map((i) => CostCenter.fromJson(i)).toList(),
      cc2: (json['cc2'] as List).map((i) => CostCenter.fromJson(i)).toList(),
      cc3: (json['cc3'] as List).map((i) => CostCenter.fromJson(i)).toList(),
      cc4: (json['cc4'] as List).map((i) => CostCenter.fromJson(i)).toList(),
      currencies: (json['currencies'] as List).map((i) => Currency.fromJson(i)).toList(),
      suppliers: (json['suppliers'] as List).map((i) => Supplier.fromJson(i)).toList(),
      taxes: (json['taxes'] as List).map((i) => Tax.fromJson(i)).toList(),
      types: (json['types'] as List).map((i) => Type.fromJson(i)).toList(),
      vouchers: (json['vouchers'] as List).map((i) => Voucher.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accounts': accounts.map((i) => i.toJson()).toList(),
      'cc1': cc1.map((i) => i.toJson()).toList(),
      'cc2': cc2.map((i) => i.toJson()).toList(),
      'cc3': cc3.map((i) => i.toJson()).toList(),
      'cc4': cc4.map((i) => i.toJson()).toList(),
      'currencies': currencies.map((i) => i.toJson()).toList(),
      'suppliers': suppliers.map((i) => i.toJson()).toList(),
      'taxes': taxes.map((i) => i.toJson()).toList(),
      'types': types.map((i) => i.toJson()).toList(),
      'vouchers': vouchers.map((i) => i.toJson()).toList(),
    };
  }
}
