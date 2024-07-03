import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyTreeNode {
  MyTreeNode({
    required this.title,
    required this.accCode,
    required this.balance,
    required this.level,
    required this.isActive ,

    this.children = const <MyTreeNode>[],
  });

  final String title;
  final String accCode;
  final String balance;
  final int level;
   RxBool  isActive  ;
   List<MyTreeNode> children;
}