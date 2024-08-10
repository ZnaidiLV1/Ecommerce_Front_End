// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/core/serializer/Items.dart';

class VerticalBuilder extends StatefulWidget {
  Future<List<items>> items_list;
  VerticalBuilder({
    Key? key,
    required this.items_list,
  }) : super(key: key);

  @override
  State<VerticalBuilder> createState() => _VerticalBuilderState();
}

class _VerticalBuilderState extends State<VerticalBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: FutureBuilder<List<items>>(
            future: widget.items_list,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Text("Error Loading Items"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No items found'));
              } else {
                List<items> items_all = snapshot.data!;
                print(items_all[0].item_image);
                return GridView.builder(
                  itemCount: items_all.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              Text(
                                "£",
                                style: TextStyle(
                                    color: ConstColors.primarycolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("${items_all[index].item_price}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.width * 0.27,
                            child: Image.asset(items_all[index].item_image)),
                        Container(
                          child: Text("${items_all[index].item_name}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        )
                      ]),
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
