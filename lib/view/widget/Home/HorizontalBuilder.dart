// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/serializer/category.dart';

class HorizontalBuilder extends StatefulWidget {
  final Future<List<category>> cat_list;
  HorizontalBuilder({
    Key? key,
    required this.cat_list,
  }) : super(key: key);

  @override
  State<HorizontalBuilder> createState() => _HorizontalBuilderState();
}

class _HorizontalBuilderState extends State<HorizontalBuilder> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.09,
          bottom: MediaQuery.of(context).size.width * 0.09,
          left: MediaQuery.of(context).size.width * 0.04),
      height: MediaQuery.of(context).size.width * 0.06,
      child: FutureBuilder<List<category>>(
        future: widget.cat_list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No categories found'));
          } else {
            List<category> categories = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: InkWell(
                    child: Text(
                      categories[index].cat_name,
                      style: TextStyle(
                        fontSize: isSelected ? 18 : 16,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w400,
                      ),
                    ),
                    onTap: () async {
                      int x = selectedIndex + 1;

                      var response =
                          await HttpClientManager.client.get(Urls.get_items(x.toString()));
                      if(response.statusCode==200)
                      {
                        
                      }

                      
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
