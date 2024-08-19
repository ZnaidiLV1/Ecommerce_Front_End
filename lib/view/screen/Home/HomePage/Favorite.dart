// ignore_for_file: avoid_print, empty_statements, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/Favorite_item_controller.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/view/widget/Favotite/Favorite_list_tile.dart';
import 'package:frontendproject/view/widget/Favotite/top_favorite.dart';
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
    BlocProvider.of<FavoriteBloc>(context).add(FavoriteChanged(fav_items));
    return fav_items;
  }

  @override
  void initState() {
    super.initState();
    fav_items = get_fav_items();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.secondcolor,
      body: FutureBuilder(
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
            if (fav_items.isEmpty) {
              return Center(child: Text("No Data"));
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      top_favorite(
                          title: "My Favorite",
                          sub_title: "Check Your Favortie Items"),
                      BlocBuilder<FavoriteBloc, FAvoriteState>(
                        builder: (context, state) {
                          if (state.items_list.isEmpty) {
                            return Center(
                              child: Text("No Favorite Added"),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.items_list.length,
                              itemBuilder: (context, index) {
                                return favorite_list_tile(
                                  index: index,
                                  fav_items: state.items_list,
                                );
                              },
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
