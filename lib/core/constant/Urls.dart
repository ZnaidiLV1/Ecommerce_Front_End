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
  static Uri get_quantity_list(String id_user,) {
    return Uri.parse("${server}app1/${id_user}-get_quantity_list/");
  }
  static Uri cart_add_quantity() {
    return Uri.parse("${server}app1/cart_add_quantity/");
  }
  static Uri cart_remove_quantity() {
    return Uri.parse("${server}app1/cart_remove_quantity/");
  }
  static Uri get_all_carts(String idUser) {
    return Uri.parse("${server}app1/${idUser}-get_all_carts/");
  }
  static Uri item_add_quantity() {
    return Uri.parse("${server}app1/item_add_quantity/");
  }
  static Uri item_remove_quantity() {
    return Uri.parse("${server}app1/cart_remove_quantity/");
  }
   static Uri delete_cart() {
    return Uri.parse("${server}app1/delete_cart/");
  }
  static Uri is_in_cart(String cart_user,String cart_item) {
    return Uri.parse("${server}app1/${cart_user}-${cart_item}-is_in_cart/");
  }

  static Uri add_in_market() {
    return Uri.parse("${server}app1/create_cart/");
  }

  static Uri get_all_items() {
    return Uri.parse("${server}app1/get_all_items/");
  }

  static Uri get_item(String name) {
    return Uri.parse("${server}app1/${name}-get_item/");
  }

}
