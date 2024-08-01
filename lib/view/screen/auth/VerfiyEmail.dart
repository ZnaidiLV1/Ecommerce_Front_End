// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/functions/CustumizedDialog.dart';
import 'package:frontendproject/view/widget/auth/anonyme/FirstPage.dart';

// ignore: must_be_immutable
class verifyEmail extends StatefulWidget {
  String email;
  String password;
  verifyEmail({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<verifyEmail> createState() => _verifyEmailState();
}

class _verifyEmailState extends State<verifyEmail> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Verify Your Email",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  fontFamily: "Sans",
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Image.asset("images/verifycode.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Text(
                "Please Enter The 4 Digit Number Sent To\n",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    fontFamily: "Sans",
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: ConstColors.primarycolor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) async {
                var response = await HttpClientManager.client
                    .post(Urls.verifyCode(), body: {
                  "email": widget.email,
                  "verification_code": verificationCode
                });
                if (response.statusCode == 200) {
                  var responseLogin = await HttpClientManager.client
                      .post(Urls.loginUri(), body: {
                    "email": widget.email,
                    "password": widget.password
                  });
                  if (responseLogin.statusCode == 200) {
                    var data = json.decode(responseLogin.body);
                    String refreshToken = data["refresh"];
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => firstPage(
                              refreshToken: refreshToken,
                            )));
                  }
                } else if (response.statusCode == 401) {
                  var codeResponse = await HttpClientManager.client
                      .post(Urls.sendVerificationCode(),
                      body: 
                      {
                        "email":widget.email
                      });
                  if (codeResponse.statusCode==200)
                  {
                    custumizedDialog(context, "Verfifcation code is wrong",
                      "The code will be resent");
                  }
                }
              },
            ),
          ],
        ));
  }
}
