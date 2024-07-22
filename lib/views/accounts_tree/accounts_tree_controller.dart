import 'dart:developer';

import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/services/account_tree_service.dart';

class DashboardController extends GetxController {
   final controller00 = ValueNotifier<bool>(false);
   var searchQuery = ''.obs;
   final ItemMasterService itemMasterService = ItemMasterService();
   final TextEditingController searchController = TextEditingController();
   GlobalKey key = GlobalKey();
   void searchAndExpandTree(String query) {
     final matchingNodes = <MyTreeNode>[];
     final treeController = this.treeController;

     // Function to search and collect matching nodes
     void searchNode(MyTreeNode node) {
       if (node.accountName.toLowerCase().contains(query.toLowerCase())) {
         matchingNodes.add(node);
       }
       node.children.forEach(searchNode);
     }

     // Start search from the root nodes
     treeController.roots.forEach(searchNode);

     if (matchingNodes.isNotEmpty) {
       final node = matchingNodes.first;

       // Expand tree to the found node
       void expandParent(MyTreeNode node) {
         if (node.parent != null) {
           treeController.expand(node.parent!);
           expandParent(node.parent!);
         }
       }

       expandParent(node);

       // Scroll to the found node (if your TreeController supports scrolling)
       treeController.expandAncestors(node);
     }
   }


   void showContextMenu(BuildContext context) async {
     final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
     if (renderBox != null) {
       final Offset offset = renderBox.localToGlobal(Offset.zero);
       final double leftPosition = offset.dx + renderBox.size.width*0.02;
       final double topPosition = offset.dy + renderBox.size.height*0.02;

       final selectedOption = await showMenu(
         context: context,
         color: kcWhitecolor,
         position: RelativeRect.fromLTRB(
           leftPosition,
           topPosition,
           leftPosition,
           topPosition,
         ),
         items: [
           _buildMenuItem(context, 'Add'),
           _buildMenuItem(context, 'Edit'),
           _buildMenuItem(context, 'Show Transaction'),
           _buildMenuItem(context, 'Delete'),
           _buildMenuItem(context, 'Deactivate'),
           _buildMenuItem(context, 'Print'),
           _buildMenuItem(context, 'How Deactivated'),
           _buildMenuItem(context, 'Hide Deactivated'),
         ],
       );

       // Handle menu selection
       if (selectedOption != null) {
         // Add your logic to handle different options here
       }
     }
     else{
     }
   }

   PopupMenuItem<String> _buildMenuItem(BuildContext context, String text) {
     return PopupMenuItem<String>(
       value: text,
       child: MouseRegion(
         onEnter: (_) {
           // setState(() {});
         },
         onExit: (_) {
           // setState(() {});
         },
         child: Container(
           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
           decoration: BoxDecoration(
             color: Colors.transparent,
             borderRadius: BorderRadius.circular(8),
           ),
           child: Text(
             text,
             style: getRegularStyle(),
           ),
         ),
       ),
     );
   }





  late TreeController <MyTreeNode> treeController ;


  void toggle(value,bool values) {
     value = values;
     log(value.toString());
     update();
  
  }

