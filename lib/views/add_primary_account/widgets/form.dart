import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';
import 'package:getx_admin_panel/views/add_primary_account/add_primary_account_controller.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';
import 'package:getx_admin_panel/widgets/semi_rounded_elevated_button.dart';



class MyForm extends GetView<AddPrimaryAccountController> {
  const MyForm({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPrimaryAccountController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedTextField(
                controller: controller.nameController,
                label: 'Account Name',
              
              
              ),
              // horizontalSpace(120),
              RoundedTextField(
                controller: controller.descriptionController,
                label: 'Description',
              ),
            //  horizontalSpace(120),
              RoundedTextField(
                controller: controller.accountTypeController,
                label: 'Account Type',
              ),
              // horizontalSpace(120),
             verticalSpaceSmall,
              SemiRoundedElevatedButton(text: 'Save', onPressed: (){}),
              // horizontalSpace(70),
            ],
          ),
        
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: controller.checkbox1.value,
                    onChanged: (bool? value) {
                    
                      controller.checkbox1.value = value!;
                 
                    },
                  ),
                  Text('Checkbox 1'),
                ],
              ),
                Row(
            children: [
              Checkbox(
                value: controller.checkbox2.value,
                onChanged: (bool? value) {
                 
                  controller.checkbox2.value = value!;
                
                },
              ),
              Text('Checkbox 2'),
            ],
          ),
            ],
          ),
        
        ],
      ),
    );
  }
}