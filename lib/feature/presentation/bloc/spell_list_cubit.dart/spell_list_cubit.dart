import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';
import 'package:spellbook/feature/domain/usecases/get_all_spells.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_state.dart';

const readFileFailure = 'READ_FILE_FAILURE';

class SpellListCubit extends Cubit<SpellListState> {
  final GetAllSpells getAllSpells;
  SpellListCubit({required this.getAllSpells}) : super(SpellListEmptyState());

  void loadSpells() async {
    if (state is SpellListLoadingState) return;

    final currentState = state;

    List<List<SpellEntity>> spells = [];
    if (currentState is SpellListLoadedState) {
      spells = currentState.loadedSpellList;
    }

    emit(SpellListLoadingState(actualSpellList: spells));

    final failureOrSpells = await getAllSpells.getSpells();

    failureOrSpells.fold(
        (error) => SpellListErrorState(message: _mapErrorToMessage(error)),
        (spell) {
      final spells = (state as SpellListLoadingState).actualSpellList;
      spells.addAll(spell);
      emit(SpellListLoadedState(loadedSpellList: spells));
    });
  }

  String _mapErrorToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ReadFileFailure:
        return readFileFailure;
      default:
        return 'unidentified error';
    }
  }
}
