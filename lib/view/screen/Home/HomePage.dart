// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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

List widgets = [home()];

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
    );
  }
}
