import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:getx_admin_panel/core/helpers/ui_helpers.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/views/item_master/item_master_controller.dart';
import 'package:getx_admin_panel/views/item_master/widgets/data_grid.dart';
import 'package:go_router/go_router.dart';

class ItemMasterView extends GetView<ItemMasterController> {
  const ItemMasterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemMasterController());
    return Scaffold(
      backgroundColor: kcWhitecolor.withAlpha(233),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                width: 150,
                decoration: BoxDecoration(
                  color: kcWhitecolor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: kcPrimaryColor,
                  ),
                ),
                child: Obx(() => Row(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedYear.value,
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: kcBlackColor),
                            onChanged: (newValue) {
                              controller.onYearChange(newValue);
                            },
                            items: <String>['2022', '2023', '2024']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )),
              ),
              // Obx(() => Visibility(
              //       visible: controller.isAdd.value,
              //       child: AddForm(),
              //     )),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item Master List',
                    style: getMediumStyle(),
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.isAdd.value,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // controller.onAddPress();
                          context.go('/add_item');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor,
                          foregroundColor: kcWhitecolor,
                          shape: const StadiumBorder(),
                          minimumSize: const Size(150, 50),
                          maximumSize: const Size(150, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          elevation: 10,
                          shadowColor: kcBlackColor,
                          textStyle: getMediumStyle(),
                        ),
                        label: const Text('Add'),
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
              const DataGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
