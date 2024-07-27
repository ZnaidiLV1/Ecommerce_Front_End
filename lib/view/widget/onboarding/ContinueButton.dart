// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/DotsController.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/data/datasource/static.dart';
import 'package:frontendproject/view/screen/auth/login.dart';

class ContinueButton extends StatefulWidget {
  final PageController pageController;
  ContinueButton({super.key, required this.pageController});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: ConstColors.primarycolor,
          borderRadius: BorderRadius.circular(15)),
      child: BlocBuilder<PageBloc, PageState>(
        builder: (BuildContext context, state) {
          return MaterialButton(
            onPressed: () {
              final currentPage = state.currentPage;
              int nextPage = currentPage + 1;
              if (nextPage < onboardingList.length) {
                widget.pageController.animateToPage(nextPage,
                    duration: Duration(seconds: 1), curve: Curves.easeInOut);
                context.read<PageBloc>().add(pageChanged(nextPage));
              } else {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => login()));
              }
            },
            child: Text(
              "Continue",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  fontFamily: "pacifico",
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
