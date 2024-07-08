import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyTreeNode {
  MyTreeNode({
    required this.title,
    required this.accCode,
    required this.balance,
    required this.level,
    required this.isActive ,

    this.balanceType,
    this.description,
    this.accType,


    this.children = const <MyTreeNode>[],
  });

  final String title;
  final String accCode;
  final String balance;
  final int level;
  String ? balanceType;
  String ? accType;
  String ? description;
  bool  isActive  ;
   List<MyTreeNode> children;
}
class Account {
  bool isSelected;
  String parentCode;
  String accountCode;
  String accountName;
  int level;
  double balance;
  bool isActive;
  List<Account> childAccounts;

  Account({
    required this.isSelected,
    required this.parentCode,
    required this.accountCode,
    required this.accountName,
    required this.level,
    required this.balance,
    required this.isActive,
    required this.childAccounts,
  });

  @override
  String toString() {
    return 'Account(accountCode: $accountCode, accountName: $accountName, balance: $balance, level: $level)';
  }
}