// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/view/widget/Favotite/top_favorite.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Market extends StatelessWidget {
  Market({super.key});

  Future<List<items>> get_items_list() async {
    List<items> items_list = [];
    IdUserController idUser = Get.find();
    http.Response response =
        await HttpClientManager.client.get(Urls.get_items_cart(idUser.idUser));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      items_list = data.map((item) => items.fromMap(item)).toList();
    }
    return items_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              top_favorite(
                  title: "My Bag", sub_title: "Check and Pay your Items"),
              FutureBuilder(
                  future: get_items_list(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text("No Items Added"),
                      );
                    } else {
                      List<items> items_list = snapshot.data!;
                      return ListView.builder(
                         shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                          itemCount: items_list.length,
                          itemBuilder: (context, index) {
                            return Text(items_list[index].item_name);
                          });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
