// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/view/widget/itemTapped/BottomContainer.dart';
import 'package:frontendproject/view/widget/itemTapped/TopContainer.dart';

class Item_Tapped extends StatelessWidget {
  items item;
  Item_Tapped({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.secondcolor,
      body: SafeArea(
        child: Column(
          children: [TopContainer(item: item,), Spacer(), BottomConatainer(item: item,)],
        ),
      ),
    );
  }
}
