import 'package:equatable/equatable.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';

abstract class SpellListState extends Equatable {
  const SpellListState();

  @override
  List<Object?> get props => [];
}

class SpellListEmptyState extends SpellListState {
  @override
  List<Object?> get props => [];
}

class SpellListLoadingState extends SpellListState {
  final List<List<SpellEntity>> actualSpellList;

  const SpellListLoadingState({required this.actualSpellList});

  @override
  List<Object?> get props => [actualSpellList];
}

class SpellListLoadedState extends SpellListState {
  final List<List<SpellEntity>> loadedSpellList;

  const SpellListLoadedState({required this.loadedSpellList});

  @override
  List<Object?> get props => [loadedSpellList];
}

class SpellListErrorState extends SpellListState {
  final String message;

  const SpellListErrorState({required this.message});

  @override
  List<Object?> get props => [];
}
