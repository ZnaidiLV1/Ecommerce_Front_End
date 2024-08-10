// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/core/serializer/category.dart';
import 'package:frontendproject/view/widget/Home/HorizontalBuilder.dart';
import 'package:frontendproject/view/widget/Home/Top.dart';
import 'package:frontendproject/view/widget/Home/VerticalBuilder.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<category>> cat_list;
  late Future<List<items>> items_list;
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

  Future<List<items>> get_items_list() async {
    List<items> itemslist = [];
    var data = await HttpClientManager.client.get(Urls.get_items("1"),);
    if (data.statusCode == 200) {
      List<dynamic> dataresponse = json.decode(data.body);
      itemslist = dataresponse.map((item) => items.fromMap(item)).toList();
      return itemslist;
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  void initState() {
    super.initState();
    cat_list = get_cat_list();
    items_list = get_items_list();
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
                    HorizontalBuilder(cat_list: cat_list),
                    VerticalBuilder(items_list: items_list,),
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
