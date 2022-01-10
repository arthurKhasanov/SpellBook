import 'package:equatable/equatable.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

abstract class SearchSpellState extends Equatable {
  const SearchSpellState();

  @override
  List<Object?> get props => [];
}

class SpellEmptyState extends SearchSpellState {}

class SpellSearchingState extends SearchSpellState {}

class SpellFoundState extends SearchSpellState {
  final List<SpellModel> spells;

  const SpellFoundState({required this.spells});

  @override
  List<Object?> get props => [spells];
}

class SpellErrorState extends SearchSpellState {
  final String message;

  const SpellErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
