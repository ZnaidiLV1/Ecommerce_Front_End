// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/serializer/category.dart';
import 'package:frontendproject/view/widget/Home/HorizontalBuilder.dart';
import 'package:frontendproject/view/widget/Home/Top.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<category>> cat_list;
  Future<List<category>> get_cat_list() async {
    List<category> list = [];
    var response = await HttpClientManager.client.get(Urls.get_cat());
    if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    list = data.map((item) => category.fromMap(item)).toList();
    return list;
  } else {
    throw Exception('Failed to load categories');
  }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cat_list = get_cat_list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEEF8),
      body: SafeArea(
        child: Column(
          children: [
            top(),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    horizontalBuilder(
                      cat_list: cat_list,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
