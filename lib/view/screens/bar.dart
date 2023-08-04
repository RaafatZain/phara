// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';

// import '../controllers/barcode_controller.dart';

// class ReadBarcode extends StatelessWidget {
//   ReadBarcode({Key? key}) : super(key: key);
//   final BacodeController controller = Get.put(BacodeController());
//   var height, width; 
//   @override 
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         body: Obx(() => Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     controller.barcode.value,
//                     style: TextStyle(color: Colors.blue, fontSize: 30),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       controller.scanBarcode();
//                     },
//                     icon: Icon(
//                       Icons.qr_code_scanner_sharp,
//                       size: 35,
//                     ),
//                   ),
//                   SizedBox(
//                     height: width,
//                   )
//                 ],
//               ),
//             )));
//   }
// }