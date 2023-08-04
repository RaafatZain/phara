import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/model/best_selling.dart';
import 'package:pharma_man/test.dart';
import 'package:pharma_man/view/widgets/custom_back.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../model/product.dart';

class ProductDetails extends StatelessWidget {
  final BestSelling product;
  const ProductDetails({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        padding: EdgeInsets.all(3.h),
        child: ListView(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBack(),
                    // Stack(
                    //   children: [
                    //     Icon(
                    //       Icons.circle,
                    //       color: AppColor.color1,
                    //       size: 50,
                    //     ),
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           Icons.add,
                    //           size: 30,
                    //           color: AppColor.white,
                    //         )),
                    //   ],
                    // ),
                  ],
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.network(
                      'https://cdn0.iconfinder.com/data/icons/medical-4-color-shadow/128/pharmaceutical-drugs_medicines_pills_tablet_antibiotic-512.png'),
                ),
                const SizedBox(
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: product.productName,
                    size: 40,
                    fontFamily: 'Pacifico',
                    color: AppColor.black,
                    wieght: FontWeight.w400,
                    overflow: TextOverflow.fade,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(height: 5.h,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.color1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                        text: 'quantity =${product.quantity} ',
                        size: 20,
                        color: AppColor.white,
                        wieght: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.color1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                        text:
                            'Selling quantity : ${product.selling_quantity}',
                        size: 20,
                        color: AppColor.white,
                        wieght: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.color1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                        text: 'Price : ${product.price}\$ ',
                        size: 20,
                        overflow: TextOverflow.ellipsis,
                        color: AppColor.white,
                        wieght: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.color1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                 
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
