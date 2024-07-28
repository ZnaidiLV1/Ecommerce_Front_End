import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExit() {
   Get.defaultDialog(
      title: "Alert",
      middleText: "Do You Want To Exit",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("Confirm")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel")),
      ]);
  return Future.value(true);
}
