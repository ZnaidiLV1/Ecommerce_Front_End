import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late Future<List<items>> fav_items;
  Future<List<items>> get_fav_items() async {
    List<items> fav_items = [];
    final IdUserController iduserController = Get.find<IdUserController>();
    http.Response response = await HttpClientManager.client
        .get(Urls.get_favorite(iduserController.idUser));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      fav_items = data.map((item) => items.fromMap(item)).toList();
    }
    return fav_items;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fav_items = get_fav_items();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fav_items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No categories found'));
          } else {
            List<items> fav_items = snapshot.data!;
            return ListView.builder(itemCount: fav_items.length,itemBuilder: (context, index) {
      return Text(fav_items[index].item_name);
    });
          }
        });
  }
}
