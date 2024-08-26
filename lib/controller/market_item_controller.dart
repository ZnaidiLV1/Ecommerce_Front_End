// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/core/serializer/Cart.dart';
import 'package:frontendproject/core/serializer/Items.dart';

// Define Events
abstract class MarketEvent extends Equatable {
  const MarketEvent();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class MarketChanged extends MarketEvent {
  List<items> items_list;
  List<Cart> carts_list;
  MarketChanged({
    required this.items_list,
    required this.carts_list,
  });

  @override
  List<Object?> get props => [items_list, carts_list];
}

// // ignore: must_be_immutable
// class MarketDeleted extends MarketEvent {
//   List<items> items_list;
//   List<Cart> carts_list;
//   MarketDeleted({
//     required this.items_list,
//     required this.carts_list,
//   });

//   @override
//   List<Object?> get props => [items_list, carts_list];
// }


abstract class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object?> get props => [];
}

class MarketInitial extends MarketState {}

class MarketLoaded extends MarketState {
  final List<items> items_list;
  final int price;
  final List<Cart> carts_list;

  const MarketLoaded({
    required this.items_list,
    required this.price,
    required this.carts_list,
  });

  @override
  List<Object?> get props => [items_list, price, carts_list];
}

class MarketController extends Bloc<MarketEvent, MarketState> {
  MarketController() : super(MarketInitial()) {
    on<MarketChanged>((event, emit) async {
      int total_price = 0;

      for (int i = 0; i < event.items_list.length; i++) {
        total_price +=
            event.items_list[i].item_price * event.carts_list[i].cart_quantity;
      }

      emit(MarketLoaded(
        items_list: event.items_list,
        price: total_price,
        carts_list: event.carts_list,
      ));
    });
    // on<MarketDeleted>((event, emit) async {
    //   int total_price = 0;

    //   for (int i = 0; i < event.items_list.length; i++) {
    //     total_price +=
    //         event.items_list[i].item_price * event.carts_list[i].cart_quantity;
    //   }
    //   print(total_price);
    //   emit(MarketLoaded(
    //     items_list: event.items_list,
    //     price: total_price,
    //     carts_list: event.carts_list,
    //   ));
    // });
  }
}
