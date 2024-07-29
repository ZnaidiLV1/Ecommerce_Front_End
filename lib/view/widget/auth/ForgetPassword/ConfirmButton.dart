import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/auth/VerifyCode.dart';

// ignore: must_be_immutable
class confirmButton extends StatefulWidget {
  String email;
   confirmButton({super.key,required this.email});

  @override
  State<confirmButton> createState() => _confirmButtonState();
}

class _confirmButtonState extends State<confirmButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: ConstColors.primarycolor,
              borderRadius: BorderRadius.circular(15)),
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => verifyCode(email: widget.email,)));
            },
            child: Text(
              "Check",
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
