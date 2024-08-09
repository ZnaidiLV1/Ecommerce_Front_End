// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontendproject/core/serializer/category.dart';

class horizontalBuilder extends StatefulWidget {
  
  List<category> cat_list;
  horizontalBuilder({
    Key? key,
    required this.cat_list,
  }) : super(key: key);

  @override
  State<horizontalBuilder> createState() => _horizontalBuilderState();
}

class _horizontalBuilderState extends State<horizontalBuilder> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.09,
                          bottom: MediaQuery.of(context).size.width * 0.09,
                          left: MediaQuery.of(context).size.width * 0.04),
                      height: MediaQuery.of(context).size.width * 0.06,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.cat_list.length,
                        itemBuilder: (context, index) {
                          bool isSelected =selectedIndex == index;
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: InkWell(
                              child: Text(
                                widget.cat_list[index].cat_name,
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
                                });
                              },
                            ),
                          );
                        },
                      ),
                    );
  }
}