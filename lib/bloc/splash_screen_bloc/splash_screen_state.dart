import 'package:erikmompean/models/user.dart';

abstract class SplashScreenState {}

class SplashFinishedLoadingState extends SplashScreenState {
  final User user;

  SplashFinishedLoadingState(this.user);
}

class SplashInitState extends SplashScreenState {}
