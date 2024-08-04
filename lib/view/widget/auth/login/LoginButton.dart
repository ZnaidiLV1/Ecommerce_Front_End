import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/LoadingController.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/functions/CustumizedDialog.dart';
import 'package:frontendproject/view/widget/auth/anonyme/FirstPage.dart';

class loginButton extends StatefulWidget {
  TextEditingController emailField;
  TextEditingController passwordField;
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
          borderRadius: BorderRadius.circular(15),
        ),
        child: BlocBuilder<LoadingController, LoadingState>(
          builder: (context, state) {
            if (state is LoadingInProgress) {
              return CircularProgressIndicator();
            } else {
              return MaterialButton(
                onPressed: () async {
                  print("Button pressed, starting login");
                  context.read<LoadingController>().add(StartLoading());

                  try {
                    var response = await HttpClientManager.client.post(
                      Urls.loginUri(),
                      body: {
                        "email": widget.emailField.text,
                        "password": widget.passwordField.text,
                      },
                    );
                    if (!mounted) {
                      print('Widget is no longer mounted');
                      return;
                    }
                    print("response");
                    context.read<LoadingController>().add(StopLoading());

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
                  } catch (e) {
                    print("Error during HTTP request: $e");
                  } finally {
                    if (mounted) {
                      context.read<LoadingController>().add(StopLoading());
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    fontFamily: "Sans",
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
