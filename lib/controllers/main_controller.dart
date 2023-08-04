import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/view/screens/alarm.dart';
import 'package:pharma_man/view/screens/all_suppliers.dart';
import 'package:pharma_man/view/screens/get_invoice.dart';

import '../view/screens/debt.dart';
import '../view/screens/home.dart';
import '../view/screens/main_sale.dart';

class MainController extends GetxController {
 
// RxInt currentIndexNav = 0.obs;
  RxInt currentIndexCarousel = 0.obs;
// Widget getSelectedWidget({required int index}) {
//   Widget widget;
//   switch (index) {
//     case 0:
//       widget = HomePage();
//       break;
//     case 1:
//       widget = const DebtScreen();
//       break;
//     case 2:
//       widget = const GetSuppliersScreen();
//       break;
//     case 3:
//       widget = const AlarmScreen();
//       break;
//     default:
//       widget = HomePage();
//       break;
//   }
//   return widget;
// }
  
  final List<Widget> pages = [
    HomePage(),
    MainSale(),
    GetInvoiceScreen(),
    DebtScreen(),
    AlarmScreen(),
  ];
  final List<Widget> pages2 = [
    HomePage(),
    MainSale(),
    GetInvoiceScreen(),
    AlarmScreen(),
  ];
  final selectedIndex = RxInt(0);
}
