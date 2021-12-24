import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/usecases/get_all_spells.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_state.dart';

const readFileFailure = 'READ_FILE_FAILURE';

class SpellListCubit extends Cubit<SpellListState> {
  final GetAllSpells getAllSpells;
  SpellListCubit({required this.getAllSpells}) : super(SpellListEmptyState());

  Future<void> loadSpells() async {
    final failureOrSpells = getAllSpells.getSpells();
    AllSpellsModel? actualSpells;

    if (actualSpells != null) {
      emit(SpellListLoadingState());
    }

    if (failureOrSpells != null) {
      actualSpells = failureOrSpells;
      emit(SpellListLoadedState(loadedSpellList: actualSpells));
    } else {
      emit(SpellListErrorState(message: 'Spell == null'));
    }
  }
}
