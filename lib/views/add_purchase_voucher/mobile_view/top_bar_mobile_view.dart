import 'package:getx_admin_panel/widgets/semiRounded_button.dart';

import '../../../core/imports/core_imports.dart';

class TopBarAddPurchaseVoucherMobileView extends StatelessWidget {
  const TopBarAddPurchaseVoucherMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Voucher',
          style: getMediumStyle(fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           IconButton(onPressed: (){}, icon: Icon(Icons.query_builder,
             semanticLabel: 'Query',
           ),),
            horizontalSpaceSmall,
            IconButton(onPressed: (){}, icon: Icon(Icons.edit,
              semanticLabel: 'Edit',
            ),
            ),
            horizontalSpaceSmall,
            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline,
              semanticLabel: 'Add',
            ),),
          ],
        ),
      ],
    );
  }
}
