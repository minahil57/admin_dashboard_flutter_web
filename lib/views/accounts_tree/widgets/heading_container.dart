import '../../../core/imports/core_imports.dart';

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: kcWhitecolor,
        boxShadow: [
          BoxShadow(
            color:kcPrimaryColor,
            spreadRadius: 0.7,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('AccountName',style: getMediumStyle(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('AccountCode',style: getMediumStyle(

                ),),
                horizontalSpace(MediaQuery.sizeOf(context).width*0.065),
                Text('AccountBalance',style: getMediumStyle(),),
                horizontalSpaceLarge,
                horizontalSpaceMedium,
                Text('Accountlevel',style: getMediumStyle(),),
                horizontalSpaceMedium,
                Text('AccountStatus',style: getMediumStyle(),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}