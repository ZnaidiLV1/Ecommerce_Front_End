// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/widget/auth/login/TextField.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
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
              hinttext: "Write Your Password",
              labeltext: "",
              iconData: Icons.password,
              keyboardtype: TextInputType.emailAddress, showData: false,),
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
              keyboardtype: TextInputType.emailAddress, showData: false,),
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
                  onPressed: () {},
                  child: Text(
                    "Login",
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
