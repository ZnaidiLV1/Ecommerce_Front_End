import 'package:flutter/widgets.dart';
import 'package:frontendproject/core/blocservice/Services.dart';
import 'package:get/get.dart';

class localeController extends GetxController {
  Locale? language;
  late myServices mySer;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    mySer.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();
    mySer = Get.find<myServices>();
    String? x = mySer.sharedPreferences.getString("lang");
    if (x == "fr") {
      language = Locale("fr");
    } else if (x == "en") {
      language = Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
