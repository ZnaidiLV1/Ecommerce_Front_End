import 'package:flutter_bloc/flutter_bloc.dart';

abstract class eventPage {}

class pageChanged extends eventPage {
  final int pageIndex;

  pageChanged(this.pageIndex);
}

class PageState {
  final int currentPage;

  PageState(this.currentPage);
}


class PageBloc extends Bloc<eventPage, PageState> {
  PageBloc() : super(PageState(0)) {
    on<pageChanged>((event, emit) {
      emit(PageState(event.pageIndex));
    });
  }
}