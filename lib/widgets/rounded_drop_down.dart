import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

class RoundedDropDownField extends StatelessWidget {
  final String label;
  final List<String> items;
  final TextEditingController controller;
  final double? width;
  final double? height;

  const RoundedDropDownField({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: getRegularStyle(),
            ),


            CustomDropdown<String>.search(

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
            )

            // child: DropdownButtonFormField<String>(
              //   value: controller.text.isEmpty ? null : controller.text,
              //   icon: const Icon(
              //     Icons.keyboard_arrow_down,
              //     color: kcMediumGrey,
              //     size: 18,
              //   ),
              //   isExpanded: true,
              //   onChanged: (value) {
              //     controller.text = value ?? '';
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'This field cannot be empty';
              //     }
              //     return null;
              //   },
              //   items: items.map((String item) {
              //     return DropdownMenuItem<String>(
              //       value: item,
              //       child: Text(
              //         item,
              //         style: getRegularStyle(
              //         ),
              //       ),
              //     );
              //   }).toList(),
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //       borderSide: const BorderSide(
              //         color: kcLightGrey,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //       borderSide: const BorderSide(
              //         color: kcLightGrey,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //       borderSide: const BorderSide(
              //         color: kcLightGrey,
              //       ),
              //     ),
              //     contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              //   ),
              // ),

          ],
        ),
      ),
    );
  }
}
