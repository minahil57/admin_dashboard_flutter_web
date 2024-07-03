import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

class RoundedDropDownField extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<String>> items;
  final TextEditingController controller;


  const RoundedDropDownField({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: label,
            floatingLabelStyle: getRegularStyle(color: kcPrimaryColor, fontSize: 12),
            labelStyle:  getRegularStyle(
              fontSize: 10,
            ),
            border: const OutlineInputBorder(),
          ),
          items: items,
          onChanged: (value) {
            controller.text = value!; 
          },
        ),
      ),
    );
  }
}