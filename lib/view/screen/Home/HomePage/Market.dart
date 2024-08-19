import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/controller/market_item_controller.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Cart.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/view/widget/Favotite/top_favorite.dart';
import 'package:frontendproject/view/widget/Home/Market/market_list_view.dart';
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

  Future<List<Cart>> get_carts_list() async {
    List<Cart> carts_list = [];
    IdUserController idUserController = Get.find();
    http.Response response = await HttpClientManager.client
        .get(Urls.get_all_carts(idUserController.idUser.toString()));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      carts_list = data.map((cart) => Cart.fromMap(cart)).toList();
    }
    return carts_list;
  }

  Future<List<dynamic>> get_items_and_count_list(BuildContext context) async {
    final itemsFuture = get_items_list();
    final count_list = get_carts_list();

    final results = await Future.wait([itemsFuture, count_list]);

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.secondcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<dynamic>(
            future: get_items_and_count_list(context),
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
                BlocProvider.of<MarketController>(context).add(
                  MarketChanged(
                      items_list: snapshot.data![0],
                      carts_list: snapshot.data![1]),
                );
                return BlocBuilder<MarketController, MarketState>(
                  builder: (context, state) {
                    if (state is MarketLoaded) {
                      return Column(
                        children: [
                          top_favorite(
                              title: "My Bag",
                              sub_title: "Check and Pay your Items"),
                          Market_list_view(
                            items_list: state.items_list,
                            carts_list: state.carts_list,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                color: ConstColors.thirdcolor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                      "${state.carts_list.length} items",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700])),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.035),
                                  child: Text(
                                    "£",
                                    style: TextStyle(
                                      color: ConstColors.primarycolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    state.price.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
