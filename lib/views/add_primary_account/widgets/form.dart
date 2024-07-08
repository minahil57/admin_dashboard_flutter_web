import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';
import 'package:getx_admin_panel/models/tree_node.dart';
import 'package:getx_admin_panel/views/add_primary_account/add_primary_account_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';
import 'package:getx_admin_panel/widgets/semi_rounded_elevated_button.dart';

class MyForm extends GetView<AddPrimaryAccountController> {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPrimaryAccountController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedTextField(
                controller: controller.nameController,
                label: 'Account Name',
              ),
              horizontalSpace(120),
              RoundedTextField(
                controller: controller.descriptionController,
                label: 'Description',
              ),
              horizontalSpace(120),
              RoundedTextField(
                controller: controller.accountTypeController,
                label: 'Account Type',
              ),
              // horizontalSpace(120),
              horizontalSpaceMedium,
              SemiRoundedElevatedButton(
                text: 'Save',
                onPressed: () {
                  controller.addToList(
                    MyTreeNode(
                      accountName: controller.nameController.text,
                      accountCode: '11010001',
                      balance: 0.00,
                      level: 1,
                      isActive: false,
                      balanceType: 'Debit',
                      description: controller.descriptionController.text,
                      accType: controller.accountTypeController.text,
                        isSelected: false,
                  ),
                  );
                },
                width: 85,
                height: 20,
              ),
              // horizontalSpace(70),
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Debit',
                    style: getRegularStyle(fontSize: 16),
                  ),
                  Obx(
                    () => Checkbox(
                      value: controller.checkbox1.value,
                      side: const BorderSide(
                        color: kcPrimaryColor,
                      ),
                      onChanged: (bool? value) {
                        controller.checkbox1.value = value!;
                      },
                    ),
                  ),
                ],
              ),
              horizontalSpace(160),
              Row(
                children: [
                  Text(
                    'Credit',
                    style: getRegularStyle(fontSize: 16),
                  ),
                  Obx(
                    () => Checkbox(
                      side: const BorderSide(
                        color: kcPrimaryColor,
                      ),
                      value: controller.checkbox2.value,
                      onChanged: (bool? value) {
                        controller.checkbox2.value = value!;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
