// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List names = ["Laptop", "Phones", "dress", "Cars", "Motos"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEEF8),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: ClipRRect(
                    child: Image.asset("images/logo.jpg"),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                  hintText: 'Find What You Want',
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 16.0), // Padding inside the TextFormField
                  suffixIcon: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: ConstColors.primarycolor,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(
                  fontFamily: "Sans",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              alignment: Alignment.topLeft,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6814,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 20,
                        left: MediaQuery.of(context).size.width * 0.04),
                    height: MediaQuery.of(context).size.width * 0.06,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            child: Text(
                              names[index],
                              style: TextStyle(
                                fontSize: isSelected ? 18 : 16,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              print(names[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.628,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
