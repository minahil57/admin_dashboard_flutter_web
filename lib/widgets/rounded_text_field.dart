
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/helpers/ui_helpers.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';

class RoundedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const RoundedTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: getRegularStyle(),),
            verticalSpaceSmall,
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
              readOnly: (label == 'Modified Date' || label == 'Created Date') ? true : false,
              controller: controller,
              style: getRegularStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                labelText: label,
                floatingLabelStyle: getRegularStyle(color: kcPrimaryColor, fontSize: 12),
                labelStyle: getRegularStyle(
                  fontSize: 10,
                ),
                border: const OutlineInputBorder(),
                
                suffixIcon: (label == 'Modified Date' || label == 'Created Date')
                    ? IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            controller.text = pickedDate.toString().split(' ')[0];
                          }
                        },
                      )
                    : null,
                    
              ),
            ),
          ],
        ),
      ),
    );
  }
}
