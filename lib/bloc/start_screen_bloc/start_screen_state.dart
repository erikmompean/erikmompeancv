import 'package:erikmompean/enums/languages.dart';

class StartScreenState {}

abstract class StartScreenLanguage extends StartScreenState {
  final Languages language;

  StartScreenLanguage({required this.language});
}

class StartScreenInitialState extends StartScreenState {}

class StartScreenLoadingState extends StartScreenState {}

class StartScreenIdleState extends StartScreenLanguage {
  StartScreenIdleState({required language})
      : super(language: language);
}

class StartScreenSelectedLanguage extends StartScreenLanguage {
  StartScreenSelectedLanguage({required languageSelected})
      : super(language: languageSelected);
}
