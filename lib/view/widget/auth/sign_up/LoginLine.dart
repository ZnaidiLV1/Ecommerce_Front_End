import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/auth/login.dart';

class loginLine extends StatefulWidget {
  const loginLine({super.key});

  @override
  State<loginLine> createState() => _loginLineState();
}

class _loginLineState extends State<loginLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You Have An Account ?",
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
                  MaterialPageRoute(builder: (context) => login()));
            },
            child: Text("Sign In",
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
