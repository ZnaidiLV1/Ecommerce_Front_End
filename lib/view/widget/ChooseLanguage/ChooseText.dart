import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class chooseText extends StatefulWidget {
  const chooseText({super.key});

  @override
  State<chooseText> createState() => _chooseTextState();
}

class _chooseTextState extends State<chooseText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Choose Language",
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30,
            fontFamily: "pacifico",
            color: Colors.black),
      ),
    );
  }
}
