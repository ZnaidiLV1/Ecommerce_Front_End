// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, sort_child_properties_last
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';

import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

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

  String dropdownValue = '4/64';
  List<String> get_quantity_list() {
    List<String> quantityList = [];

    for (int i = 1; i <= item.item_count; i++) {
      quantityList.add(i.toString());
    }

    return quantityList;
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
                        "After Discount Price :    ",
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //tap here
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "RAM/ROM",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 18),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {},
                        items: <String>[
                          '4/64',
                          '8/128',
                          '8/256',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "QTY",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 18),
                      child: DropdownButton<String>(
                        value: '1',
                        onChanged: (String? newValue) {},
                        items: get_quantity_list()
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
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
                : InkWell(
                    onTap: () async {
                      final IdUserController idUserController =
                          Get.find<IdUserController>();
                      http.Response response = await HttpClientManager.client
                          .post(Urls.add_in_market(), body: {
                        'cart_item': item.item_id.toString(),
                        'cart_user': idUserController.getIdUser.toString(),
                        'cart_quantity': '1',
                        'cart_count': item.item_count.toString(),
                      });
                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('${item.item_name} added to the market'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: Row(
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
          ),
        ],
      ),
    );
  }
}
