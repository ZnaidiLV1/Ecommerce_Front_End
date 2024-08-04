// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/LoadingController.dart';

import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/auth/VerfiyEmail.dart';

// ignore: must_be_immutable
class signUpButton extends StatefulWidget {
  String emailField;
  String passwordField;
  String phoneField;
  String usernameField;
  signUpButton({
    Key? key,
    required this.emailField,
    required this.passwordField,
    required this.phoneField,
    required this.usernameField,
  }) : super(key: key);

  @override
  State<signUpButton> createState() => _signUpButtonState();
}

class _signUpButtonState extends State<signUpButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: ConstColors.primarycolor,
              borderRadius: BorderRadius.circular(15)),
          child: BlocBuilder<LoadingController, LoadingState>(
            builder: (BuildContext context, state) {
              if (state is LoadingInProgress) {
                return CircularProgressIndicator();
              } else {
                return MaterialButton(
                  onPressed: () async {
                    try {
                      context.read<LoadingController>().add(StartLoading());
                      var response = await HttpClientManager.client
                          .post(Urls.createUserUri(), body: {
                        "email": widget.emailField,
                        "username": widget.usernameField,
                        "phoneNumber": widget.phoneField,
                        "password": widget.passwordField
                      });
                      print("test");
                      if (response.statusCode == 200) {
                        var responseCreation = await HttpClientManager.client
                            .post(Urls.sendVerificationCode(), body: {
                          "email": widget.emailField,
                        });
                        if (responseCreation.statusCode == 200) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => verifyEmail(
                                        email: widget.emailField,
                                        password: widget.passwordField,
                                      )));
                        }
                      }
                    } catch (e) {
                      // Handle network or other errors
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("An error occurred: $e"),
                      ));
                    } finally {
                      context.read<LoadingController>().add(StopLoading());
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        fontFamily: "Sans",
                        color: Colors.white),
                  ),
                );
              }
            },
          )),
    );
  }
}
