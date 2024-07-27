import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';

class topDesginSignUp extends StatefulWidget {
  const topDesginSignUp({super.key});

  @override
  State<topDesginSignUp> createState() => _topDesginSignUpState();
}

class _topDesginSignUpState extends State<topDesginSignUp> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.099,
        decoration: BoxDecoration(
            color: ConstColors.primarycolor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(80))),
      ),
      Container(
          alignment: Alignment.center,
          child: Text("Welcome",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 45,
                  fontFamily: "Sans",
                  color: Colors.white))),
    ]);
  }
}
