import 'package:erikmompean/app_locator.dart';
import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:erikmompean/models/user.dart';
import 'package:erikmompean/navigation_service.dart';
import 'package:erikmompean/repositories/user_repository.dart';
import 'package:erikmompean/utils/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashInitState()) {
    on<SplashScreenInitEvent>(_initialize);
    on<SplashLoadingFinishedEvent>(_onLoadingFinished);
  }

  Future<void> _initialize(
      SplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    await AppLocator.setup();
    var userRepository = AppLocator.locate<UserRepository>();

    var user = userRepository.getUser();

    if (user == null) {
      user = _createUser();
      _saveUser(userRepository, user);
    }

    // Just to make sure users saw loading screen (This is not a good practise)
    await Future.delayed(const Duration(seconds: 2));
    
    emit(SplashFinishedLoadingState(user));
  }

  void _onLoadingFinished(
      SplashLoadingFinishedEvent event, Emitter<SplashScreenState> emit) {
    NavigationService.instance.navigateTo(Routes.start);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  Future<bool> _saveUser(UserRepository userRepository, User user) async {
    return await userRepository.setUser(user);
  }

  User _createUser() {
    return User(isFirstTime: true);
  }
}
