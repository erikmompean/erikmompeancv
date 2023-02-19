import 'package:flutter/material.dart';

abstract class CurriculumState {}

class CurriculumStateInit extends CurriculumState {}

class CurriculumStateLoading extends CurriculumState {}

class CurriculumStateIdle extends CurriculumState {
  final ScrollController scrollController;

  CurriculumStateIdle(this.scrollController);
}
