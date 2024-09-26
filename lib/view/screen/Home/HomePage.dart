// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Favorite.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Home.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Market.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Settings.dart';

class homePage extends StatefulWidget {
  String refreshToken;
  homePage({
    Key? key,
    required this.refreshToken,
  }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

List<Widget> widgets = [
  home(),
  Favorite(),
  Market(),
  Settings(),
];

class _homePageState extends State<homePage> {
  int index = 0;

  void onTapped(int index_tapped) {
    setState(() {
      index = index_tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ConvexAppBar(
          backgroundColor: Color(0xFFE5F7FA),
          activeColor: Colors.grey[700],
          color: Colors.grey[700],
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.favorite, title: 'Favorite'),
            TabItem(icon: Icons.store, title: 'Market'),
            TabItem(
              icon: Icons.settings,
              title: 'Settings',
            ),
          ],
          onTap: onTapped,
          initialActiveIndex: index,
        ),
      ),
    );
  }
}
