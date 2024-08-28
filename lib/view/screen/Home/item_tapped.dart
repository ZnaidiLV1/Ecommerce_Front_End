// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/view/widget/itemTapped/BottomContainer.dart';
import 'package:frontendproject/view/widget/itemTapped/TopContainer.dart';

class Item_Tapped extends StatelessWidget {
  items item;
  bool like_button_bool;
  Item_Tapped({
    Key? key,
    required this.item,
    required this.like_button_bool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.secondcolor,
      body: SafeArea(
        child: Column(
          children: [
            TopContainer(
              item: item, like_button_bool: like_button_bool,
            ),
            Spacer(),
            BottomConatainer(
              item: item,
            )
          ],
        ),
      ),
    );
  }
}
