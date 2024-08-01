import 'package:flutter/material.dart';
import 'package:frontendproject/core/functions/CheckInternet.dart';

class checkConnection extends StatefulWidget {
  checkConnection({super.key});

  @override
  State<checkConnection> createState() => _checkConnectionState();
}

class _checkConnectionState extends State<checkConnection> {
  var res;
  initialData() async {
    res = await checkInternet();
    print("res is $res");
  }

  @override
  void initState() {
    initialData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
