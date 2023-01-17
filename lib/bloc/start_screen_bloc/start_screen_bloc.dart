import 'package:erikmompean/bloc/start_screen_bloc/start_screen_event.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_state.dart';
import 'package:erikmompean/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreenBloc extends Bloc<StartScreenEvent, StartScreenState> {
  final UserRepository _userRepository;

  StartScreenBloc(this._userRepository) : super(StartScreenInitialState()) {
    on<StartScreenInitializeEvent>(_initialize);
  }

  Future<void> _initialize(
      StartScreenEvent event, Emitter<StartScreenState> emit) async {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
