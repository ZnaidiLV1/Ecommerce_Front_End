// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontendproject/controller/MarketUIController.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Cart.dart';
import 'package:frontendproject/core/serializer/Items.dart';

// ignore: must_be_immutable
class Market_list_view extends StatelessWidget {
  List<items> items_list;
  List<Cart> carts_list;
  Market_list_view({
    Key? key,
    required this.items_list,
    required this.carts_list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items_list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.035),
                            alignment: Alignment.topLeft,
                            child: Text(
                              items_list[index].item_name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.035),
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
                                items_list[index].item_price.toString(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.2),
                                child: IconButton(
                                  
                                    onPressed: () async {
                                      if(carts_list[index].cart_quantity>1)
                                      {
                                          remove_button_pushed(items_list,
                                          carts_list, index, context);
                                      }
                                      else 
                                      {
                                        null;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: ConstColors.primarycolor,
                                    )),
                              ),
                              Container(
                                child: Text(
                                  carts_list[index].cart_quantity.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () async {
                                     
                                          if(items_list[index].item_count>0 )
                                      {
                                        
                                          add_button_pushed(items_list, carts_list,
                                          index, context);
                                      }
                                      else 
                                      {
                                        null;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: ConstColors.primarycolor,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: ClipRRect(
                        child: Image.asset(items_list[index].item_image),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
