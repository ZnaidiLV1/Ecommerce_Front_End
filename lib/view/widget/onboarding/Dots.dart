import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/DotsController.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/data/datasource/static.dart';

class dots extends StatefulWidget {
  const dots({super.key});

  @override
  State<dots> createState() => _dotsState();
}

class _dotsState extends State<dots> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (BuildContext context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onboardingList.length,
                (index) => AnimatedContainer(
                      margin: EdgeInsets.only(right: 10),
                      duration: Duration(milliseconds: 900),
                      width: index == state.currentPage ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: ConstColors.primarycolor,
                          borderRadius: BorderRadius.circular(20)),
                    ))
          ],
        );
      },
    );
  }
}
