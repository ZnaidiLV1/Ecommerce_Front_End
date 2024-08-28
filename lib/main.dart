import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/bindings.dart';
import 'package:frontendproject/controller/DotsController.dart';
import 'package:frontendproject/controller/Favorite_item_controller.dart';
import 'package:frontendproject/controller/IdUser.dart';
import 'package:frontendproject/controller/ItemController/quantityNumber.dart';
import 'package:frontendproject/controller/LoadingController.dart';
import 'package:frontendproject/controller/market_item_controller.dart';
import 'package:frontendproject/controller/midleware.dart';
import 'package:frontendproject/controller/refreshTokenController.dart';
import 'package:frontendproject/core/blocservice/Services.dart';
import 'package:frontendproject/core/localisation/ChangeLocal.dart';
import 'package:frontendproject/core/localisation/MyTranslation.dart';
import 'package:frontendproject/view/screen/LaunchingScreen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => myServices().init());

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  localeController locale = Get.put(localeController());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PageBloc(),
        ),
        BlocProvider(create: (_) => LoadingController()),
        BlocProvider(create: (_) => MidlewareBloc()..add(MidlewareEvent())),
        BlocProvider(create: (_) => TokenBloc()),
        BlocProvider(create: (_) => FavoriteBloc()),
        BlocProvider(create: (_) => MarketController()),
        BlocProvider(create: (_) => QuantityBloc()),
      ],
      child: GetMaterialApp(
        initialBinding: InitialBinding(),
        locale: locale.language,
        translations: myTranslation(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: launchingScreen(),
      ),
    );
  }
}
