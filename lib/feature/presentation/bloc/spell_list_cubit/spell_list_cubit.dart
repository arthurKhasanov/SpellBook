import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/usecases/get_all_spells.dart';
import 'package:spellbook/feature/domain/usecases/get_cart_spells.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_state.dart';

const readFileFailure = 'READ_FILE_FAILURE';

class SpellListCubit extends Cubit<SpellListState> {
  final GetAllSpells getAllSpells;
  final GetCartSpells cartSpells;

  SpellListCubit({required this.getAllSpells, required this.cartSpells})
      : super(SpellListEmptyState());

  Future<void> loadSpells() async {
    final failureOrSpells = getAllSpells.getSortSpells();

    AllSpellsModel? actualSpells;

    if (actualSpells != null) {
      emit(SpellListLoadingState());
    }

    if (failureOrSpells != null) {
      actualSpells = failureOrSpells;
      print(actualSpells.allSpells.length);
      emit(SpellListLoadedState(loadedSpellList: actualSpells));
    } else {
      emit(const SpellListErrorState(message: 'Spell == null'));
    }
  }

  Future<void> getCartSpells() async {
    final failureOrSpells = cartSpells.getCartSpells();
    AllSpellsModel? actualSpells;

    if (actualSpells == null) {
      emit(SpellListLoadingState());
    }

    if (failureOrSpells != null) {
      actualSpells = failureOrSpells;
      emit(SpellListLoadedState(loadedSpellList: actualSpells));
    } else {
      emit(const SpellListErrorState(message: 'Spell == null'));
    }
  }

  void addSpellToCart(SpellModel spell) {
    cartSpells.addSpell(spell);
  }
}
