import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoadingEvent extends Equatable {
   @override
  List<Object?> get props => [];
}

class startLoading extends LoadingEvent {
  @override
  List<Object?> get props => [];
}

class stopLoading extends LoadingEvent {
  @override
  List<Object?> get props => [];
}

class LoadingState extends Equatable {
  const LoadingState();
  @override
  List<Object?> get props => [];
}

class LoadingInitial extends LoadingState {}

class LoadingDone extends LoadingState {}

class LoadingInProgress extends LoadingState {}

class LoadingController extends Bloc<LoadingEvent, LoadingState> {
  LoadingController() : super(LoadingInitial()) {
    on<stopLoading>((event, emit) => emit(LoadingDone()));
    on<startLoading>((event, emit) => emit(LoadingInProgress()));
  }

  
}
