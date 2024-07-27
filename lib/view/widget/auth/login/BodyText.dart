import 'package:flutter/material.dart';

class bodyText extends StatefulWidget {
  const bodyText({super.key});

  @override
  State<bodyText> createState() => _bodyTextState();
}

class _bodyTextState extends State<bodyText> {
  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            child: Text(
              "Sign In With Email \n & Password",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: "Sans",
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          );
  }
}