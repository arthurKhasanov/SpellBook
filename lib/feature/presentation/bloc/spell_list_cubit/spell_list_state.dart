import 'package:equatable/equatable.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

abstract class SpellListState extends Equatable {
  const SpellListState();

  @override
  List<Object?> get props => [];
}

// NOTE: Состояние пока не получены заклинания
class SpellListEmptyState extends SpellListState {
  @override
  List<Object?> get props => [];
}

// NOTE: Состояние пока получаем заклинания
class SpellListLoadingState extends SpellListState {
  @override
  List<Object?> get props => [];
}

// NOTE: Состояние когда заклинания загружены
class SpellListLoadedState extends SpellListState {
  final AllSpellsModel loadedSpellList;

  const SpellListLoadedState({required this.loadedSpellList});

  @override
  List<Object?> get props => [loadedSpellList];
}

// NOTE: Cостояние при ошибке
class SpellListErrorState extends SpellListState {
  final String message;

  const SpellListErrorState({required this.message});

  @override
  List<Object?> get props => [];
}

class SpellDescInitialState extends SpellListState {
  @override
  List<Object?> get props => [];
}

// NOTE: Заклинание добавлено
class SpellAddedState extends SpellListState {
  bool isChecked = true;
  @override
  List<Object?> get props => [isChecked];
}

// NOTE: Заклинание не добавлено
class SpellNotAddedState extends SpellListState {
  bool isChecked = false;
  @override
  List<Object?> get props => [isChecked];
}