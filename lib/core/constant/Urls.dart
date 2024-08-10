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
}
