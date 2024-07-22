import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          context.go('/add_primary_account');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kcPrimaryColor, 
          foregroundColor: kcWhitecolor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
               Radius.circular(15),

            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('Add New',style: getRegularStyle(
              color: kcWhitecolor
             ),),
             horizontalSpaceSmall,
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color : kcWhitecolor,
                shape: BoxShape.circle,
              ),

              child: const Center(
                child: Icon(
                  Icons.add,
                  color: kcPrimaryColor,
                  size: 16,
                ),
              ),
            ),
          
           
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Button Example'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomButton(),
          ),
        ),
      ),
    );
  }
}


