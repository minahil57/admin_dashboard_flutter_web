

import '../core/imports/core_imports.dart';

class ResponsiveButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const ResponsiveButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculating the dynamic width based on text length
        double dynamicWidth = MediaQuery.sizeOf(context).width * 0.1;
        final textWidth = (text.length * 18.0); // Assuming average character width is 10.0
        dynamicWidth = textWidth > dynamicWidth ? textWidth : dynamicWidth;

        return SizedBox(
          width: dynamicWidth,
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimaryColor, // Orange background
              foregroundColor: kcWhitecolor, // White text/icon color
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
            ),
            onPressed: onPressed,
            child: icon != null
                ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: getRegularStyle(
                    color: kcWhitecolor,
                  ),
                ),
                const SizedBox(width: 8.0),
                Icon(icon, color: kcWhitecolor,size: 18,),
              ],
            )
                : Text(
              text,
              style: getRegularStyle(
                color: kcWhitecolor,
              ),
            ),
          ),
        );
      },
    );

  }
}