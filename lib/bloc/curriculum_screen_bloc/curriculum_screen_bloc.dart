import 'package:erikmompean/bloc/curriculum_screen_bloc/curriculum_screen_event.dart';
import 'package:erikmompean/bloc/curriculum_screen_bloc/curriculum_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurriculumScreenBloc
    extends Bloc<CurriculumEvent, CurriculumState> {
  final ScrollController _scrollController = ScrollController();

  CurriculumScreenBloc() : super(CurriculumStateInit()) {
    on<CurriculumInitializeEvent>(_initialize);
  }

  Future<void> _initialize(
      CurriculumEvent event, Emitter<CurriculumState> emit) async {}
}