    @override
  Future<void> onInit() async {
    super.onInit();

  }

  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }
   RxList<MyTreeNode> roots = <MyTreeNode>[
     MyTreeNode(
       accountName: 'Main Company Assets',
       accountCode: '9876543210123',
       balance: 450000.00,
       isActive: true,
       isSelected: false,
       level: 1,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           isActive: true,
           isSelected: true,
           accountName: 'Primary Asset Branch',
           accountCode: '98765',
           balance: 120000135343,
           children: <MyTreeNode>[
             MyTreeNode(
               level: 3,
               isActive: true,
               isSelected: false,
               accountName: 'Asset Branch Subdivision A',
               accountCode: '9876543210123',
               balance: 7500041241,
               children: <MyTreeNode>[
                 MyTreeNode(
                   level: 4,
                   isActive: true,
                   isSelected: false,
                   accountName: 'Subdivision Unit A1',
                   accountCode: '9876543210123',
                   balance: 3500042414,
                   children: [
                     MyTreeNode(
                       level: 5,
                       isActive: true,
                       isSelected: false,
                       accountName: 'Unit A1 Section 1',
                       accountCode: '9876543210123',
                       balance: 2000012424124,
                       children: [
                         MyTreeNode(
                           level: 6,
                           isActive: true,
                           isSelected: false,
                           accountName: 'Section 1 Subsection A',
                           accountCode: '9876543210123',
                           balance: 100002421,
                         ),
                       ],
                     ),
                   ],
                 ),
               ],
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           isActive: true,
           isSelected: true,
           accountName: 'Secondary Asset Branch',
           accountCode: '87654',
           balance: 110000,
           children: <MyTreeNode>[
             MyTreeNode(
               level: 3,
               isActive: true,
               isSelected: false,
               accountName: 'Asset Branch Subdivision B',
               accountCode: '8765432101234',
               balance: 85000,
               children: <MyTreeNode>[
                 MyTreeNode(
                   level: 4,
                   isActive: true,
                   isSelected: false,
                   accountName: 'Subdivision Unit B1',
                   accountCode: '8765432101234',
                   balance: 45000,
                   children: [
                     MyTreeNode(
                       level: 5,
                       isActive: true,
                       isSelected: false,
                       accountName: 'Unit B1 Section 1',
                       accountCode: '8765432101234',
                       balance: 30000,
                       children: [
                         MyTreeNode(
                           level: 6,
                           isActive: true,
                           isSelected: false,
                           accountName: 'Section 1 Subsection B',
                           accountCode: '8765432101234',
                           balance: 15000,
                         ),
                       ],
                     ),
                   ],
                 ),
               ],
             ),
           ],
         ),
         MyTreeNode(
           accountName: 'Tertiary Asset Holdings',
           level: 2,
           isActive: true,
           isSelected: false,
           accountCode: '7654321098765',
           balance: 95000,
         ),
       ],
     ),
     MyTreeNode(
       level: 1,
       accountName: 'Corporate Liabilities',
       isActive: true,
       isSelected: false,
       accountCode: '6543210987654',
       balance: -200000,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           isSelected: false,
           accountName: 'Long-term Liabilities',
           isActive: true,
           accountCode: '65432',
           balance: -150000,
           children: <MyTreeNode>[
             MyTreeNode(
               isSelected: false,
               level: 3,
               accountName: 'Liabilities Subdivision C',
               isActive: true,
               accountCode: '6543210987654',
               balance: -80000,
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Short-term Liabilities',
           isActive: true,
           accountCode: '54321',
           isSelected: false,
           balance: -50000,
         ),
       ],
     ),
     MyTreeNode(
       level: 1,
       accountName: 'Shareholder Equity',
       accountCode: '4321098765432',
       isActive: true,
       isSelected: false,
       balance: 300000,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           accountName: 'Equity Capital Account',
           isActive: true,
           isSelected: false,
           accountCode: '43210',
           balance: 200000,
           children: <MyTreeNode>[
             MyTreeNode(
               level: 3,
               isSelected: false,
               accountName: 'Equity Subdivision D',
               isActive: true,
               accountCode: '4321098765432',
               balance: 100000,
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Retained Earnings',
           isActive: true,
           isSelected: false,
           accountCode: '321093525',
           balance: 10000039048521.02324,
         ),
       ],
     ),
     MyTreeNode(
       level: 1,
       accountName: 'Operational Revenue',
       isActive: true,
       accountCode: '2109876543210',
       isSelected: false,
       balance: 60000005909602905.305034,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           accountName: 'Sales Revenue Stream',
           isSelected: false,
           isActive: true,
           accountCode: '21098',
           balance: 40000035234.3531,
           children: <MyTreeNode>[
             MyTreeNode(
               isSelected: false,
               level: 3,
               accountName: 'Revenue Subdivision E',
               isActive: true,
               accountCode: '2109876543210',
               balance: 200000.435234,
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Service Revenue Stream',
           isActive: true,
           accountCode: '10987',
           balance: -23413200000.00124,
           isSelected: false,
         ),
       ],
     ),
     MyTreeNode(
       level: 1,
       accountName: 'Operational Expenses',
       accountCode: '0987654321098',
       isActive: true,
       balance: -350000345351.359103,
       isSelected: false,
       children: <MyTreeNode>[
         MyTreeNode(
           isSelected: false,
           level: 2,
           accountName: 'Salary Expenses Account',
           isActive: true,
           accountCode: '09876',
           balance: -150000.35141341,
           children: <MyTreeNode>[
             MyTreeNode(
               isActive: true,
               level: 3,
               accountName: 'Expenses Subdivision F',
               accountCode: '0987654321098',
               balance: -7500013241,
               isSelected: false,
               children: [
                 MyTreeNode(
                   level: 4,
                   isActive: true,
                   accountName: 'Subdivision F Section 1',
                   accountCode: '0987654321098',
                   balance: -30000214135,
                   isSelected: false,
                   children: [
                     MyTreeNode(
                       level: 5,
                       isActive: true,
                       isSelected: false,
                       accountName: 'Section 1 Subsection F',
                       accountCode: '0987654321098',
                       balance: -15000124124,
                     ),
                   ],
                 ),
               ],
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Operational Costs Account',
           isActive: true,
           accountCode: '08765412412414',
           balance: -100000345345,
           isSelected: false,
         ),
       ],
     ),

   ].obs;
}