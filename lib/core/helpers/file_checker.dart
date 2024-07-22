// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
//
// class FileChecker {
//   static bool isImageFile(XFile file) {
//     // List of common image file extensions
//     const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
//
//     // Get the file extension
//     final extension = file.path.split('.').last.toLowerCase();
//     log(extension);
//
//     // Check if the extension is in the list of image extensions
//     return imageExtensions.contains(extension);
//   }
//
//   static void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
// }
