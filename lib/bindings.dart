import 'package:frontendproject/core/blocservice/Services.dart';
import 'package:frontendproject/core/localisation/ChangeLocal.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => myServices());
    Get.put<localeController>(localeController(), permanent: true);
  }
}