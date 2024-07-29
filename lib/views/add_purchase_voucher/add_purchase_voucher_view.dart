import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/helpers/ui_helpers.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/mobile_view/payment_form_mobile.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/tablet_view/payment_form_tab_view.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/tablet_view/top_bar_tab.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/web_view/add_new_row_form.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/image_picker_container.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/web_view/payment_voucher_form.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/row_grid.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/web_view/top_bar_add_purchase_voucher.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/editable_table.dart';
// import 'package:getx_admin_panel/views/custom_grid/custom_grid_view.dart';
import 'package:getx_admin_panel/widgets/semiRounded_button.dart';

import 'mobile_view/top_bar_mobile_view.dart';

class PurchaseVoucherView extends GetView<AddPurchaseController> {
  const PurchaseVoucherView({super.key});

  @override
  Widget build(BuildContext context) {

    final itemController = Get.put(AddPurchaseController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemController.setContext(context);
      log('Called this function');
    },);
    return Scaffold(
      backgroundColor: kcWhitecolor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          log(constraints.maxWidth.toString());
          if (constraints.maxWidth < 690) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
                child: Column(
                  children: [
                    const TopBarAddPurchaseVoucherMobileView(),
                    verticalSpaceSmall,
                    Obx(
                      () => controller.isLoading.value
                          ? const PaymentVoucherFormMobileView()
                          : const PaymentVoucherFormMobileView(),
                    ),
                    verticalSpaceMedium,
                    const ImagePickerContainer(),
                    verticalSpaceMedium,
                    ResponsiveButton(
                      text: 'Add New Row',
                      icon: Icons.add_circle_outline,
                      onPressed: () {
                        itemController.onAddRowFormPress(context);
                      },
                    ),
                    verticalSpaceMedium,
                    const VoucherItemsDataGrid(),
                    verticalSpaceMedium,
                     PlutoTable(),
                  ],
                ),
              ),
            );
          } else if (constraints.maxWidth < 1150) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TopBarAddPurchaseVoucherTabView(),
                    verticalSpaceMedium,
                    Obx(
                      () => controller.isLoading.value
                          ? const PaymentVoucherFormTabView()
                          : const PaymentVoucherFormTabView(),
                    ),
                    verticalSpaceMedium,
                    const ImagePickerContainer(),
                    verticalSpaceMedium,
                    ResponsiveButton(
                      text: 'Add New Row',
                      icon: Icons.add_circle_outline,
                      onPressed: () {
                        itemController.onAddRowFormPress(context);
                      },
                    ),
                    verticalSpaceMedium,
                    const AddNewRowForm(),
                    verticalSpaceMedium,
                    const VoucherItemsDataGrid(),
                    verticalSpaceMedium,
                     PlutoTable(),
                  ],
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TopBarAddPurchaseVoucher(),
                    verticalSpaceMedium,
                    Obx(
                      () => controller.isLoading.value
                          ? const PaymentVoucherForm()
                          : const PaymentVoucherForm(),
                    ),
                    verticalSpaceMedium,
                    const ImagePickerContainer(),
                    verticalSpaceMedium,
                    ResponsiveButton(
                      text: 'Add New Row',
                      icon: Icons.add_circle_outline,
                      onPressed: () {
                        itemController.onAddRowFormPress(context);
                      },
                    ),
                    verticalSpaceMedium,
                    const AddNewRowForm(),
                    verticalSpaceMedium,
                    TextField(
                      controller: controller.searchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search ',
                      ),
                      onChanged: (value) {
                        controller.voucherItemsSource.value!.performSearch(value);
                      },
                    ),
                    verticalSpaceSmall,
                    const VoucherItemsDataGrid(),
                    verticalSpaceMedium,
                     PlutoTable(),
                    verticalSpaceMedium,
                    // CustomTableDemos(),
                // SizedBox(
                //   height: MediaQuery.sizeOf(context).height*0.8,
                //   width: MediaQuery.sizeOf(context).height*0.8,
                //   // child:
                //       Obx(
                //         () => itemController.isLoading.value? CustomTableDemo(headers: itemController.headers, accountCodes: itemController.accNums, accountNames: itemController.accNames, costCenter4: itemController.cc4Names, costCenter1: itemController.cc1Names, costCenter2: itemController.cc2Names, costCenter3: itemController.cc3Names,rows: itemController.table_rows,
                //
                //         ):CustomTableDemo(headers: itemController.headers, accountCodes: itemController.accNums, accountNames: itemController.accNames, costCenter4: itemController.cc4Names, costCenter1: itemController.cc1Names, costCenter2: itemController.cc2Names, costCenter3: itemController.cc3Names,rows:itemController.table_rows,
                //
                //         ),
                //       ),
                // ),
                  ],

                ),
              ),
            );
          }
        },
      ),
    );
  }
}
