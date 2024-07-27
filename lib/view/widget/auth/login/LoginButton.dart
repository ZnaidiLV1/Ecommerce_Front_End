import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendproject/core/constant/colors.dart';

class loginButton extends StatefulWidget {
  const loginButton({super.key});

  get pageController => null;

  @override
  State<loginButton> createState() => _loginButtonState();
}

class _loginButtonState extends State<loginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: ConstColors.primarycolor,
              borderRadius: BorderRadius.circular(15)),
          child: MaterialButton(
            onPressed: () {
              
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  fontFamily: "Sans",
                  color: Colors.white),
            ),
          )),
    );
  }
}
