import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/bindings.dart';
import 'package:frontendproject/controller/DotsController.dart';
import 'package:frontendproject/core/blocservice/Services.dart';
import 'package:frontendproject/core/localisation/ChangeLocal.dart';
import 'package:frontendproject/core/localisation/MyTranslation.dart';
import 'package:frontendproject/view/screen/ChooseLanguage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => myServices().init());
  runApp(MyApp());
}

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
      ],
      child: GetMaterialApp(
        initialBinding: InitialBinding(),
        locale: locale.language,
        translations: myTranslation(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: chooseLanguage(),
      ),
    );
  }
}
