// ignore_for_file: public_member_api_docs, sort_constructors_first, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';

import 'package:frontendproject/controller/Favorite_item_controller.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';

class favorite_list_tile extends StatefulWidget {
  int index;

  List<items> fav_items;
  favorite_list_tile({
    Key? key,
    required this.index,
    required this.fav_items,
  }) : super(key: key);

  @override
  State<favorite_list_tile> createState() => _favorite_list_tileState();
}

class _favorite_list_tileState extends State<favorite_list_tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Text(widget.fav_items[widget.index].item_name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            LikeButton(
                              isLiked: true,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.06),
                              child: Text(
                                "£",
                                style: TextStyle(
                                  color: ConstColors.primarycolor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              widget.fav_items[widget.index].item_price
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    child: ClipRRect(
                      child: Image.asset(
                          widget.fav_items[widget.index].item_image),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
          flex: 4,
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.31,
            decoration: BoxDecoration(
                color: Color(0xFFB7EBF1),
                borderRadius: BorderRadius.circular(25)),
            child: IconButton(
              onPressed: () async {
                List<items> fav_items_new = [];
                http.Response response = await HttpClientManager.client
                    .delete(Urls.delete_favorite(), body: {
                  "fav_item": widget.fav_items[widget.index].item_id.toString()
                });
                if (response.statusCode == 200) {
                  final IdUserController iduserController =
                      Get.find<IdUserController>();
                  http.Response response = await HttpClientManager.client
                      .get(Urls.get_favorite(iduserController.idUser));
                  if (response.statusCode == 200) {
                    List<dynamic> data = json.decode(response.body);
                    fav_items_new =
                        data.map((item) => items.fromMap(item)).toList();
                    BlocProvider.of<FavoriteBloc>(context).add(FavoriteChanged(fav_items_new));
                  }
                }
              },
              icon: Icon(
                Icons.delete_outline_sharp,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
          ),
          flex: 1,
        ),
      ]),
    );
  }
}
