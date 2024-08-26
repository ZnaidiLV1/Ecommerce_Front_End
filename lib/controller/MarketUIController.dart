import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/controller/market_item_controller.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/serializer/Cart.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

void add_button_pushed(
    List<items> items_list, Cart cart, BuildContext context) async {
  http.Response response = await HttpClientManager.client.put(
      Urls.cart_add_quantity(),
      body: {"cart_id": cart.cart_id.toString()});
  if (response.statusCode == 200) {
    List<Cart> carts_list = [];
    IdUserController idUserController = Get.find();
    http.Response response = await HttpClientManager.client
        .get(Urls.get_all_carts(idUserController.idUser.toString()));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      carts_list = data.map((cart) => Cart.fromMap(cart)).toList();

      BlocProvider.of<MarketController>(context)
          .add(MarketChanged(items_list: items_list, carts_list: carts_list));
    }
  }
}

void remove_button_pushed(
    List<items> items_list, Cart cart, BuildContext context) async {
  http.Response response = await HttpClientManager.client.put(
      Urls.cart_remove_quantity(),
      body: {"cart_id": cart.cart_id.toString()});
  if (response.statusCode == 200) {
    List<Cart> carts_list = [];
    IdUserController idUserController = Get.find();
    http.Response response = await HttpClientManager.client
        .get(Urls.get_all_carts(idUserController.idUser.toString()));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      carts_list = data.map((cart) => Cart.fromMap(cart)).toList();
      BlocProvider.of<MarketController>(context)
          .add(MarketChanged(items_list: items_list, carts_list: carts_list));
    }
  }
}

void delete_cart(
  Cart cart,
  BuildContext context,
) async {
  http.Response response = await HttpClientManager.client
      .delete(Urls.delete_cart(), body: {"cart_id": cart.cart_id.toString()});
  if (response.statusCode == 200) {
    IdUserController idUserController = Get.find();
    http.Response response = await HttpClientManager.client
        .get(Urls.get_all_carts(idUserController.idUser.toString()));
    if (response.statusCode == 200) {
      List<Cart> carts_list = [];
      List<items> items_list = [];
      List<dynamic> data = json.decode(response.body);
      carts_list = data.map((cart) => Cart.fromMap(cart)).toList();
      http.Response response2 = await HttpClientManager.client
        .get(Urls.get_items_cart(idUserController.idUser.toString()));
      List<dynamic> data2 = json.decode(response2.body);
      items_list = data2.map((item) => items.fromMap(item)).toList();
      print("test");
      BlocProvider.of<MarketController>(context)
          .add(MarketChanged(items_list: items_list, carts_list: carts_list));
    }
  }
}
