import 'package:erikmompean/bloc/main_screen_bloc/main_screen_event.dart';
import 'package:erikmompean/bloc/main_screen_bloc/main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenStateInit()) {
    on<MainScrenInitializeEvent>(_initialize);
  }

  Future<void> _initialize(
      MainScreenEvent event, Emitter<MainScreenState> emit) async {
        
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
