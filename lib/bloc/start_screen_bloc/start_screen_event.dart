import 'package:erikmompean/enums/languages.dart';

class StartScreenEvent {}

class StartScreenInitializeEvent extends StartScreenEvent {}

class StartScreenSelectLanguageEvent extends StartScreenEvent {
  final Languages language;

  StartScreenSelectLanguageEvent({required this.language});
}
