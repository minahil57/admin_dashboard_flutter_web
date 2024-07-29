import 'package:get/get.dart';

class MyTreeNode {
  MyTreeNode({
    required this.accountName,
    required this.accountCode,
    required this.balance,
    required this.level,
    required this.isActive,
    this.parentCode,
    required this.isSelected,
    this.balanceType,
    this.description,
    this.accType,
    this.parent,
    List<MyTreeNode>? children,
  }) : children = children ?? [] {
    // Set parent for all children
    for (var child in this.children) {
      child.parent = this;
    }
  }

  final String accountName;
  final String accountCode;
  final double balance;
  final int level;
  final RxBool isActive;
  String? balanceType;
  String? parentCode;
  String? accType;
  String? description;
  bool isSelected;
  MyTreeNode? parent;
  List<MyTreeNode> children;

  factory MyTreeNode.fromJson(Map<String, dynamic> json) {
    return MyTreeNode(
      accountName: json['accountName'],
      accountCode: json['accountCode'].toString(),
      balance: json['balance'].toDouble(),
      level: json['level'],
      isActive: (json['isActive'] as bool).obs, // Initialize RxBool
      parentCode: json['parentCode']?.toString(),
      isSelected: json['isSelected'],
      // balanceType: json['balanceType'],
      // description: json['description'],
      // accType: json['accType'],
      children: (json['childAccounts'] as List)
          .map((i) => MyTreeNode.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountName': accountName,
      'accountCode': accountCode,
      'balance': balance,
      'level': level,
      'isActive': isActive.value, // Access the value of RxBool
      'parentCode': parentCode,
      'isSelected': isSelected,
      // 'balanceType': balanceType,
      // 'description': description,
      // 'accType': accType,
      'childAccounts': children.map((i) => i.toJson()).toList(),
    };
  }
}
