// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/auth/ResetPassword.dart';

// ignore: must_be_immutable
class verifyEmail extends StatefulWidget {
  verifyEmail({super.key,});

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
              numberOfFields: 4,
              borderColor: ConstColors.primarycolor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => resetPassword()));
              },
            ),
          ],
        ));
  }
}
