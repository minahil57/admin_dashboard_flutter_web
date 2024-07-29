import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

import '../core/helpers/ui_helpers.dart';
import '../core/theme/app_colors.dart';

class ExpandedTextFormField extends StatelessWidget {
  final double width; // Width of the TextFormField
  final double height;
  final String label;
  final TextEditingController controller;// Height of the TextFormField

  const ExpandedTextFormField({super.key, required this.width, required this.height, required this .controller,required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: getRegularStyle(
        ),),
        verticalSpaceTiny,
        Container(
          constraints: BoxConstraints(
            minWidth: width,
            maxWidth: width,
            minHeight: height,
            maxHeight: height,
          ),
          child: TextFormField(
            style: getRegularStyle(
            ),
            maxLines: null, // Allow multiple lines for bio
            expands: true, // Expand to fill the parent container
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kcLightGrey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kcLightGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kcLightGrey,
                ),
              ),
              contentPadding: const EdgeInsets.all(14.0),
              // labelText: 'Bio',
            ),
          ),
        ),
      ],
    );
  }
}