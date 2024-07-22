import 'package:getx_admin_panel/models/voucher_items.dart';

class AutoGenerate {
  AutoGenerate({
    required this.transactionMethod,
    required this.postingDate,
    required this.currency,
    required this.chequeNo,
    required this.chequeDate,
    required this.paidTo,
    required this.refNo,
    required this.accountCode,
    required this.accountName,
    required this.vatAccountCode,
    required this.creditAmount,
    required this.conRate,
    required this.conAmount,
    required this.narration,
    required this.financialYear,
    required this.taxCode,
    required this.taxInclusive,
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
    required this.costCenter4,
    required this.createdBy,
    required this.createdOn,
    required this.voucherItems,
    required this.voucherAttachments,
  });
  late final String transactionMethod;
  late final String postingDate;
  late final String currency;
  late final String chequeNo;
  late final String chequeDate;
  late final String paidTo;
  late final String refNo;
  late final String accountCode;
  late final String accountName;
  late final String vatAccountCode;
  late final int creditAmount;
  late final int conRate;
  late final int conAmount;
  late final String narration;
  late final String financialYear;
  late final int taxCode;
  late final bool taxInclusive;
  late final String costCenter1;
  late final String costCenter2;
  late final String costCenter3;
  late final String costCenter4;
  late final String createdBy;
  late final String createdOn;
  late final List<VoucherItems> voucherItems;
  late final List<VoucherAttachments> voucherAttachments;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    transactionMethod = json['transactionMethod'];
    postingDate = json['postingDate'];
    currency = json['currency'];
    chequeNo = json['chequeNo'];
    chequeDate = json['chequeDate'];
    paidTo = json['paidTo'];
    refNo = json['refNo'];
    accountCode = json['accountCode'];
    accountName = json['accountName'];
    vatAccountCode = json['vatAccountCode'];
    creditAmount = json['creditAmount'];
    conRate = json['conRate'];
    conAmount = json['conAmount'];
    narration = json['narration'];
    financialYear = json['financialYear'];
    taxCode = json['taxCode'];
    taxInclusive = json['taxInclusive'];
    costCenter1 = json['costCenter1'];
    costCenter2 = json['costCenter2'];
    costCenter3 = json['costCenter3'];
    costCenter4 = json['costCenter4'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    // voucherItems = List.from(json['voucherItems']).map((e)=>VoucherItems.fromJson(e)).toList();
    voucherAttachments = List.from(json['voucherAttachments']).map((e)=>VoucherAttachments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['transactionMethod'] = transactionMethod;
    _data['postingDate'] = postingDate;
    _data['currency'] = currency;
    _data['chequeNo'] = chequeNo;
    _data['chequeDate'] = chequeDate;
    _data['paidTo'] = paidTo;
    _data['refNo'] = refNo;
    _data['accountCode'] = accountCode;
    _data['accountName'] = accountName;
    _data['vatAccountCode'] = vatAccountCode;
    _data['creditAmount'] = creditAmount;
    _data['conRate'] = conRate;
    _data['conAmount'] = conAmount;
    _data['narration'] = narration;
    _data['financialYear'] = financialYear;
    _data['taxCode'] = taxCode;
    _data['taxInclusive'] = taxInclusive;
    _data['costCenter1'] = costCenter1;
    _data['costCenter2'] = costCenter2;
    _data['costCenter3'] = costCenter3;
    _data['costCenter4'] = costCenter4;
    _data['createdBy'] = createdBy;
    _data['createdOn'] = createdOn;
    _data['voucherItems'] = voucherItems.map((e)=>e.toJson()).toList();
    _data['voucherAttachments'] = voucherAttachments.map((e)=>e.toJson()).toList();
    return _data;
  }
}

