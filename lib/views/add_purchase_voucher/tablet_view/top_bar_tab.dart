import 'package:getx_admin_panel/widgets/semiRounded_button.dart';

import '../../../core/imports/core_imports.dart';

class TopBarAddPurchaseVoucherTabView extends StatelessWidget {
  const TopBarAddPurchaseVoucherTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Voucher',
          style: getMediumStyle(fontSize: 18),
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
            ),
            horizontalSpaceMedium,
            ResponsiveButton(
              text: 'Add New',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
