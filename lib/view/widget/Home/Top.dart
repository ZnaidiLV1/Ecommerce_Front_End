// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendproject/controller/all_items.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/view/screen/Home/item_tapped.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.menu,
                color: Colors.grey[400],
                size: 40,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width * 0.13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset("images/person_settings.png"),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: MediaQuery.of(context).size.width * 0.04),
          child: InkWell(
              onTap: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Tap here to search",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[600],
                            fontFamily: 'SANS',
                            fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundColor: ConstColors.primarycolor,
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
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

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    All_items allItemsController = Get.find();

    List<String> filteredItems = allItemsController.get_all_items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredItems[index]),
          onTap: () async {
            http.Response response = await HttpClientManager.client
                .get(Urls.get_item(filteredItems[index]));
            print('Response body: ${response.body}');
            if (response.statusCode == 200) {
              Map<String, dynamic> data = json.decode(response.body);
              items item = items.fromMap(data);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Item_Tapped(
                      item: item, item_tapped: true, like_button_bool: true)));
            }
          },
        );
      },
    );
  }
}
