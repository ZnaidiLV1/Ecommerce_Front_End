import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendproject/core/constant/colors.dart';

class frenchButton extends StatefulWidget {
  const frenchButton({super.key});

  @override
  State<frenchButton> createState() => _frenchButtonState();
}

class _frenchButtonState extends State<frenchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: ConstColors.primarycolor,
                borderRadius: BorderRadius.circular(15)),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "French",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    fontFamily: "pacifico",
                    color: Colors.white),
              ),
            ),
          );
  }
}