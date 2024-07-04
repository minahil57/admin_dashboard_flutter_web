import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/external_imports.dart';

class StartUpController extends GetxController {
  BuildContext context;
  StartUpController({required this.context});
    RxDouble opacity = 0.0.obs;


  @override
  void onInit() {
    super.onInit();
    _startAnimation();
    _navigateToHome();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 200), () {
        opacity.value = 1.0;
    },);
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
     
      context.go('/');
    },);
  }
  }
  
