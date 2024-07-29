import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VoucherItems {
  VoucherItems(
    this.recordId,
    this.accountCode,
    this.accountName,
    this.taxCode,
    this.amountCredit,
    this.amountDebit,
    this.vat,
    this.total,
    this.conRate,
    this.conAmount,
    this.narration,
    this.costCenter1,
    this.costCenter2,
    this.costCenter3,
    this.costCenter4,
  );

  int recordId;
  String accountCode;
  String accountName;
  int taxCode;
  int amountCredit;
  int amountDebit;
  int vat;
  double total;
  int conRate;
  int conAmount;
  String narration;
  String costCenter1;
  String costCenter2;
  String costCenter3;
  String costCenter4;

  // VoucherItems.fromJson(Map<String, dynamic> json) {
  //   recordId = json['recordId'] ?? 0;
  //   accountCode = json['accountCode']?? '';
  //   accountName = json['accountName']?? '';
  //   taxCode = json['taxCode'] ?? 0;
  //   amountCredit = json['amountCredit']?? 0;
  //   amountDebit = json['amountDebit']?? 0;
  //   vat = json['vat']?? 0;
  //   total = json['total']?? 0;
  //   conRate = json['conRate']?? 0;
  //   conAmount = json['conAmount']?? 0;
  //   narration = json['narration']?? '';
  //   costCenter1 = json['costCenter1']?? '';
  //   costCenter2 = json['costCenter2']?? '';
  //   costCenter3 = json['costCenter3']?? '';
  //   costCenter4 = json['costCenter4']?? '';
  // }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['recordId'] = recordId;
    data['accountCode'] = accountCode;
    data['accountName'] = accountName;
    data['taxCode'] = taxCode;
    data['amountCredit'] = amountCredit;
    data['amountDebit'] = amountDebit;
    data['vat'] = vat;
    data['total'] = total;
    data['conRate'] = conRate;
    data['conAmount'] = conAmount;
    data['narration'] = narration;
    data['costCenter1'] = costCenter1;
    data['costCenter2'] = costCenter2;
    data['costCenter3'] = costCenter3;
    data['costCenter4'] = costCenter4;
    return data;
  }

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell<String>(columnName: 'accountCode', value: accountCode),
      DataGridCell<String>(columnName: 'accountname', value: accountName),
      DataGridCell<int>(columnName: 'debit', value: amountDebit),
      DataGridCell<int>(columnName: 'tax', value: taxCode),
      DataGridCell<int>(columnName: 'vat', value: vat),
      DataGridCell<String>(columnName: 'totalNarration', value: narration),
      DataGridCell<String>(columnName: 'costCenter1', value: costCenter1),
      DataGridCell<String>(columnName: 'costCenter2', value: costCenter2),
      DataGridCell<String>(columnName: 'costCenter3', value: costCenter3),
      DataGridCell<String>(columnName: 'costCenter4', value: costCenter4),
    ]);
  }
}

class VoucherAttachments {
  VoucherAttachments({
    required this.recordId,
    required this.fileName,
    required this.description,
  });
  late final int recordId;
  late final String fileName;
  late final String description;

  VoucherAttachments.fromJson(Map<String, dynamic> json) {
    recordId = json['recordId'];
    fileName = json['fileName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['recordId'] = recordId;
    data['fileName'] = fileName;
    data['description'] = description;
    return data;
  }
}
