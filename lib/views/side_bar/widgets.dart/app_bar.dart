import 'package:flutter_animate/flutter_animate.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';

class SideBarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SideBarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: kcWhitecolor,
        title: Container(
          color: kcWhitecolor,
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: Image.asset(AssetManager.qfinityLogo,
                width: 50, height: 50),
          ),
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
      );
  }
  
  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}