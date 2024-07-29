import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

class RoundedDropDownFieldInsideLabel extends StatelessWidget {
  final String label;
  final List<String> items;
  final TextEditingController controller;
  final double? width;
  final double? height;

  const RoundedDropDownFieldInsideLabel({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomDropdown<String>.search(
        hintText: label,
        closedHeaderPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        decoration: CustomDropdownDecoration(
          closedFillColor: Colors.transparent,
          listItemStyle: getRegularStyle(),

          closedBorder: Border.all(
            color: kcLightGrey, // Set the border color to gray
            width: 1.0,        // Set the border width
          ),
          closedBorderRadius: const BorderRadius.all(
            Radius.circular(8.0), // Set the border radius for rounded corners
          ),
          hintStyle: getRegularStyle(),
          headerStyle: getRegularStyle(),
        ),
        items: items,
        onChanged: (dynamic newValue) {
          controller.text = newValue ?? '';
        },
      ),
    );
  }
}
