import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/core/const/routes.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/controllers/post_supplier_controller.dart';
import 'package:pharma_man/model/test.dart';
import 'package:pharma_man/view/screens/auth/login.dart';
import 'package:pharma_man/view/widgets/card_supplier.dart';
import 'package:pharma_man/view/widgets/custom_back.dart';
import 'package:pharma_man/view/widgets/custom_button.dart';
import 'package:pharma_man/view/widgets/custom_icon_button.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';
import 'package:pharma_man/view/widgets/custom_text_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/connection_controller.dart';

class AllSuppliers extends StatelessWidget { 
  PostSupplierController controller = Get.put(PostSupplierController());
  LoginController controller2 = Get.find<LoginController>();
  //AllSuppliers({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
        child: ListView(
          children: [
            Column(
              children: [
                CustomText(
                    text: 'All suppliers',
                    size: 18.sp,
                    wieght: FontWeight.bold,
                    color: AppColor.color2),
                SizedBox(
                  height: 3.h,
                ),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.cards.length,
                    itemBuilder: (context, index) {
                      final card = controller.cards[index];

                      if (!controller2.isAdmin.value) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 3.h,
                            right: 3.h,
                            left: 3.h,
                            bottom: index == controller.cards.length - 1
                                ? 3.h
                                : 0.h,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                ListView(
                                  children: [
                                    Container(
                                      height: 75.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(4.h),
                                            topLeft: Radius.circular(4.h)),
                                        color: index % 2 == 0
                                            ? AppColor.color4
                                            : AppColor.color3,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            
                                            children: [
                                              
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              CustomText(
                                                  text: 'Address:',
                                                  size: 15.sp,
                                                  wieght: FontWeight.bold,
                                                  color: index % 2 == 0
                                                      ? AppColor.color1
                                                      : AppColor.color4),
                                                      SizedBox(width: 1.w,),
                                              Expanded(
                                                child: CustomText(
                                                    text: card.address.isEmpty
                                                        ? 'No address'
                                                        : '${card.address}',
                                                    size: 12.sp,
                                                   overflow: TextOverflow.ellipsis,
                                                    max: 2,
                                                    wieght: FontWeight.normal,
                                                    color: AppColor.grey),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2.h,),
                                          Row(
                                            
                                            children: [
                                              
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              CustomText(
                                                  text: 'Email:',
                                                  size: 15.sp,
                                                  wieght: FontWeight.bold,
                                                  color: index % 2 == 0
                                                      ? AppColor.color1
                                                      : AppColor.color4),
                                                      SizedBox(width: 1.w,),
                                              Expanded(
                                                child: CustomText(
                                                    text: card.email.isEmpty
                                                        ? 'No email'
                                                        : '${card.email}',
                                                    size: 12.sp,
                                                   overflow: TextOverflow.ellipsis,
                                                    max: 2,
                                                    wieght: FontWeight.normal,
                                                    color: AppColor.grey),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.h,),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                            child: Divider(color:index % 2 == 0
                                                        ? AppColor.color1
                                                        : AppColor.color4 ,
                                                        thickness: 0.5.h,),
                                          ),
                                          SizedBox(height: 1.h,),
                                          CustomText(
                                                  text: 'Description:',
                                                  size: 15.sp,
                                                  wieght: FontWeight.bold,
                                                  color: index % 2 == 0
                                                      ? AppColor.color1
                                                      : AppColor.color4),
                                                      SizedBox(height: 2.h,),
                                        Container(height: 30.h,
                                      
                                        width: 80.w,
                                      
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h),
                                                   boxShadow: [
                                  BoxShadow(
                                    offset: Offset.zero,
                                    blurRadius: 1.h,
                                    color: AppColor.black,
                                  ),],
                                    color:index % 2 == 0
                                                      ? AppColor.color1
                                                      : AppColor.color4,
                                                ),
                                                child: Center(child: Padding(
                                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                                  child: CustomText(
                                                      text: card.desc.isEmpty
                                                          ? 'No description'
                                                          : '${card.desc}',
                                                      size: 12.sp,
                                                     overflow: TextOverflow.ellipsis,
                                                      max: 2,
                                                      wieght: FontWeight.normal,
                                                      color: AppColor.grey),
                                                ),),
                                        )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.h),
                                color: index % 2 == 0
                                    ? AppColor.color4
                                    : AppColor.color3,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset.zero,
                                    blurRadius: 1.h,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                              height: 15.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 1.2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 1.h),
                                      CustomText(
                                        text: 'Name : ',
                                        size: 15.sp,
                                        wieght: FontWeight.bold,
                                        color: index % 2 == 0
                                            ? AppColor.color1
                                            : AppColor.color4,
                                      ),
                                      SizedBox(width: 1.h),
                                      Expanded(
                                        child: CustomText(
                                          text: '${card.name}',
                                          size: 13.sp,
                                          wieght: FontWeight.normal,
                                          color: AppColor.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 1.h),
                                      CustomText(
                                        text: 'Phone : ',
                                        size: 15.sp,
                                        wieght: FontWeight.bold,
                                        color: index % 2 == 0
                                            ? AppColor.color1
                                            : AppColor.color4,
                                      ),
                                      SizedBox(width: 1.h),
                                      Expanded(
                                        child: CustomText(
                                          text: '${card.phone}',
                                          size: 13.sp,
                                          wieght: FontWeight.normal,
                                          color: AppColor.grey,
                                        ),
                                      ),
                                      CustomIconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: index % 2 == 0
                                              ? AppColor.color1
                                              : AppColor.color4,
                                        ),
                                        onPressed: () {
                                          Get.offNamed(AppRoute.editSupplier);
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 1.h),
                                      CustomText(
                                        text: 'Company : ',
                                        size: 15.sp,
                                        wieght: FontWeight.bold,
                                        color: index % 2 == 0
                                            ? AppColor.color1
                                            : AppColor.color4,
                                      ),
                                      SizedBox(width: 1.h),
                                      Expanded(
                                        child: CustomText(
                                          text: '${card.company}',
                                          size: 13.sp,
                                          wieght: FontWeight.normal,
                                          color: AppColor.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Dismissible(
                          onDismissed: (direction) {
                            controller.delete(controller.id);
                          },
                          key: Key(card.name),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 3.h,
                              right: 3.h,
                              left: 3.h,
                              bottom: index == controller.cards.length - 1
                                  ? 3.h
                                  : 0.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  ListView(
                                    children: [
                                      // Bottom sheet content
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.h),
                                  color: index % 2 == 0
                                      ? AppColor.color4
                                      : AppColor.color3,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset.zero,
                                      blurRadius: 1.h,
                                      color: AppColor.black,
                                    ),
                                  ],
                                ),
                                height: 15.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 1.2.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 1.h),
                                        CustomText(
                                          text: 'Name : ',
                                          size: 15.sp,
                                          wieght: FontWeight.bold,
                                          color: index % 2 == 0
                                              ? AppColor.color1
                                              : AppColor.color4,
                                        ),
                                        SizedBox(width: 1.h),
                                        Expanded(
                                          child: CustomText(
                                            text: '${card.name}',
                                            size: 13.sp,
                                            wieght: FontWeight.normal,
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 1.h),
                                        CustomText(
                                          text: 'Phone : ',
                                          size: 15.sp,
                                          wieght: FontWeight.bold,
                                          color: index % 2 == 0
                                              ? AppColor.color1
                                              : AppColor.color4,
                                        ),
                                        SizedBox(width: 1.h),
                                        Expanded(
                                          child: CustomText(
                                            text: '${card.phone}',
                                            size: 13.sp,
                                            wieght: FontWeight.normal,
                                            color: AppColor.grey,
                                          ),
                                        ),
                                        CustomIconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: index % 2 == 0
                                                ? AppColor.color1
                                                : AppColor.color4,
                                          ),
                                          onPressed: () {
                                            Get.offNamed(AppRoute.editSupplier);
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 1.h),
                                        CustomText(
                                          text: 'Company : ',
                                          size: 15.sp,
                                          wieght: FontWeight.bold,
                                          color: index % 2 == 0
                                              ? AppColor.color1
                                              : AppColor.color4,
                                        ),
                                        SizedBox(width: 1.h),
                                        Expanded(
                                          child: CustomText(
                                            text: '${card.company}',
                                            size: 13.sp,
                                            wieght: FontWeight.normal,
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
