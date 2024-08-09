// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/Home/HomePage.dart';
import 'package:frontendproject/view/widget/auth/login/TextField.dart';

// ignore: must_be_immutable
class resetPassword extends StatefulWidget {
  String email;
  resetPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: "Sans",
                color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text("New Password",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    fontFamily: "Sans",
                    color: Colors.black)),
          ),
          textField(
            mycontroller: passwordController,
            hinttext: "Write Your Password",
            labeltext: "",
            iconData: Icons.password,
            keyboardtype: TextInputType.emailAddress,
            showData: false,
          ),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text("Confirm Password",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    fontFamily: "Sans",
                    color: Colors.black)),
          ),
          textField(
            hinttext: "Rewrite Your Password",
            labeltext: "",
            iconData: Icons.password,
            keyboardtype: TextInputType.emailAddress,
            showData: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: ConstColors.primarycolor,
                    borderRadius: BorderRadius.circular(30)),
                child: MaterialButton(
                  onPressed: () async {
                    var response = await HttpClientManager.client
                        .post(Urls.resetPassword(), body: {
                      "email": widget.email,
                      "new_password": passwordController.text
                    });
                    if (response.statusCode == 200) {
                      var loginresponse = await HttpClientManager.client
                          .post(Urls.loginUri(), body: {
                        "email": widget.email,
                        "password": passwordController.text
                      });
                      if(loginresponse.statusCode==200)
                      {
                        var data=json.decode(loginresponse.body);
                        String refreshToken=data["refresh"];
                        Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => homePage(refreshToken: refreshToken)));
                      }
                    }
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        fontFamily: "Sans",
                        color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
