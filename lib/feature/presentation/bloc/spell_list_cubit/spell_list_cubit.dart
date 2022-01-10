import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/usecases/get_all_spells.dart';
import 'package:spellbook/feature/domain/usecases/get_cart_spells.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_state.dart';

const readFileFailure = 'READ_FILE_FAILURE';

class SpellListCubit extends Cubit<SpellListState> {
  final GetAllSpells getAllSpells;
  final GetCartSpells cartSpells;
  bool isCart = false;

  SpellListCubit({required this.getAllSpells, required this.cartSpells})
      : super(SpellListEmptyState());

  Future<void> loadSpells() async {
    final failureOrSpells = getAllSpells.getSortedSpells();
    AllSpellsModel? actualSpells;

    if (actualSpells != null) {
      emit(SpellListLoadingState());
    }
    if (failureOrSpells != null) {
      actualSpells = failureOrSpells;
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

  void addOrDeleteSpellFromCart(SpellModel spell) {
    if (isCart) {
      if (cartSpells.isContains(spell)) {
        deleteSpell(spell);
        getCartSpells();
      } else {
        addSpell(spell);
        getCartSpells();
      }
    } else {
      if (cartSpells.isContains(spell)) {
        deleteSpell(spell);
        loadSpells();
      } else {
        addSpell(spell);
        loadSpells();
      }
    }
  }

  void deleteSpell(SpellModel spell) {
    spell.isChecked = !spell.isChecked;
    cartSpells.deleteSpellFromCart(spell);
    emit(SpellNotAddedState());
  }

  void addSpell(SpellModel spell) {
    spell.isChecked = !spell.isChecked;
    cartSpells.addSpell(spell);
    emit(SpellAddedState());
  }

  void changeListStatus() {
    isCart = !isCart;
  }
}
