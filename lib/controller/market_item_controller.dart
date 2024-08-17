// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frontendproject/core/serializer/Items.dart';

class MarketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MarketChanged extends MarketEvent {
  List<items> items_list;
  MarketChanged({
    required this.items_list,
  });
  @override
  List<Object?> get props => [items_list];
}

class MarketInitial extends Equatable {
  @override
  List<Object?> get props => [];
}

class MarketState extends MarketInitial {
  List<items> items_list;
  MarketState({
    required this.items_list,
  });
  @override
  List<Object?> get props => [items_list];
}

class MarketController extends Bloc<MarketEvent, MarketInitial> {
  MarketController() : super(MarketInitial()) {
    on<MarketChanged>((event, emit) {
      emit(MarketState(items_list: event.items_list));
    });
  }
}
