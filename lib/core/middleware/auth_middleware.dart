import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/view/screens/auth/login.dart';

import '../const/routes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sh.getString('logi') == '1') {
      return const RouteSettings(name: AppRoute.mainScreen);
    }
    return null;
  }
}
