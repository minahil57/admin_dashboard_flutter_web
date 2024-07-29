
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/helpers/ui_helpers.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

class RoundedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool ? readOnly;
  final bool ? isCalender;
  final Widget ? suffixIcon;
  final double ? width;
  final double ? height;

  const RoundedTextField({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.suffixIcon,
    this.readOnly,
    this.isCalender,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,style: getRegularStyle(
              fontSize: 12,
            ),),
            verticalSpaceTiny,
        Container(
          constraints: BoxConstraints(
            minWidth: width ?? MediaQuery.sizeOf(context).width,
            maxWidth: width ?? MediaQuery.sizeOf(context).width,
            minHeight: height ?? 35,
            maxHeight: height ?? 35,
          ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                readOnly: readOnly ?? false,
                controller: controller,
                style: getRegularStyle(
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  floatingLabelStyle: getRegularStyle(color: kcPrimaryColor, fontSize: 12),
                  labelStyle: getRegularStyle(
                    fontSize: 10,
                  ),
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
                  suffixIcon: isCalender == true
                      ? IconButton(
                    icon: const Icon(Icons.calendar_month_sharp,size: 18,color: kcMediumGrey,),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        initialDate: DateTime.now(),
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        controller.text = pickedDate.toString().split(' ')[0];
                      }
                    },
                  )
                      : suffixIcon,
                ),
              ),

        ),
          ],
        ),
      ),
    );
  }
}
