import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_admin_panel/app_routes/app_routes.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/app_theme.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   EasyLoading.instance
    ..textStyle = getMediumStyle(fontSize: 12, color: kcWhitecolor)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = kcPrimaryColor
    ..radius = 12
    ..indicatorSize = 30
    ..textColor = kcPrimaryColor
    ..textStyle = getMediumStyle(fontSize: 14)
    ..indicatorColor = kcWhitecolor
    ..maskColor = kcBlackColor
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      title: 'Qfinity Finance Module',
      theme: buildCustomTheme(),
      builder: EasyLoading.init(),
    
    );
  }
}

