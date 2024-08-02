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
}
