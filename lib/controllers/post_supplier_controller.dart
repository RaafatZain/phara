import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/core/const/routes.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/view/screens/all_suppliers.dart';
import 'package:pharma_man/view/screens/auth/login.dart';
import 'package:pharma_man/test.dart';
import 'package:pharma_man/view/widgets/card_supplier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../core/const/api.dart';

class PostSupplierController extends GetxController {
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController phone;
  late final TextEditingController address;
  late final TextEditingController company;
  late final TextEditingController desc;
  late final int id;
  RxList<CardSup> cards = <CardSup>[].obs;



  var editedSupplier = CardSup(
    id: 0,
    name: '',
    company: '',
    email: '',
    phone: '',
    address: '',
    desc: '',
  ).obs;

  void removeSupplier(CardSup cardRemove) {
    cards.remove(cardRemove);
  }

  void addCard({
    required String name,
    required String email,
    required String address,
    required String phone,
    required String company,
    required String desc,
  }) {
    final card = CardSup(
      name: name,
      address: address,
      company: company,
      desc: desc,
      email: email,
      phone: phone,
      id: id,
    );
    cards.add(card);
  }

  void clearTextFields() {
    name.clear();
    email.clear();
    phone.clear();
    company.clear();
    desc.clear();
    address.clear();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<bool> add(
    String name,
    String email,
    String phone,
    String address,
    String company,
    String desc,
  ) async {
    try {
      // Existing code...
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        SharedPreferences sh = await SharedPreferences.getInstance();
        String? token = sh.getString('signup');

        // int? id = sh.getInt('id');
        isLoading.value = true;

        var headers = <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };
        isLoading.value = true;
        var body = <String, String>{
          'name': name,
          'phone': phone,
          'company': company,
        };

        if (email.isNotEmpty) {
          body['email'] = email;
        }

        if (address.isNotEmpty) {
          body['address'] = address;
        }

        if (desc.isNotEmpty) {
          body['description'] = desc;
        }

        var response = await http.post(Uri.parse('${Api}add-supplier'),
            headers: headers, body: body);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          isLoading.value = false;
          getId(responseBody['data']['attributes']['id']);
          getId2(responseBody['data']['attributes']['id']);
          print(
              '====================================${responseBody['data']['attributes']['id']}');
          Get.offNamed(AppRoute.allsuppliers);

          return true;
        } else {
          isLoading.value = false;
          Get.snackbar('Error', 'Something went wrong',
              padding: EdgeInsets.all(2.h),
              backgroundColor: Color.fromARGB(255, 245, 113, 103),
              snackPosition: SnackPosition.BOTTOM);
          return false;
        }
      }
    } catch (e) {
      print(e);
      var isConnected = await InternetConnectionChecker().hasConnection;
      if (!isConnected) {
        Get.snackbar(
          'No internet connection',
          'Please check your internet connection and try again',
          backgroundColor: Color.fromARGB(255, 245, 113, 103),
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;
      }
      return false;
    }
    return false;
  }

  Future<void> delete(int supid) async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      int? id = sh.getInt('Delete-suppliers');
      String? token = sh.getString('signup');
      var headers = <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await http.delete(
        Uri.parse('${Api}Delete-suppliers/$id'),
        headers: headers,
      );
      print(
          '${response.statusCode}==============================================');
      if (response.statusCode == 200 || response.statusCode == 201) {
        CardSup supplierToRemove = cards.firstWhere((card) => card.id == supid);
        cards.remove(supplierToRemove);
        Get.snackbar(
          'Success',
          'Supplier deleted successfully',
          padding: EdgeInsets.all(2.h),
          backgroundColor: Color.fromARGB(255, 153, 247, 156),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete supplier',
          padding: EdgeInsets.all(2.h),
          backgroundColor: Color.fromARGB(255, 245, 113, 103),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    }
  }

 

  Future<void> updateNote(int idd, String name, String email, String phone,
  String address, String desc, String company) async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String? token = sh.getString('signup');
      int? id = sh.getInt('Update-supplier');
      var headers = <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var body = <String, String>{
        'name': name,
        'address': address,
      };
      if (email.isNotEmpty) {
        body['email'] = email;
      }
      if (phone.isNotEmpty) {
        body['phone'] = phone;
      }
      if (company.isNotEmpty) {
        body['company'] = company;
      }
      if (desc.isNotEmpty) {
        body['description'] = desc;
      }
      final response = await http.post(Uri.parse('${Api}Update-supplier/$id'),
          body: body, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        int index = cards.indexWhere((supplier) => supplier.id == idd);
        if (index != -1) {
          cards[index].name = name;
          cards[index].address = address;
          cards[index].phone = phone;
          cards[index].company = company;
          cards[index].email = email;
          cards[index].desc = desc;
        }
        update();
        Get.snackbar('Success', 'Supplier updated successfully',
            padding: EdgeInsets.all(2.h),
            backgroundColor: Color.fromARGB(255, 153, 247, 156),
            snackPosition: SnackPosition.TOP);
      } else {
        // Handle error response
        Get.snackbar(
          'Error',
          'Failed to update note',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle network or server error
      Get.snackbar('Error', 'An error occurred');
    }
  }

  getId(int id) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    await sh.setInt('Update-supplier', id);
  }

   getId2(int id) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    await sh.setInt('Delete-suppliers', id);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    company = TextEditingController();
    desc = TextEditingController();
    id = 0;
    super.onInit();
  }
}
