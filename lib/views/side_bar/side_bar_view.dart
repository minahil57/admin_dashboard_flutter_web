import 'dart:math';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';
import 'package:getx_admin_panel/views/side_bar/side_bar_constructor.dart';

class SideNavigationBar extends GetView<SideBarController> {
  final StatefulNavigationShell navigationShell;
  const SideNavigationBar({
    super.key,
    required this.navigationShell,
  });



  @override
  Widget build(BuildContext context,) {
    final controller = Get.put(SideBarController());
    // final selectedTab = ref.watch(selectedRouteProvider);
    final sideBarKey = ValueKey(Random().nextInt(100000000));
   
    return Obx(() => AdminScaffold(
      backgroundColor: kcWhitecolor,
              appBar: AppBar(
               elevation: 2,
                backgroundColor: kcWhitecolor,

                shadowColor: kcPrimaryColor,
                title: Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: Image.asset(AssetManager.qfinityLogo,
                      width: 50, height: 50),
                ),
                actions: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        decoration: BoxDecoration(
                          color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_drop_down,
                      color: kcWhitecolor,
                      size: 18,
                    ),
                    Text(
                      'Admin',
                      style: getRegularStyle(color: kcWhitecolor),
                    ),
                    
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 10,
               
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: const BoxDecoration(
                    color: kcVeryLightGrey,
                    shape: BoxShape.circle,
                    
                  ),
                  child: const Icon(
                    Icons.logout_outlined,
                    color: kcPrimaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          horizontalSpaceSmall,
        ],
      ),
      sideBar: SideBar(
        backgroundColor: kcWhitecolor,
        activeTextStyle: getMediumStyle(color: kcWhitecolor),
        activeIconColor: kcWhitecolor,
        activeBackgroundColor: kcPrimaryColor,
        iconColor: kcLightGrey,
        textStyle: getRegularStyle(),
        key: sideBarKey,
        onSelected: (e) {
          final index = controller.getSideBarItem(e);
      
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
        },
        items: controller.items,
         selectedRoute: controller.selectedRoute.value,
      ),
      body: navigationShell,
    ));
  }
}
