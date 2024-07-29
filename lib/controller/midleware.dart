// ignore_for_file: override_on_non_overriding_member

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/core/blocservice/Services.dart';
import 'package:get/get.dart';

abstract class LaunchingEvent extends Equatable {}

class MidlewareEvent extends LaunchingEvent {
  @override
  List<Object?> get props => [];
}

class MidlewareState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowOnboarding extends MidlewareState {
  @override
  List<Object> get props => [];
}

class SkipOnboarding extends MidlewareState {
  @override
  List<Object> get props => [];
}

class MidlewareBloc extends Bloc<MidlewareEvent, MidlewareState> {
  myServices services = Get.find<myServices>();
  MidlewareBloc() : super(MidlewareState()) {
    on<MidlewareEvent>((event, emit) async {
      if (services.sharedPreferences.getBool("SeenOnboarding") == true) {
        emit(SkipOnboarding());
      } else {
        emit(ShowOnboarding());
      }
    });
  }
  void setOnBoardingSeen() async {
    await services.sharedPreferences.setBool("SeenOnboarding", true);
  }
}
