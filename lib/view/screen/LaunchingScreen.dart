import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/midleware.dart';
import 'package:frontendproject/view/screen/ChooseLanguage.dart';
import 'package:frontendproject/view/screen/auth/Login.dart';

class launchingScreen extends StatefulWidget {
  const launchingScreen({super.key});

  @override
  State<launchingScreen> createState() => _launchingScreenState();
}

class _launchingScreenState extends State<launchingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MidlewareBloc,MidlewareState>(listener: (context,state)
    {
      if(state is ShowOnboarding)
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => chooseLanguage()),
          );
      }
      else if(state is SkipOnboarding)
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login()),
          );
      }
    }
    ,
    child: CircularProgressIndicator(),
    );
  }
}