import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharma_man/controllers/categories_controller.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/model/categories.dart';
import 'package:pharma_man/model/purchase.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

class CardCategories extends StatelessWidget {
  CardCategories({ Key? key}) : super(key: key);
  final Catergores controller = Get.put(Catergores());
  //final Categories? cat;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: controller.getCategories(),
          builder: (context, AsyncSnapshot snapshot) {
            Categories? data = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColor.color2, AppColor.color3, AppColor.color4],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                height: 5.5.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.data!.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),

                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  getColor(Color(0xFF67EACA), Colors.white),
                              backgroundColor:
                                  getColor(Colors.white, Color(0xFF67EACA)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.grey),
                                ),
                              ),
                              overlayColor:
                                  getColor(Colors.white10, Color(0xFF67EACA))),
                          onPressed: () {
                            controller.id!.value =data.data![index].attributes.id ;
                            print(controller.id!.value);
                            // controller.col = AppColor.red1 ;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Center(
                                child: CustomText(
                              text:
                                  data.data![index].attributes.name.toString(),
                              size: 20,
                              color: AppColor.grey,
                              wieght: FontWeight.normal,
                            )),
                          ),
                        ),
                        //  )
                      );
                    }),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColor.color1,
              ));
            }
          }),
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}
