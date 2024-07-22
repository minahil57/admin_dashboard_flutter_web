import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:getx_admin_panel/widgets/expanded_textForm_field.dart';
import 'package:getx_admin_panel/widgets/rounded_drop_down.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';
import 'package:getx_admin_panel/widgets/semi_rounded_elevated_button.dart';

class PaymentVoucherForm extends GetView<AddPurchaseController> {
  const PaymentVoucherForm({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(AddPurchaseController());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
      decoration: BoxDecoration(
        color: kcWhitecolor,
        border: Border.all(color: kcPrimaryColor, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: kcPrimaryColor, spreadRadius: 0.5, blurRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.sizeOf(context).width * 0.21,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedTextField(
                    label: 'Voucher Date',
                    isCalender: true,
                    readOnly: true,
                    controller: itemController.getController('Voucher Date')),
                verticalSpaceMedium,
                RoundedDropDownField(
                  label: 'Payment Type',
                  items: controller.getItems('Payment Type'),
                  controller: itemController.getController('Payment Type'),
                ),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Account (Cr)',
                    controller: itemController.getController('Account (Cr)')),
                verticalSpaceMedium,
                RoundedDropDownField(
                  label: 'Currency',
                  items: controller.getItems('Currency'),
                  controller: itemController.getController('Currency'),
                ),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Conversion Rate',
                    controller: itemController.getController('Conversion Rate')),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Amount',
                    controller: itemController.getController('Amount')),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Base Currency Amount (CR)',
                    controller: itemController.getController('Base Currency Amount (CR)')),
              ],
            ),
          ),
          SizedBox(
            // padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.sizeOf(context).width * 0.21,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedTextField(
                    label: 'Voucher No',
                    controller: itemController.getController('Voucher No')),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Ref No',
                    controller: itemController.getController('Ref No'),
                ),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Cheque No',
                    controller: itemController.getController('Cheque No')),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Cheque Date',
                    isCalender: true,
                    readOnly: true,
                    controller: itemController.getController('Cheque Date')),
                verticalSpaceMedium,
                RoundedTextField(
                    label: 'Paid To',
                    controller: itemController.getController('Paid To')),
                verticalSpaceMedium,
                RoundedDropDownField(
                  label: 'Tax Code',
                  items: controller.getItems('Tax Code'),
                  controller: itemController.getController('Tax Code'),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: itemController.checkbox1.value,
                            side: const BorderSide(
                              color: kcPrimaryColor,
                            ),
                            onChanged: (bool? value) {
                              itemController.checkbox1.value = value!;
                            },
                          ),
                        ),
                         Text('Tax Inclusive',style: getRegularStyle(),)
                      ],
                    ),
                    SemiRoundedElevatedButton(
                      text: 'Apply To Row',
                      height: 10,
                      width: 20,
                      onPressed: () {},
                    ),
                  ],
                ),
                verticalSpaceMedium,
              ],
            ),
          ),
          SizedBox(
            // padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.sizeOf(context).width * 0.21,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedDropDownField(
                  label: 'Cost Center 1',
                  items: itemController.getItems('Cost Center 1'),
                  controller: itemController.getController('Cost Center 1'),
                ),
                verticalSpaceMedium,
                RoundedDropDownField(
                  label: 'Cost Center 2',
                  items: itemController.getItems('Cost Center 2'),
                  controller: itemController.getController('Cost Center 2'),
                ),
                verticalSpaceMedium,
                RoundedDropDownField(
                  label: 'Cost Center 3',
                  items: itemController.getItems('Cost Center 3'),
                  controller: itemController.getController('Cost Center 3'),
                ),
                verticalSpaceMedium,
                RoundedDropDownField(
                  label: 'Cost Center 4',
                  items: itemController.getItems('Cost Center 4'),
                  controller: itemController.getController('Cost Center 4')
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: itemController.checkbox2.value,
                        side: const BorderSide(
                          color: kcPrimaryColor,
                        ),
                        onChanged: (bool? value) {
                          itemController.checkbox2.value = value!;
                        },
                      ),
                    ),
                    Text(
                      'Copy Cost Center',
                      style: getRegularStyle(),
                    )
                  ],
                ),
                verticalSpaceMedium,
                ExpandedTextFormField(
                  label: 'Narration',
                  width: MediaQuery.sizeOf(context).width,
                  height: 150,
                  controller: itemController.getController('Narration'),
                ),
                verticalSpaceTiny,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
