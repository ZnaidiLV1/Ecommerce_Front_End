import 'package:get/get.dart';

class All_items extends GetxController {
  List<String> all_items = [];
  void set_items(List<String> items) {
    all_items = items;
  }
  List<String> get get_all_items => all_items;
}
