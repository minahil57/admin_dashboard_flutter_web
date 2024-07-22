
class MyTreeNode {
  MyTreeNode({
    required this.accountName,
    required this.accountCode,
    required this.balance,
    required this.level,
    required this.isActive ,
    this.parentCode,
    required this.isSelected,

    this.balanceType,
    this.description,
    this.accType,
    this.parent,


    this.children = const <MyTreeNode>[],

  })
  {
  // Set parent for all children
  for (var child in children) {
  child.parent = this;
  }
}

  final String accountName;
  final String accountCode;
  final double balance;
  final int level;
  String ? balanceType;
  String ? parentCode;
  String ? accType;
  String ? description;
  bool isSelected;
  MyTreeNode? parent;
  bool  isActive  ;
   List<MyTreeNode> children;
  factory MyTreeNode.fromJson(Map<String, dynamic> json) {
    return MyTreeNode(
      accountName: json['accountName'],
      accountCode: json['accountCode'].toString(),
      balance: json['balance'].toDouble(),
      level: json['level'],
      isActive: json['isActive'],
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
      'isActive': isActive,
      'parentCode': parentCode,
      'isSelected': isSelected,
      // 'balanceType': balanceType,
      // 'description': description,
      // 'accType': accType,
      'childAccounts': children.map((i) => i.toJson()).toList(),
    };
  }
}
// class Account {
//   bool isSelected;
//   String parentCode;
//   String accountCode;
//   String accountName;
//   int level;
//   double balance;
//   bool isActive;
//   List<Account> childAccounts;
//
//   Account({
//     required this.isSelected,
//     required this.parentCode,
//     required this.accountCode,
//     required this.accountName,
//     required this.level,
//     required this.balance,
//     required this.isActive,
//     required this.childAccounts,
//   });
//
//   @override
//   String toString() {
//     return 'Account(accountCode: $accountCode, accountName: $accountName, balance: $balance, level: $level)';
//   }
