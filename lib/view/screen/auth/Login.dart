import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/LoadingController.dart';
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
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    print("Login widget disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingController(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColors.primarycolor,
          title: Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              fontFamily: "Sans",
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: WillPopScope(
          onWillPop: alertExit,
          child: ListView(
            children: [
              topDesign(),
              Container(
                color: ConstColors.primarycolor,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(120),
                    ),
                  ),
                ),
              ),
              bodyText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              textField(
                mycontroller: emailcontroller,
                hinttext: "Enter your Email",
                labeltext: "Email",
                iconData: Icons.email,
                keyboardtype: TextInputType.emailAddress,
                showData: true,
              ),
              textField(
                mycontroller: passwordcontroller,
                hinttext: "Enter your Password",
                labeltext: "Password",
                iconData: Icons.password,
                keyboardtype: TextInputType.emailAddress,
                showData: false,
              ),
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
                          builder: (context) => forgetPassword(),
                        ));
                      },
                      child: Text("Forgot Password"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              loginButton(
                emailField: emailcontroller,
                passwordField: passwordcontroller,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              signUpLine(),
            ],
          ),
        ),
      ),
    );
  }
}
