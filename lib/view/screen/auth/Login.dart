// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/functions/AlertExit.dart';
import 'package:frontendproject/view/screen/auth/ForgetPassword.dart';
import 'package:frontendproject/view/widget/auth/login/BodyText.dart';
import 'package:frontendproject/view/widget/auth/login/LoginButton.dart';
import 'package:frontendproject/view/widget/auth/login/SignUpLine.dart';
import 'package:frontendproject/view/widget/auth/login/TextField.dart';
import 'package:frontendproject/view/widget/auth/login/TopDesign.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.primarycolor,
        title: Text("Sign In",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: "Sans",
                color: Colors.white)),
        centerTitle: true,
      ),
      body: WillPopScope(child: ListView(
        children: [
          topDesign(),
          Container(
            color: ConstColors.primarycolor,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(120))),
            ),
          ),
          bodyText(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          textField(
              hinttext: "Eneter your Email",
              labeltext: "Email",
              iconData: Icons.email, 
              keyboardtype: TextInputType.emailAddress, showData: true,),
          textField(
              hinttext: "Eneter your Password",
              labeltext: "Password",
              iconData: Icons.password,
              keyboardtype: TextInputType.emailAddress, showData: true,),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => forgetPassword()));
                    },
                    child: Text("Forgot Password"))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          loginButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          signUpLine()
        ],
      ), onWillPop: alertExit),
    );
  }
}
