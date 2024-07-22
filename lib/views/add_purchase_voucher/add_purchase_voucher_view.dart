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
import 'package:getx_admin_panel/views/editable_table.dart';
import 'package:getx_admin_panel/widgets/semiRounded_button.dart';

import 'mobile_view/top_bar_mobile_view.dart';

class PurchaseVoucherView extends GetView<AddPurchaseController> {
  const PurchaseVoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(AddPurchaseController());
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
                    const PaymentVoucherFormMobileView(),
                    verticalSpaceMedium,
                    ImagePickerContainer(),
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
                    const PlutoTable(),
                  ],
                ),
              ),
            );
          }
          else if(constraints.maxWidth < 1150){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TopBarAddPurchaseVoucherTabView(),
                    verticalSpaceMedium,
                    const PaymentVoucherFormTabView(),
                    verticalSpaceMedium,
                    ImagePickerContainer(),
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
                    const PlutoTable(),
                  ],
                ),
              ),
            );

          }
          else {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TopBarAddPurchaseVoucher(),
                    verticalSpaceMedium,
                    const PaymentVoucherForm(),
                    verticalSpaceMedium,
                    ImagePickerContainer(),
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
                    const PlutoTable(),
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
