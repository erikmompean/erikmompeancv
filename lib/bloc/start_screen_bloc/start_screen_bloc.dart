import 'package:erikmompean/bloc/start_screen_bloc/start_screen_event.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_state.dart';
import 'package:erikmompean/enums/languages.dart';
import 'package:erikmompean/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreenBloc extends Bloc<StartScreenEvent, StartScreenState> {
  final UserRepository _userRepository;
  Languages languageSelected = Languages.none;

  StartScreenBloc(this._userRepository) : super(StartScreenInitialState()) {
    on<StartScreenInitializeEvent>(_initialize);
    on<StartScreenSelectLanguageEvent>(_selectLanguage);
  }

  Future<void> _initialize(
      StartScreenEvent event, Emitter<StartScreenState> emit) async {}

  Future<void> _selectLanguage(StartScreenSelectLanguageEvent event,
      Emitter<StartScreenState> emit) async {
    languageSelected = event.language;

    emit(StartScreenSelectedLanguage(languageSelected: languageSelected));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
