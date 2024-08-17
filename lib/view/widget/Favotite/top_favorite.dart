// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class top_favorite extends StatelessWidget {
  String title;
  String sub_title;
  top_favorite({
    Key? key,
    required this.title,
    required this.sub_title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.menu,
                color: Colors.grey[400],
                size: 40,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.22,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset("images/logo.jpg"),
              ),
            ),
          ],
        ),
        Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
          alignment: Alignment.topLeft,
          child: Text(
            sub_title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
