import 'package:flutter/material.dart';
import 'package:pharma_man/core/const/appcolor.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
   CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(onPressed: onPressed, child: Text(text,style: TextStyle(color: AppColor.color2),));
  }
}
