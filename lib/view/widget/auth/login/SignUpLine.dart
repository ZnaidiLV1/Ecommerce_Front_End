import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/auth/SignUp.dart';

class signUpLine extends StatefulWidget {
  const signUpLine({super.key});

  @override
  State<signUpLine> createState() => _signUpLineState();
}

class _signUpLineState extends State<signUpLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have An Account ?",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: "Sans",
                color: Colors.black)),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => signUp()));
            },
            child: Text("Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: "Sans",
                    color: ConstColors.primarycolor)),
          ),
        )
      ],
    );
  }
}
