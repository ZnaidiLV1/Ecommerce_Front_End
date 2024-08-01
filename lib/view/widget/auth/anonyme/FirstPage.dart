// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/refreshTokenController.dart';
import 'package:frontendproject/core/constant/ClientSingleton.dart';
import 'package:frontendproject/core/constant/Urls.dart';
import 'package:frontendproject/view/screen/auth/Login.dart';

// ignore: must_be_immutable
class firstPage extends StatefulWidget {
  String refreshToken;
  firstPage({
    Key? key,
    required this.refreshToken,
  }) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<TokenBloc>(context)
        .add(TokenEvent(refreshToken: widget.refreshToken));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TokenBloc, TokenState>(
          builder: (context, state) {
            if (state is AccessToken) {
              return MaterialButton(
                onPressed: () async {
                  var response = await HttpClientManager.client.post(
                      Urls.logoutUri(),
                      body: {"refresh": widget.refreshToken});
                  if (response.statusCode == 200) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => login()));
                  }
                },
                child: Text("Logout"),
              );
            } else {
              return Placeholder();
            }
          },
        ),
      ),
    );
  }
}
