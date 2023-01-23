import 'package:erikmompean/enums/languages.dart';

class StartScreenState {}

class StartScreenInitialState extends StartScreenState {}

class StartScreenLoadingState extends StartScreenState {}

class StartScreenIdleState extends StartScreenState {}

class StartScreenSelectedLanguage extends StartScreenState {
  final Languages? languageSelected;

  StartScreenSelectedLanguage({required this.languageSelected});
}
