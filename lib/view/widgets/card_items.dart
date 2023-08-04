
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'package:pharma_man/controllers/best_selling_controller.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/view/screens/product_details.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final BestSellingController controller = Get.put(BestSellingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Padding(
          padding: EdgeInsets.only(top: 130),
          child: CircularProgressIndicator(
            color: AppColor.color1,
          ),
        );
      } else {
        return Column(
          children: [
            CustomText(text: 'Best Selling Products', size: 25, wieght: FontWeight.normal, color: AppColor.black ,fontFamily: 'Pacifico',),
            Container(
              height:25.h,
              width: MediaQuery.of(context).size.width,
              child: ListWheelScrollViewX(
             
                scrollDirection: Axis.horizontal,
                squeeze: 1.5,
                offAxisFraction: -0.01,
                itemExtent: 200,
              //   diameterRatio: 0.7, 
                children: List.generate(controller.productList.length, (index) {
                  return buildCardItems(
                    name: controller.productList[index].productName,
                    ontap: () {
                      Get.to(
                        () => ProductDetails(
                          product: controller.productList[index],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        );
      }
    });
  }
}

Widget buildCardItems({
  required String name,
  required Function() ontap,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 40,right:30,bottom: 25),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 16.5.h,
             width: 34.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: ontap,
            child: Container(
              height: 16.h,
              width: 16.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.white,
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 12.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        'https://cdn0.iconfinder.com/data/icons/medical-4-color-shadow/128/pharmaceutical-drugs_medicines_pills_tablet_antibiotic-512.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Expanded(
                    child: Container(
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: name,
                        size: 20,
                        color: AppColor.black,
                        wieght: FontWeight.w900,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
