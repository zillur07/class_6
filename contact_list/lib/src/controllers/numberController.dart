import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberController extends GetxController {
  // // final name = 'Rokon'.obs;
  // // final color = Colors.brown.obs;
  // // final isGreen = false.obs;
  // final isOnline = false.obs;
  // final yourSubject = true.obs;
  // // changeName() async {
  // //   // await Future.delayed(Duration(seconds: 3));
  // //   // name.value = 'Uzzal sharif';
  // //   // color.value = Colors.pink;
  // // }
  // manageColor() async {
  //   // await Future.delayed(
  //   //   Duration(seconds: 3),
  //   // );
  //   isOnline.toggle();
  // }

  // manageSubject() async {
  //   // await Future.delayed(
  //   //   Duration(seconds: 3),
  //   // );

  //   yourSubject.toggle();
  // }
  final contactList = [].obs;
  final name = ''.obs;

  addName() {
    contactList.add(name.value);
  }

  // addName(name) {
  //   contactList.add(name);
  // }

  addNumber(number) {
    contactList.add(number);
  }

  deleteContact(name) {
    Get.defaultDialog(middleText: 'Are you sure', actions: [
      // ignore: deprecated_member_use
      FlatButton(
        color: Colors.grey,
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cencal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      FlatButton(
        color: Colors.red,
        onPressed: () {
          contactList.remove(name);
          Get.back();
        },
        child: Text(
          'Confirm',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
