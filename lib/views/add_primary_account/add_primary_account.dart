import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_primary_account/widgets/form.dart';
import 'package:getx_admin_panel/widgets/rounded_text_field.dart';

class AddPrimaryAccount extends StatelessWidget {
  const AddPrimaryAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              Text(' Primary Account',style: getRegularBoldStyle()),
              verticalSpaceMedium,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                decoration:  BoxDecoration(
                  color: kcWhitecolor,
                  boxShadow:  [
                    BoxShadow(  
                      color: kcPrimaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: kcPrimaryColor,
                  )
                ),
                
                child: MyForm(),
              ),
              verticalSpaceMedium,
             
            ],
          ),
        ),
    ));
    
  }
  

  
}