import 'package:erikmompean/bloc/start_screen_bloc/start_screen_event.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_state.dart';
import 'package:erikmompean/enums/languages.dart';
import 'package:erikmompean/models/user.dart';
import 'package:erikmompean/navigation_service.dart';
import 'package:erikmompean/repositories/user_repository.dart';
import 'package:erikmompean/utils/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreenBloc extends Bloc<StartScreenEvent, StartScreenState> {
  final UserRepository _userRepository;

  late User user;

  Languages languageSelected = Languages.none;

  StartScreenBloc(this._userRepository) : super(StartScreenInitialState()) {
    on<StartScreenInitializeEvent>(_initialize);
    on<StartScreenSelectLanguageEvent>(_selectLanguage);
    on<StartScreeenContiunuePressedEvent>(_continuePressed);
  }

  Future<void> _initialize(
      StartScreenEvent event, Emitter<StartScreenState> emit) async {
    emit(StartScreenLoadingState());
    user = _userRepository.getUser() ?? User.createDefault();

    emit(StartScreenIdleState(language: user.language));
  }

  Future<void> _selectLanguage(StartScreenSelectLanguageEvent event,
      Emitter<StartScreenState> emit) async {
    languageSelected = event.language;

    emit(StartScreenSelectedLanguage(languageSelected: languageSelected));
  }

  Future<void> _continuePressed(StartScreeenContiunuePressedEvent event,
      Emitter<StartScreenState> emit) async {
    user.language = languageSelected;

    bool idle = await _userRepository.setUser(user);

    if (idle) {
      NavigationService.instance.navigateAndSetRoot(Routes.curriculum);
    } else {
      // TODO Error message to event
    }

    emit(StartScreenSelectedLanguage(languageSelected: languageSelected));
  }
}
