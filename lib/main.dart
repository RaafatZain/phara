import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharma_man/binding/initialbinding.dart';
import 'package:pharma_man/routes.dart';
import 'package:pharma_man/view/screens/auth/login.dart';
import 'package:pharma_man/view/screens/bar.dart';
import 'package:pharma_man/view/screens/home.dart';
import 'package:pharma_man/view/screens/main.dart';
import 'package:pharma_man/view/screens/post_supplier.dart';
import 'package:pharma_man/core/services/services.dart';
import 'package:pharma_man/test.dart';
import 'package:sizer/sizer.dart';
import 'core/const/routes.dart';
import 'controllers/auth/login_controller.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initialService(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: routes,
         home: MainScreen(),
      );
    });
  }
}
