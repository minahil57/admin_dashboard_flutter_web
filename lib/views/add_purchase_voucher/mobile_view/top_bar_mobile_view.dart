
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
           IconButton(onPressed: (){}, icon: const Icon(Icons.query_builder,
             semanticLabel: 'Query',
           ),),
            horizontalSpaceSmall,
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit,
              semanticLabel: 'Edit',
            ),
            ),
            horizontalSpaceSmall,
            IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline,
              semanticLabel: 'Add',
            ),),
          ],
        ),
      ],
    );
  }
}
