import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';

class topDesign extends StatefulWidget {
  const topDesign({super.key});

  @override
  State<topDesign> createState() => _topDesignState();
}

class _topDesignState extends State<topDesign> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  color: ConstColors.primarycolor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(80))),
            ),
            Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: Text("Welcom Back",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        fontFamily: "Sans",
                        color: Colors.white))),
          ]);
  }
}