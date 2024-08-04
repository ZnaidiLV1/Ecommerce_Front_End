import 'package:flutter_bloc/flutter_bloc.dart';
abstract class LoadingEvent {}

class StartLoading extends LoadingEvent {}

class StopLoading extends LoadingEvent {}

abstract class LoadingState {}

class LoadingInitial extends LoadingState {}

class LoadingInProgress extends LoadingState {}

class LoadingDone extends LoadingState {}


class LoadingController extends Bloc<LoadingEvent, LoadingState> {
  LoadingController() : super(LoadingInitial()) {
    on<StartLoading>((event, emit) => emit(LoadingInProgress()));
    on<StopLoading>((event, emit) => emit(LoadingDone()));
  }
}
