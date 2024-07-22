import 'package:getx_admin_panel/widgets/semiRounded_button.dart';

import '../../../core/imports/core_imports.dart';

class TopBarAddPurchaseVoucher extends StatelessWidget {
  const TopBarAddPurchaseVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Voucher',
          style: getMediumStyle(fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ResponsiveButton(
              text: 'Query',
              onPressed: () {},
            ),
            horizontalSpaceMedium,
            ResponsiveButton(
              text: 'Edit',
              onPressed: () {},
              icon: Icons.edit,
            ),
            horizontalSpaceMedium,
            ResponsiveButton(
              text: 'Add New',
              onPressed: () {},
              icon: Icons.add_circle_outline_sharp,
            ),
          ],
        ),
      ],
    );
  }
}
