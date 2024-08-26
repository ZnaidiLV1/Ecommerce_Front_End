import 'package:flutter/material.dart';
import 'package:frontendproject/controller/MarketUIController.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Cart.dart';
import 'package:frontendproject/core/serializer/Items.dart';
import 'package:http/http.dart' as http;

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
        return Dismissible(
          key: ValueKey(items_list[index].item_id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.blue,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
          onDismissed: (direction) {
            delete_cart(carts_list[index], context);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.035),
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
                                  left:
                                      MediaQuery.of(context).size.width * 0.2),
                              child: IconButton(
                                onPressed: () async {
                                  if (carts_list[index].cart_quantity > 1) {
                                    remove_button_pushed(
                                        items_list, carts_list[index], context);
                                  }
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: ConstColors.primarycolor,
                                ),
                              ),
                            ),
                            Text(
                              carts_list[index].cart_quantity.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (carts_list[index].cart_quantity <
                                    carts_list[index].cart_count) {
                                  add_button_pushed(
                                      items_list, carts_list[index], context);
                                }
                              },
                              icon: Icon(
                                Icons.add,
                                size: 30,
                                color: ConstColors.primarycolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(items_list[index].item_image),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
