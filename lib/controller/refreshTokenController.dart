// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Event extends Equatable {}

// ignore: must_be_immutable
class TokenEvent extends Event {
  String refreshToken;
  TokenEvent({
    required this.refreshToken,
  });
  @override
  List<Object?> get props => [];
}

class TokenState extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AccessToken extends TokenState {
  String refreshToken;
  AccessToken({
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [refreshToken];
}

class TokenBloc extends Bloc<Event, TokenState> {
  TokenBloc() : super(TokenState()) {
    on<TokenEvent>((event, emit) {
      emit(AccessToken(refreshToken: event.refreshToken));
    });
  }
}
