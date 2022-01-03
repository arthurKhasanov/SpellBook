import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/usecases/get_cart_spells.dart';
import 'package:spellbook/feature/presentation/bloc/spell_desc_cubit/spell_desc_state.dart';

class SpellDescCubit extends Cubit<SpellDescState> {
  GetCartSpells cartSpells;
  SpellDescCubit({required this.cartSpells}) : super(SpellDescInitialState());

  void addOrDeleteSpellFromCart(SpellModel spell) {
    if (cartSpells.isContains(spell)) {
      deleteSpell(spell);
    } else {
      addSpell(spell);
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
}
