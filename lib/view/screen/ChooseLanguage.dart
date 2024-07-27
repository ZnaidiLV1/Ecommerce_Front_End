// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendproject/view/widget/ChooseLanguage/ChooseText.dart';
import 'package:frontendproject/view/widget/ChooseLanguage/EnglishButton.dart';
import 'package:frontendproject/view/widget/ChooseLanguage/FrenchButton.dart';

class chooseLanguage extends StatefulWidget {
  const chooseLanguage({super.key});

  @override
  State<chooseLanguage> createState() => _chooseLanguageState();
}

class _chooseLanguageState extends State<chooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          chooseText(),
          englishButton(),
          frenchButton(),
        ],
      ),
    );
  }
}
