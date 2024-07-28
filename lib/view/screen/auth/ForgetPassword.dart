// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontendproject/view/widget/auth/ForgetPassword/BodyText.dart';
import 'package:frontendproject/view/widget/auth/ForgetPassword/ConfirmButton.dart';

import 'package:frontendproject/view/widget/auth/login/TextField.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget PAssword",
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
            child: Image.asset("images/forget_password-Photoroom.png"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          bodyTextForget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          textField(
              hinttext: "Enter Your Email",
              labeltext: "Email",
              iconData: Icons.email,
              mycontroller: emailController,
              keyboardtype: TextInputType.emailAddress, showData: true,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          confirmButton(
            email: emailController.text,
          ),
        ],
      ),
    );
  }
}
