import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_primary_account/widgets/data_grid.dart';
import 'package:getx_admin_panel/views/add_primary_account/widgets/form.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration:  BoxDecoration(
                  color: kcWhitecolor,
                  boxShadow:  [
                    BoxShadow(
                      color: kcPrimaryColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: kcPrimaryColor,
                  )
                ),

                child: const MyForm(),
              ),
              verticalSpaceMedium,
               const PrimaryAccountDataGrid(),
              verticalSpaceMedium,
              verticalSpaceMedium,
              verticalSpaceMedium,
              verticalSpaceMedium,


            ],
          ),
        ),
    ));
    
  }
  

  
}