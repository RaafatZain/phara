import 'package:get/get.dart';

import '../../controllers/post_supplier_controller.dart';

class CardSup {
  String name;
  String email;
  String phone;
  String company;
  String desc;
  String address;
  int id;

  CardSup(
      {required this.name,
      required this.email,
      required this.address,
      required this.company,
      required this.desc,
      required this.phone,
      required this.id,
      });
       void updatee() {
           Get.find<PostSupplierController>().update(); // Call refresh() from GetX
  }
}
