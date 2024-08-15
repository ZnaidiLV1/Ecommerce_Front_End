// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Favorite.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Home.dart';

class homePage extends StatefulWidget {
  String refreshToken;
  homePage({
    Key? key,
    required this.refreshToken,
  }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

List widgets = [
  home(),
  Favorite(),
  Placeholder(),
  Placeholder(),
];

class _homePageState extends State<homePage> {
  void onTapped(index_tapped) {
    setState(() {
      index = index_tapped;
    });
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: ConstColors.primarycolor,
          unselectedItemColor: Colors.grey[500],
          iconSize: 28,
          onTap: onTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
