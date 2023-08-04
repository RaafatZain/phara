
import 'package:flutter/material.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';




class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: CustomText(text: 'SalesScreen', size: 40, color: AppColor.mainColor, wieght: FontWeight.w900,overflow:TextOverflow.visible),
    ),
    );
  }
}