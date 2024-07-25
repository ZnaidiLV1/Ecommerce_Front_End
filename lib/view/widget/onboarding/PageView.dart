import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/DotsController.dart';
import 'package:frontendproject/data/datasource/static.dart';

class pageView extends StatelessWidget {
  final PageController pageController;
  pageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
        onPageChanged: (int index) {
          context.read<PageBloc>().add(pageChanged(index));
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Text(
                  onboardingList[i].title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'pacifico'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset(
                      onboardingList[i].photo!,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(onboardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      fontFamily: 'pacifico',
                    )),
              ],
            ));
  }
}
