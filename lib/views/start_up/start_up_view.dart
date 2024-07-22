import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';
import 'package:getx_admin_panel/views/start_up/start_up_controller.dart';

class SplashScreen extends GetView<StartUpController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StartUpController(context: context));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() => AnimatedOpacity(
          opacity: controller.opacity.value,
          duration: const Duration(seconds: 5),
          child: Image.asset(
            AssetManager.qfinityLogoWhite,
            width: 200,
            height: 200,
          ), // Make sure you have the image in the assets folder
        )),
      ),
    );
  }
}