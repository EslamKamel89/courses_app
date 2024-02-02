import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  MainpageBloc() : super(const MainpageState(index: 0)) {
    on<MainpageEvent>(_mainpageEvent);
  }
  _mainpageEvent(MainpageEvent event, Emitter<MainpageState> emit) {
    emit(MainpageState(index: event.index));
  }
}
