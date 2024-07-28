import 'package:flutter/material.dart';
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
      body: ListView(
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
              hinttext: "Eneter your Username",
              labeltext: "Username",
              iconData: Icons.person,
              keyboardtype: TextInputType.text, showData: true,),
          textField(
              hinttext: "Eneter your Phone",
              labeltext: "Phone",
              iconData: Icons.phone,
              keyboardtype: TextInputType.number, showData: true,),
          textField(
              hinttext: "Eneter your Email",
              labeltext: "Email",
              iconData: Icons.email,
              keyboardtype: TextInputType.emailAddress, showData: true,),
          textField(
              hinttext: "Eneter your Password",
              labeltext: "Password",
              iconData: Icons.password,
              keyboardtype: TextInputType.emailAddress, showData: false,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          signUpButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          loginLine()
        ],
      ),
    );
  }
}
