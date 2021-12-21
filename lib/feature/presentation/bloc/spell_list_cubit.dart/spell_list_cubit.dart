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
    AllSpellsModel actualSpells;

    failureOrSpells.fold((error) {
      emit(SpellListErrorState(message: _mapErrorToMessage(error)));
    }, (spells) {
      actualSpells = spells;
      emit(SpellListLoadedState(loadedSpellList: actualSpells));
    });
  }

  String _mapErrorToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case GetSpellsFailure:
        return readFileFailure;
      default:
        return 'unidentified error';
    }
  }
}


// class SpellListCubit extends Cubit<SpellListState> {
//   final GetAllSpells getAllSpells;
//   SpellListCubit({required this.getAllSpells}) : super(SpellListEmptyState());

//   Future<void> loadSpells() async {
//     print('запустился loadSpell в Cubit');
//     if (state is SpellListLoadingState) {
//       print('идет проверка на Loading State');
//       return;
//     }
//     print('прошла проверка на Loading State удачно');
//     final currentState = state;

//     late AllSpellsModel spells;
//     if (currentState is SpellListLoadedState) {
//       spells = currentState.loadedSpellList;
//       print('Прошла проверка на Loaded State, в спеллс загружены заклинания');
//     }

//     print('емит ЛоадингСтейта');
//     emit(SpellListLoadingState(loadingSpells: spells));

//     final failureOrSpells = await getAllSpells.getSpells();

//     failureOrSpells.fold((error) {
//       emit(SpellListErrorState(message: _mapErrorToMessage(error)));
//       print('емит ЭррорСтейт');
//     }, (spell) {
//       print('failureOrSpells запущен');
//       final spells = (state as SpellListLoadedState).loadedSpellList;
//       print('емит ЛоадедСтейта');
//       print('List length: ${spells.cantrip!.length.toString()}');
//       emit(SpellListLoadedState(loadedSpellList: spells));
//     });
//   }

//   String _mapErrorToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ReadFileFailure:
//         return readFileFailure;
//       default:
//         return 'unidentified error';
//     }
//   }
// }
