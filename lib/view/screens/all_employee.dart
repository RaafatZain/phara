
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/const/appcolor.dart';
import '../widgets/custom_text.dart';


class AllEmployees extends StatelessWidget {
  const AllEmployees({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
            padding: EdgeInsets.all(3.h),
            child: ListView(
              children: [
                Column(children: [
                  CustomText(
                    color: AppColor.color2,
                    text: 'All empolyees',
                    size: 18.sp,
                    wieght: FontWeight.bold,
                  )
                ]),
              ],
            )),
   
    );
  }
}