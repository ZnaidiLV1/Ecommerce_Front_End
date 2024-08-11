import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';

class top extends StatefulWidget {
  const top({super.key});

  @override
  State<top> createState() => _topState();
}

class _topState extends State<top> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Icon(
                  Icons.menu,
                  color: ConstColors.primarycolor,
                  size: 40,
                )),
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
          padding: EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: MediaQuery.of(context).size.width * 0.15),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
              ),
              hintText: 'Find What You Want',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: ConstColors.primarycolor,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Icon(Icons.search, color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
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
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.width * 0.06),
          alignment: Alignment.topLeft,
          child: Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ),
      ],
    );
  }
}
