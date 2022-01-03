import 'package:equatable/equatable.dart';

abstract class SpellDescState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SpellDescInitialState extends SpellDescState {
  @override
  List<Object?> get props => [];
}

class SpellAddedState extends SpellDescState {
  bool isChecked = true;
  @override
  List<Object?> get props => [isChecked];
}

class SpellNotAddedState extends SpellDescState {
  bool isChecked = false;
  @override
  List<Object?> get props => [isChecked];
}
