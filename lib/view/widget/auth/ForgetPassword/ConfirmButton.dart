import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/functions/CustumizedDialog.dart';
import 'package:frontendproject/view/screen/auth/VerfiyPassword.dart';

// ignore: must_be_immutable
class confirmButton extends StatefulWidget {
  String email;
  confirmButton({super.key, required this.email});

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
            onPressed: () async {
              var response = await HttpClientManager.client
                  .post(Urls.sendVerificationCode(), body: {
                "email": widget.email,
              });
              if ((response.statusCode == 200)) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => verifyPassword(
                          email: widget.email,
                        )));
              } else {
                custumizedDialog(
                    context, "Recheck the email", "email not found");
              }
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
