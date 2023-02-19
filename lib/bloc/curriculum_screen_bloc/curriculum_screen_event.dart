class CurriculumEvent {}

class CurriculumInitializeEvent extends CurriculumEvent {}

class CurriculumLoadedEvent extends CurriculumEvent {}

class CurriculumLoadingEvent extends CurriculumEvent {}

class CurriculumScrollUpdatedEvent extends CurriculumEvent {
  final double scrollPosition;

  CurriculumScrollUpdatedEvent({required this.scrollPosition});
}
