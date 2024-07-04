import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPrimaryAccountController extends GetxController {  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController= TextEditingController();
  final TextEditingController accountTypeController = TextEditingController();
  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = false.obs;
}