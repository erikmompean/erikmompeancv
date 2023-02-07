import 'package:erikmompean/bloc/curriculum_screen_bloc/Curriculum_screen_event.dart';
import 'package:erikmompean/bloc/curriculum_screen_bloc/Curriculum_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurriculumScreenBloc
    extends Bloc<CurriculumScreenEvent, CurriculumScreenState> {
  CurriculumScreenBloc() : super(CurriculumScreenStateInit()) {
    on<CurriculumScreenInitializeEvent>(_initialize);
  }

  Future<void> _initialize(
      CurriculumScreenEvent event, Emitter<CurriculumScreenState> emit) async {}
}
