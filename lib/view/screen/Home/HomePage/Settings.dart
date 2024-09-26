// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/refreshTokenController.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/core/constant/colors.dart';
import 'package:frontendproject/view/screen/auth/Login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: ConstColors.primarycolor,
              ),
              Positioned(
                  top: MediaQuery.of(context).size.width * 0.3,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/person_settings.png"),
                      // backgroundColor: Colors.green,
                      radius: 40,
                    ),
                  ))
            ],
          ),
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.2,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ConstColors.thirdcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      trailing: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: ConstColors.primarycolor,
                          value: true,
                          onChanged: (val) {}),
                      title: Text(
                        "Disable Notifications",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.2,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ConstColors.thirdcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      tileColor: ConstColors.thirdcolor,
                      trailing: Icon(
                        Icons.location_on_outlined,
                        color: ConstColors.primarycolor,
                        size: 40,
                      ),
                      title: Text("Address",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans')),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.2,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ConstColors.thirdcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      tileColor: ConstColors.thirdcolor,
                      trailing: Icon(
                        size: 40,
                        Icons.help_outline_outlined,
                        color: ConstColors.primarycolor,
                      ),
                      title: Text("About Us",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans')),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.2,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ConstColors.thirdcolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      tileColor: ConstColors.thirdcolor,
                      trailing: Icon(
                        size: 40,
                        Icons.language,
                        color: ConstColors.primarycolor,
                      ),
                      title: Text("Language",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans')),
                    ),
                  ),
                  BlocBuilder<TokenBloc,TokenState>(
                    builder: (BuildContext context, state) {
                      if (state is AccessToken) {
                        return InkWell(
                          onTap: () async {
                            http.Response response = await HttpClientManager
                                .client
                                .post(Urls.logout(), body: {
                              'refresh': state.refreshToken,
                            });
                            if (response.statusCode == 200) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => login()),
                                  (route) => false);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.width * 0.2,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ConstColors.thirdcolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              tileColor: ConstColors.thirdcolor,
                              trailing: Icon(
                                size: 40,
                                Icons.login_outlined,
                                color: ConstColors.primarycolor,
                              ),
                              title: Text("Logout",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Sans')),
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
