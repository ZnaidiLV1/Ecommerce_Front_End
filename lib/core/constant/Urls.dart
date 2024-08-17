const String server = "http://10.0.2.2:8000/";

class Urls {
  static Uri loginUri() {
    return Uri.parse("${server}api/login/");
  }

  static Uri logoutUri() {
    return Uri.parse("${server}api/logout/");
  }

  static Uri createUserUri() {
    return Uri.parse("${server}api/createUser/");
  }

  static Uri sendVerificationCode() {
    return Uri.parse("${server}api/sendCode/");
  }

  static Uri verifyCode() {
    return Uri.parse("${server}api/verifyCode/");
  }

  static Uri resetPassword() {
    return Uri.parse("${server}api/reset_password/");
  }
  static Uri get_cat() {
    return Uri.parse("${server}app1/get_cat/");
  }
   static Uri create_cat() {
    return Uri.parse("${server}app1/create_cat/");
  }
  static Uri get_items(String item_cat) {
    return Uri.parse("${server}app1/${item_cat}-get_items/");
  }
  static Uri get_favorite(String id_user) {
    return Uri.parse("${server}app1/${id_user}-get_favorites/");
  }
  static Uri create_favorite() {
    return Uri.parse("${server}app1/create_favorite/");
  }
  static Uri delete_favorite() {
    return Uri.parse("${server}app1/delete_favorite/");
  }
  static Uri get_cat_favorite(String id_user,String item_cat) {
    return Uri.parse("${server}app1/${item_cat}-${id_user}-get_cat_favorite/");
  }
  static Uri get_items_cart(String id_user,) {
    return Uri.parse("${server}app1/${id_user}-get_carts/");
  }


}
