// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/LoadingController.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/widget/auth/login/TextField.dart';
import 'package:frontendproject/view/widget/auth/sign_up/LoginLine.dart';
import 'package:frontendproject/view/widget/auth/sign_up/SignUpButton.dart';
import 'package:frontendproject/view/widget/auth/sign_up/TopDesignSignUp.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LoadingController>().add(StopLoading());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.primarycolor,
        title: Text("Sign Up",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: "Sans",
                color: Colors.white)),
        centerTitle: true,
      ),
      body: BlocProvider(create:(context) => LoadingController(),
      
      child:  ListView(
              children: [
                topDesginSignUp(),
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
                textField(
                  mycontroller: username,
                  hinttext: "Eneter your Username",
                  labeltext: "Username",
                  iconData: Icons.person,
                  keyboardtype: TextInputType.text,
                  showData: true,
                ),
                textField(
                  mycontroller: phoneNumber,
                  hinttext: "Eneter your Phone",
                  labeltext: "Phone",
                  iconData: Icons.phone,
                  keyboardtype: TextInputType.number,
                  showData: true,
                ),
                textField(
                  mycontroller: email,
                  hinttext: "Eneter your Email",
                  labeltext: "Email",
                  iconData: Icons.email,
                  keyboardtype: TextInputType.emailAddress,
                  showData: true,
                ),
                textField(
                  mycontroller: password,
                  hinttext: "Eneter your Password",
                  labeltext: "Password",
                  iconData: Icons.password,
                  keyboardtype: TextInputType.emailAddress,
                  showData: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                signUpButton(
                  emailField: email.text,
                  passwordField: password.text,
                  phoneField: phoneNumber.text,
                  usernameField: username.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                loginLine()
              ],
            ),)
    );
  }
}
