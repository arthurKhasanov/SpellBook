import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/domain/usecases/search_spell.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_bloc_event.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_spell_state.dart';

class SearchSpellBloc extends Bloc<SearchSpellEvent, SearchSpellState> {
  final SearchSpell searchSpell;

  SearchSpellBloc({required this.searchSpell}) : super(SpellEmptyState()) {
    on<SearchingSpellEvent>(_onEvent);
  }

  _onEvent(SearchingSpellEvent event, Emitter<SearchSpellState> emit) {
    emit(SpellSearchingState());
    final foundedSpells = searchSpell.searchSpell(event.query);
    if (foundedSpells.isNotEmpty) {
      emit(SpellFoundState(spells: foundedSpells));
    } else {
      emit(const SpellErrorState(message: 'Spells not found'));
    }
  }
}
