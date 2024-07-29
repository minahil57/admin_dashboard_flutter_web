import 'package:get/get.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_drop_down.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field_with_top_label.dart';

import '../../../core/imports/core_imports.dart';

class AddNewFormTab extends StatelessWidget {
  const AddNewFormTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPurchaseController());

    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedDropDownField(
              label: 'Account Code',
              items: controller.getItems('Account Code'),
              controller: controller.getController('Account Code'),
            ),
            horizontalSpaceSmall,
            RoundedTextField(
              label: 'Account Name',
              controller: controller.getController('Account Name'),
            ),
            horizontalSpaceSmall,
            RoundedTextField(
              label: 'Debit',
              controller: controller.getController('Debit'),
            ),
            horizontalSpaceSmall,
            RoundedTextField(
              label: 'Tax',
              controller: controller.getController('Tax'),
            ),
            horizontalSpaceSmall,
            RoundedTextField(
              label: 'Vat',
              controller: controller.getController('Vat'),
            ),
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
            horizontalSpaceSmall,
            RoundedDropDownField(
              label: 'Cost Center 2',
              items: controller.getItems('Cost Center 4'),
              controller: controller.rowCostCenter2Controller,
            ),
            horizontalSpaceSmall,
            RoundedDropDownField(
              label: 'Cost Center 3',
              items: controller.getItems('Cost Center 4'),
              controller: controller.rowCostCenter3Controller,
            ),
            horizontalSpaceSmall,
            RoundedDropDownField(
              label: 'Cost Center 4',
              items: controller.getItems('Cost Center 4'),
              controller: controller.rowCostCenter4Controller,
            ),
            horizontalSpaceSmall,
            RoundedTextField(
              label: 'Narration',
              controller: controller.rownarrationController,
            ),
          ],
        ),
      ],
    );
  }
}


