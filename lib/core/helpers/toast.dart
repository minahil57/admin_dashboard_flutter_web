import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> showToast(String message){
  return EasyLoading.showToast(
    message,
    toastPosition: EasyLoadingToastPosition.top,
    dismissOnTap: true,
    duration: const Duration(milliseconds: 1000),
    );  
}