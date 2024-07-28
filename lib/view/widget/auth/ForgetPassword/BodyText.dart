import 'package:flutter/material.dart';

class bodyTextForget extends StatefulWidget {
  const bodyTextForget({super.key});

  @override
  State<bodyTextForget> createState() => _bodyTextForgetState();
}

class _bodyTextForgetState extends State<bodyTextForget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Please Enter Your\nEmail to Receive a Verification Code",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: "Sans",
            color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
