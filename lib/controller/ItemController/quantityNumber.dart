import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class QuantityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuantityChanged extends QuantityEvent {
  final int quantity;
  
  QuantityChanged({required this.quantity});
  
  @override
  List<Object?> get props => [quantity];
}

class QuantityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuantityInitial extends QuantityState {}

class QuantityChangeDone extends QuantityState {
  final int quantity;
  
  QuantityChangeDone({required this.quantity});
  
  @override
  List<Object?> get props => [quantity];
}

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  QuantityBloc() : super(QuantityInitial()) {
    on<QuantityChanged>((event, emit) {
      emit(QuantityChangeDone(quantity: event.quantity));
    });
  }
}
