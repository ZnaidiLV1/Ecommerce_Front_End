// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/refreshTokenController.dart';
import 'package:frontendproject/view/screen/Home/HomePage.dart';
import 'package:frontendproject/view/screen/Home/HomePage/Home.dart';
import 'package:like_button/like_button.dart';

import 'package:frontendproject/controller/ItemController/ItemController.dart';
import 'package:frontendproject/controller/ItemController/quantityNumber.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';

class TopContainer extends StatelessWidget {
  items item;
  bool like_button_bool;
  TopContainer({
    Key? key,
    required this.item,
    required this.like_button_bool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    color: ConstColors.primarycolor,
                    child: BlocBuilder<TokenBloc, TokenState>(
                      builder: (BuildContext context, state) {
                        if (state is AccessToken) {
                          return IconButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushReplacement(MaterialPageRoute(
                                //         builder: (context) => homePage(
                                //               refreshToken: state.refreshToken,
                                //             )));
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ));
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 5),
            alignment: Alignment.topLeft,
            child: Text(
              item.item_name,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              BlocBuilder<QuantityBloc, QuantityState>(
                builder: (BuildContext context, state) {
                  if (state is QuantityChangeDone) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 30,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${state.quantity} / ${item.item_count}",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800]),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              LikeButton(
                onTap: (bool isLiked) async {
                  bool newStatus = await toggleFavorite(
                    item.item_id,
                    isLiked,
                    get_email_user(context),
                  );
                  return newStatus;
                },
                size: 30,
                circleColor: CircleColor(
                  start: Color(0xff00ddff),
                  end: Color(0xff0099cc),
                ),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                isLiked: like_button_bool,
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.pink : Colors.grey,
                    size: 30,
                  );
                },
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            child: Image.asset(item.item_image),
          ),
        ],
      ),
    );
  }
}
