// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/LoadingController.dart';

import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/functions/CustumizedDialog.dart';
import 'package:frontendproject/view/widget/auth/anonyme/FirstPage.dart';

// ignore: must_be_immutable
class loginButton extends StatefulWidget {
  String emailField;
  String passwordField;
  loginButton({
    Key? key,
    required this.emailField,
    required this.passwordField,
  }) : super(key: key);

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
            onPressed: () async {
              context.read<LoadingController>().add(startLoading());

              
                var response = await HttpClientManager.client.post(
                  Urls.loginUri(),
                  body: {
                    "email": widget.emailField,
                    "password": widget.passwordField,
                  },
                );

               
                  context.read<LoadingController>().add(stopLoading());
                  if (response.statusCode == 200) {
                    var responseData = json.decode(response.body);
                    var refreshToken = responseData["refresh"];
                    
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            firstPage(refreshToken: refreshToken),
                      ),
                    );
                  } else if (response.statusCode == 401) {
                    custumizedDialog(
                      context,
                      "Authentication Error",
                      "Incorrect email or password. Please try again.",
                    );
                  } else {
                    print('Failed to login: ${response.statusCode}');
                    print('Response body: ${response.body}');
                  }
                
              
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
