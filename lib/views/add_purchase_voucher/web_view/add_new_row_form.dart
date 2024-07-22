import 'dart:math';

import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/models/purcahse_voucher_model.dart';
import 'package:getx_admin_panel/models/voucher_items.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';
import 'package:getx_admin_panel/widgets/semiRounded_button.dart';

import '../../../widgets/rounded_drop_down.dart';
class AddNewRowForm extends StatelessWidget {
  const AddNewRowForm({super.key});

  @override
  Widget build(BuildContext context) {
    return

            buildTabletForm();

  }



  Widget buildTabletForm() {
    final controller = Get.put(AddPurchaseController());
    return Obx(
          () => Visibility(
        visible: controller.showAddRowForm.value,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Same content as before
                buildFormContent(controller),
                verticalSpaceSmall,
                ResponsiveButton(
                  text: 'Add',
                  onPressed: () {
                    addNewRow(controller);
                  },
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormContent(AddPurchaseController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedDropDownField(
              label: 'Account Code',
              items: controller.getItems('Account Code'),
              controller: controller.getController('Account Code'),
            ),
            horizontalSpaceMedium,
            RoundedTextField(
              label: 'Account Name',
              controller: controller.getController('Account Name'),
            ),
            horizontalSpaceMedium,
            RoundedTextField(
              label: 'Debit',
              controller: controller.getController('Debit'),
            ),
            horizontalSpaceMedium,
            RoundedTextField(
              label: 'Tax',
              controller: controller.getController('Tax'),
            ),
            horizontalSpaceMedium,
            RoundedTextField(
              label: 'Vat',
              controller: controller.getController('Vat'),
            ),
            horizontalSpaceMedium,
          ],
        ),
        verticalSpaceMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedDropDownField(
              label: 'Cost Center 1',
              items: controller.getItems('Cost Center 1'),
              controller: controller.rowCostCenter1Controller,
            ),
            horizontalSpaceMedium,
            RoundedDropDownField(
              label: 'Cost Center 2',
              items: controller.getItems('Cost Center 4'),
              controller: controller.rowCostCenter2Controller,
            ),
            horizontalSpaceMedium,
            RoundedDropDownField(
              label: 'Cost Center 3',
              items: controller.getItems('Cost Center 4'),
              controller: controller.rowCostCenter3Controller,
            ),
            horizontalSpaceMedium,
            RoundedDropDownField(
              label: 'Cost Center 4',
              items: controller.getItems('Cost Center 4'),
              controller: controller.rowCostCenter4Controller,
            ),
            horizontalSpaceMedium,
            RoundedTextField(
              label: 'Narration',
              controller: controller.rownarrationController,
            ),
            horizontalSpaceMedium,
          ],
        ),
      ],
    );
  }

  void addNewRow(AddPurchaseController controller) {
    Random random = Random();
    controller.onAddNewRowAddPress(VoucherItems(
       random.nextInt(100),
      controller.accountCodeController.text,
       controller.accountNameController.text,
       12,
       0,
     23490,
     15,
      0,
      0,
       0,
       controller.rownarrationController.text,
      controller.rowCostCenter1Controller.text,
     controller.rowCostCenter2Controller.text,
       controller.rowCostCenter3Controller.text,
      controller.rowCostCenter4Controller.text,
    ));
  }
}


// class AddNewRowForm extends GetView<AddPurchaseController> {
//   const AddNewRowForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AddPurchaseController());
//     return Obx(
//       () => Visibility(
//         visible: controller.showAddRowForm.value,
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 RoundedDropDownField(
//                   label: 'Account Code',
//                   items: controller.getItems('Account Code'),
//                   controller: controller.getController('Account Code'),
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedTextField(
//                   label: 'Account Name',
//                   controller: controller.getController('Account Name'),
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedTextField(
//                   label: 'Debit',
//                   controller: controller.getController('Debit'),
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedTextField(
//                   label: 'Tax',
//                   controller: controller.getController('Tax'),
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedTextField(
//                   label: 'Vat',
//                   controller: controller.getController('Vat'),
//                 ),
//                 horizontalSpaceMedium,
//               ],
//             ),
//             verticalSpaceMedium,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 RoundedDropDownField(
//                   label: 'Cost Center 1',
//                   items: controller.getItems('Cost Center 1'),
//                   controller: controller.rowCostCenter1Controller,
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedDropDownField(
//                   label: 'Cost Center 2',
//                   items: controller.getItems('Cost Center 4'),
//                   controller: controller.rowCostCenter2Controller,
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedDropDownField(
//                   label: 'Cost Center 3',
//                   items: controller.getItems('Cost Center 4'),
//                   controller: controller.rowCostCenter3Controller,
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedDropDownField(
//                   label: 'Cost Center 4',
//                   items: controller.getItems('Cost Center 4'),
//                   controller: controller.rowCostCenter4Controller,
//                 ),
//                 horizontalSpaceMedium,
//                 RoundedTextField(
//                   label: 'Narration',
//                   controller: controller.rownarrationController,
//                 ),
//                 horizontalSpaceMedium,
//               ],
//             ),
//             verticalSpaceSmall,
//             ResponsiveButton(
//               text: 'Add',
//               onPressed: () {
//
//                 Random random =  Random();
//                 controller.onAddNewRowAddPress(VoucherItems(
//                     recordId: random.nextInt(100),
//                     accountCode: controller.accountCodeController.text,
//                     accountName: controller.accountNameController.text,
//                     taxCode: 12,
//                     amountCredit: 0,
//                     amountDebit: 23490,
//                     vat: 15,
//                     total: 0,
//                     // total: (int.parse(controller.debitController.text) * 0.15),
//                     conRate: 0,
//                     conAmount: 0,
//                     narration: controller.rownarrationController.text,
//                     costCenter1: controller.rowCostCenter1Controller.text,
//                     costCenter2: controller.rowCostCenter2Controller.text,
//                     costCenter3: controller.rowCostCenter3Controller.text,
//                     costCenter4: controller.rowCostCenter4Controller.text),
//                 );
//               },
//             ),
//             verticalSpaceSmall,
//           ],
//         ),
//       ),
//     );
//   }
// }
