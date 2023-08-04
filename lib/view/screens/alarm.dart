import 'package:flutter/material.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        padding: EdgeInsets.all(3.h),
        child: 
         ListView(
          children: [
              Column(
                children: [
                CustomText(text: 'Notifications', size: 18.sp, wieght: FontWeight.bold, color: AppColor.color2),
              ],)
         ],)
      ,)
    );
  }
}