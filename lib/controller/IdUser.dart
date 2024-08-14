import 'package:get/get.dart';

class IdUserController extends GetxController {
  String idUser = '';
  void updateIdUser(String newIdUser) {
    idUser = newIdUser;
  }
  String get getIdUser => idUser;
}