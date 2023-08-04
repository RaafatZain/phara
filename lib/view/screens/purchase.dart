
import 'package:flutter/material.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';





class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
      child: Container( 
        height: 30,
        width: 90,
        color: AppColor.black,
        child: CustomText(text: 'PurchasesScreen',size: 40, color: AppColor.mainColor, wieght: FontWeight.w900,overflow: TextOverflow.visible, )),
                
    ),
    );
  }
}