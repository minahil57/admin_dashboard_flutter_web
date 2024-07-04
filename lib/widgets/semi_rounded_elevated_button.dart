import 'package:getx_admin_panel/core/imports/core_imports.dart';

class SemiRoundedElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SemiRoundedElevatedButton({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          verticalSpaceSmall,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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