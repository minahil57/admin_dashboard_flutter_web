import 'package:getx_admin_panel/core/imports/core_imports.dart';

class SemiRoundedElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const SemiRoundedElevatedButton({super.key, 
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          verticalSpaceMedium,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: width, vertical: height),

              backgroundColor: kcPrimaryColor, // Background color
              foregroundColor: kcWhitecolor, // Foreground color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded edges
              ),
            ),
            onPressed: onPressed,
            child: Text(text),
          ),
        ],
      ),
    );
  }
}