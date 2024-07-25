// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontendproject/view/widget/onboarding/ContinueButton.dart';
import 'package:frontendproject/view/widget/onboarding/Dots.dart';
import 'package:frontendproject/view/widget/onboarding/PageView.dart';

class onboarding extends StatefulWidget {
   onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(flex: 3, child: pageView(pageController: pageController,)),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  dots(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  ContinueButton(pageController: pageController,),
                ],
              )),
        ]),
      ),
    );
  }
}
