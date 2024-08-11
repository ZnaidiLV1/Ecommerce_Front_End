// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:frontendproject/core/serializer/category.dart';
import 'package:frontendproject/view/widget/Home/Top.dart';
import 'package:http/http.dart';
import 'package:like_button/like_button.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedIndex = 0;
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
    var data = await HttpClientManager.client.get(Urls.get_items("1"));
    if (data.statusCode == 200) {
      List<dynamic> dataresponse = json.decode(data.body);
      itemslist = dataresponse.map((item) => items.fromMap(item)).toList();
      return itemslist;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<items>> get_items_list_x(String x) async {
    List<items> itemslist = [];
    var data = await HttpClientManager.client.get(Urls.get_items(x));
    if (data.statusCode == 200) {
      List<dynamic> dataresponse = json.decode(data.body);
      itemslist = dataresponse.map((item) => items.fromMap(item)).toList();
      return itemslist;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<bool> toggleFavorite(int itemId, bool currentStatus) async {
    try {
      final response = await HttpClientManager.client.put(
        Urls.update_favorite(),
        body: {'item_id': itemId.toString()},
      );
      if (response.statusCode == 200) {
        return !currentStatus;
      } else {
        throw Exception('Failed to update favorite status');
      }
    } catch (e) {
      throw Exception('Failed to update favorite status: $e');
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
                    // Horizontal category list
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.09,
                        bottom: MediaQuery.of(context).size.width * 0.09,
                        left: MediaQuery.of(context).size.width * 0.04,
                      ),
                      height: MediaQuery.of(context).size.width * 0.06,
                      child: FutureBuilder<List<category>>(
                        future: cat_list,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No categories found'));
                          } else {
                            List<category> categories = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                bool isSelected = selectedIndex == index;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: InkWell(
                                    child: Text(
                                      categories[index].cat_name,
                                      style: TextStyle(
                                        fontSize: isSelected ? 18 : 16,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.w400,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        items_list = get_items_list_x(
                                            (index + 1).toString());
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    // Items grid
                    Expanded(
                      child: FutureBuilder<List<items>>(
                        future: items_list,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text("Error Loading Items"));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No items found'));
                          } else {
                            List<items> items_all = snapshot.data!;
                            return GridView.builder(
                              itemCount: items_all.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "£",
                                              style: TextStyle(
                                                color: ConstColors.primarycolor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    4), 
                                            Text(
                                              "${items_all[index].item_price}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(), 
                                            LikeButton(
                                              size: 30,
                                              circleColor: CircleColor(
                                                start: Color(0xff00ddff),
                                                end: Color(0xff0099cc),
                                              ),
                                              bubblesColor: BubblesColor(
                                                dotPrimaryColor:
                                                    Color(0xff33b5e5),
                                                dotSecondaryColor:
                                                    Color(0xff0099cc),
                                              ),
                                              isLiked: items_all[index].item_favorite,
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite,
                                                color: isLiked ? Colors.pink : Colors.grey,
                                                size: 30,
                                              );
                                            },
                                               onTap: (bool isLiked) async {
                                                bool newStatus = await toggleFavorite(items_all[index].item_id, isLiked);
                                                setState(() {
                                                  items_all[index].item_favorite = newStatus;
                                                });
                                                return newStatus;
                                              }
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Item image
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.22,
                                        child: Image.asset(
                                            items_all[index].item_image),
                                      ),
                                      // Item name
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${items_all[index].item_name}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
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
