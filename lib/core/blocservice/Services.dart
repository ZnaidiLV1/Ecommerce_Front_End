// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class SharedPreferencesEvent {}

// class InitSharedPrefernces extends SharedPreferencesEvent {}

// class SharedPreferencesState {
//   final SharedPreferences? sharedPreferences;

//   SharedPreferencesState({required this.sharedPreferences});
// }

// class SharedPreferencesBloc extends Bloc<SharedPreferencesEvent, SharedPreferencesState> {
//   SharedPreferencesBloc() : super(SharedPreferencesState(sharedPreferences: null)) {
//     on<InitSharedPrefernces>((event, emit) async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       emit(SharedPreferencesState(sharedPreferences: prefs));
//     });
//   }
// }

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<myServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

