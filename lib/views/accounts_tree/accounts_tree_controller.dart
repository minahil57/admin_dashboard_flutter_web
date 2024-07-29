import 'dart:developer';

import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/services/account_tree_service.dart';
import 'package:getx_admin_panel/widgets/rounded_drop_down.dart';
import 'package:getx_admin_panel/widgets/rounded_drop_down_inisde_lable.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field_with_top_label.dart';
import 'package:getx_admin_panel/widgets/semiRounded_button.dart';
import 'package:getx_admin_panel/widgets/text_field_hint.dart';

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
       // final node = matchingNodes.first;

       // Expand tree to the found node
       void expandParent(MyTreeNode node) {
         log(node.parent.toString());
         if (node.parent != null) {
           treeController.expand(node.parent!);
           expandParent(node.parent!);
         }
       }
       for (var node in matchingNodes) {
         expandParent(node);
         // Scroll to the found node
         treeController.expandAncestors(node);
       }
       // expandParent(node);
       //
       // // Scroll to the found node (if your TreeController supports scrolling)
       // treeController.expandAncestors(node);
     }
   }


   void showContextMenu(BuildContext context,MyTreeNode node) async {


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
         log(selectedOption);
         if(selectedOption == 'Add'){
           log(node.balance.toString());
         if(node.balance < 0 || node.balance > 0) {
           showDialog(
             context: key.currentContext!,
             builder: (context) {
               return AlertDialog(
                 title: Text('Success'),
                 content: Text(
                     'You cannot add new account once any transaction is done'),
               );
             },
           );

         }
         else{
           showDialog(
             context: context,
             builder: (context) => Dialog(
               backgroundColor: kcWhitecolor,
               child: buildMobileForm(context),
             ),
           );

         }
         }
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




   void toggle(RxBool isActive) {
     if (isActive == null) {
       print('Error: isActive is null');
       return;
     }

     // Here we only update the value, UI-related logic should be handled by the widget
     bool currentValue = isActive.value;
     isActive.value = !currentValue;
   }

    @override
  Future<void> onInit() async {
    super.onInit();
    // treeController = TreeController<MyTreeNode>(
    //         roots: roots,
    //         childrenProvider: (MyTreeNode node) => node.children,
    //       );

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
       isActive: true.obs,
       isSelected: false,
       level: 1,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           isActive: true.obs,
           isSelected: true,
           accountName: 'Primary Asset Branch',
           accountCode: '98765',
           balance: 120000135343,
           children: <MyTreeNode>[
             MyTreeNode(
               level: 3,
               isActive: true.obs,
               isSelected: false,
               accountName: 'Asset Branch Subdivision A',
               accountCode: '9876543210123',
               balance: 7500041241,
               children: <MyTreeNode>[
                 MyTreeNode(
                   level: 4,
                   isActive: true.obs,
                   isSelected: false,
                   accountName: 'Subdivision Unit A1',
                   accountCode: '9876543210123',
                   balance: 3500042414,
                   children: [
                     MyTreeNode(
                       level: 5,
                       isActive: true.obs,
                       isSelected: false,
                       accountName: 'Unit A1 Section 1',
                       accountCode: '9876543210123',
                       balance: 2000012424124,
                       children: [
                         MyTreeNode(
                           level: 6,
                           isActive: true.obs,
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
           isActive: true.obs,
           isSelected: true,
           accountName: 'Secondary Asset Branch',
           accountCode: '87654',
           balance: 110000,
           children: <MyTreeNode>[
             MyTreeNode(
               level: 3,
               isActive: true.obs,
               isSelected: false,
               accountName: 'Asset Branch Subdivision B',
               accountCode: '8765432101234',
               balance: 85000,
               children: <MyTreeNode>[
                 MyTreeNode(
                   level: 4,
                   isActive: true.obs,
                   isSelected: false,
                   accountName: 'Subdivision Unit B1',
                   accountCode: '8765432101234',
                   balance: 45000,
                   children: [
                     MyTreeNode(
                       level: 5,
                       isActive: true.obs,
                       isSelected: false,
                       accountName: 'Unit B1 Section 1',
                       accountCode: '8765432101234',
                       balance: 30000,
                       children: [
                         MyTreeNode(
                           level: 6,
                           isActive: true.obs,
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
           isActive: true.obs,
           isSelected: false,
           accountCode: '7654321098765',
           balance: 95000,
         ),
       ],
     ),
     MyTreeNode(
       level: 1,
       accountName: 'Corporate Liabilities',
       isActive: true.obs,
       isSelected: false,
       accountCode: '6543210987654',
       balance: -200000,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           isSelected: false,
           accountName: 'Long-term Liabilities',
           isActive: true.obs,
           accountCode: '65432',
           balance: -150000,
           children: <MyTreeNode>[
             MyTreeNode(
               isSelected: false,
               level: 3,
               accountName: 'Liabilities Subdivision C',
               isActive: true.obs,
               accountCode: '6543210987654',
               balance: -80000,
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Short-term Liabilities',
           isActive: true.obs,
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
       isActive: true.obs,
       isSelected: false,
       balance: 300000,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           accountName: 'Equity Capital Account',
           isActive: true.obs,
           isSelected: false,
           accountCode: '43210',
           balance: 200000,
           children: <MyTreeNode>[
             MyTreeNode(
               level: 3,
               isSelected: false,
               accountName: 'Equity Subdivision D',
               isActive: true.obs,
               accountCode: '4321098765432',
               balance: 100000,
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Retained Earnings',
           isActive: true.obs,
           isSelected: false,
           accountCode: '321093525',
           balance: 10000039048521.02324,
         ),
       ],
     ),
     MyTreeNode(
       level: 1,
       accountName: 'Operational Revenue',
       isActive: true.obs,
       accountCode: '2109876543210',
       isSelected: false,
       balance: 60000005909602905.305034,
       children: <MyTreeNode>[
         MyTreeNode(
           level: 2,
           accountName: 'Sales Revenue Stream',
           isSelected: false,
           isActive: true.obs,
           accountCode: '21098',
           balance: 40000035234.3531,
           children: <MyTreeNode>[
             MyTreeNode(
               isSelected: false,
               level: 3,
               accountName: 'Revenue Subdivision E',
               isActive: true.obs,
               accountCode: '2109876543210',
               balance: 200000.435234,
             ),
           ],
         ),
         MyTreeNode(
           level: 2,
           accountName: 'Service Revenue Stream',
           isActive: true.obs,
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
       isActive: true.obs,
       balance: -350000345351.359103,
       isSelected: false,
       children: <MyTreeNode>[
         MyTreeNode(
           isSelected: false,
           level: 2,
           accountName: 'Salary Expenses Account',
           isActive: true.obs,
           accountCode: '09876',
           balance: -150000.35141341,
           children: <MyTreeNode>[
             MyTreeNode(
               isActive: true.obs,
               level: 3,
               accountName: 'Expenses Subdivision F',
               accountCode: '0987654321098',
               balance: -7500013241,
               isSelected: false,
               children: [
                 MyTreeNode(
                   level: 4,
                   isActive: true.obs,
                   accountName: 'Subdivision F Section 1',
                   accountCode: '0987654321098',
                   balance: -30000214135,
                   isSelected: false,
                   children: [
                     MyTreeNode(
                       level: 5,
                       isActive: true.obs,
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
           isActive: true.obs,
           accountCode: '08765412412414',
           balance: -100000345345,
           isSelected: false,
         ),
       ],
     ),

   ].obs;
   Widget buildMobileForm(BuildContext context) {
     return Container(
       constraints: BoxConstraints(
         maxHeight: MediaQuery.of(context).size.height * 0.8,
         maxWidth: MediaQuery.of(context).size.width * 0.3,
         minWidth: 280.0, // Minimum width constraint to avoid size missing error
       ),
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   horizontalSpaceTiny,
                   Text(
                     'Account Master',
                     style: getRegularStyle(),
                   ),
                   IconButton(onPressed: (){

                   }, icon: Icon(Icons.close),),
                 ],
               ),

               verticalSpaceSmall,
               RoundedTextFieldInsideText(
                 label: 'Account Code',
                 controller: TextEditingController(),
               ),
               verticalSpaceMedium,
               RoundedTextFieldInsideText(
                 label: 'Account Name(En)',
                 controller: TextEditingController(),
               ),
               verticalSpaceMedium,
               RoundedTextFieldInsideText(
                 label: 'Account Name',
                 controller: TextEditingController(),
               ),
               verticalSpaceMedium,
               RoundedDropDownFieldInsideLabel(
                 label: 'Primary Group',
                 items: [],
                 controller: TextEditingController(),
               ),
               verticalSpaceSmall,
               RoundedDropDownFieldInsideLabel(
                 label: 'Sub Group',
                 items: [],
                 controller: TextEditingController(),
               ),
               verticalSpaceSmall,
               RoundedDropDownFieldInsideLabel(
                 label: 'Account Type',
                 items: [],
                 controller: TextEditingController(),
               ),
               verticalSpaceSmall,
               RoundedDropDownFieldInsideLabel(
                 label: 'Cash Flow Category ',
                 items: [],
                 controller: TextEditingController(),
               ),
               verticalSpaceSmall,
               ResponsiveButton(
                 text: 'Add',
                 onPressed: () {

                 },
               ),
             ],
           ),
         ),
       ),
     );
   }
}