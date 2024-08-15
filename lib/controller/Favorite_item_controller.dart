import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/core/serializer/Items.dart';

abstract class eventPage {}

class FavoriteChanged extends eventPage {
  final List<items> items_list;

  FavoriteChanged(this.items_list, );
}

class FAvoriteState extends Equatable{
  final List<items> items_list;

  FAvoriteState(this.items_list);
  
  @override
  List<Object?> get props => [items_list];
}


class FavoriteBloc extends Bloc<eventPage, FAvoriteState> {
  FavoriteBloc() : super(FAvoriteState([])) {
    on<FavoriteChanged>((event, emit) {
      emit(FAvoriteState(event.items_list));
    });
  }
}