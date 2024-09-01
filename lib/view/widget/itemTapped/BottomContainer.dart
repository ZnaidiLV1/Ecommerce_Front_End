// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, sort_child_properties_last
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';

class BottomConatainer extends StatelessWidget {
  items item;
  bool item_added;
  BottomConatainer({
    Key? key,
    required this.item,
    required this.item_added,
  }) : super(key: key);
  int price_after_discount(int price, int discount) {
    return price - (price * discount) ~/ 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      ),
      height: MediaQuery.of(context).size.height * 0.548,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Description :",
              style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(left: 25, top: 10),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.21,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Text(
              item.item_desc,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.navigate_next,
                  color: ConstColors.primarycolor,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Initial Price :    ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      "£",
                      style: TextStyle(
                        color: ConstColors.primarycolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${item.item_price}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: item.item_discount == 0
                ? Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.navigate_next,
                          color: ConstColors.primarycolor,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "no discount on this item ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ))
                : Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: ConstColors.primarycolor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Initial Price :    ",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            "£",
                            style: TextStyle(
                              color: ConstColors.primarycolor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "${price_after_discount(item.item_price, item.item_discount)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 25, right: 25),
            decoration: BoxDecoration(
                color: ConstColors.thirdcolor,
                borderRadius: BorderRadius.circular(30)),
            height: MediaQuery.of(context).size.height * 0.09,
            child: Row(
              children: [],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 10),
            decoration: BoxDecoration(
                color: ConstColors.primarycolor,
                borderRadius: BorderRadius.circular(40)),
            height: MediaQuery.of(context).size.height * 0.08,
            child: item_added
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Item Added",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Sans",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add To Market",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Sans",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
