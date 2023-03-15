import 'package:erikmompean/bloc/curriculum_screen_bloc/curriculum_screen_event.dart';
import 'package:erikmompean/bloc/curriculum_screen_bloc/curriculum_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurriculumScreenBloc extends Bloc<CurriculumEvent, CurriculumState> {
  double lastScroll = 0;
  final ScrollController _scrollController = ScrollController();

  CurriculumScreenBloc() : super(CurriculumStateInit()) {
    on<CurriculumInitializeEvent>(_initialize);
    on<CurriculumScrollUpdatedEvent>(_onScrollUpdated);
  }

  Future<void> _initialize(
      CurriculumEvent event, Emitter<CurriculumState> emit) async {
    emit(CurriculumStateIdle(_scrollController, 0));
  }

  Future<void> _onScrollUpdated(
      CurriculumScrollUpdatedEvent event, Emitter<CurriculumState> emit) async {
    double angle = event.scrollPosition / 8;

    if ((event.scrollPosition - lastScroll) > 50) {

      for (var i = lastScroll; i < event.scrollPosition; i++) {
        angle = i / 8;
        await Future.delayed(const Duration(milliseconds: 1));
        if (angle > 30) {
          angle = 30;
        }
        emit(CurriculumStateIdle(_scrollController, angle));
      }
    }
    if (angle > 30) {
      angle = 30;
    }
    emit(CurriculumStateIdle(_scrollController, angle));

    lastScroll = event.scrollPosition;
  }
}
