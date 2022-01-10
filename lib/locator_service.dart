import 'package:get_it/get_it.dart';
import 'package:spellbook/feature/data/datasourses/spells_from_file_datasourse.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/data/repositories/spell_repository_impl.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';
import 'package:spellbook/feature/domain/usecases/get_all_spells.dart';
import 'package:spellbook/feature/domain/usecases/get_cart_spells.dart';
import 'package:spellbook/feature/domain/usecases/search_spell.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_spell_bloc.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_cubit.dart';

final sl = GetIt.instance;

init() async {
  //Model
  sl.registerLazySingleton<AllSpellsModel>(
      () => AllSpellsModel(allSpells: sl()));
  sl.registerLazySingleton<List<SpellModel>>(() => <SpellModel>[]);

  //bloc
  sl.registerFactory(() => SearchSpellBloc(searchSpell: sl()));
  //Cubit
  sl.registerFactory(
      () => SpellListCubit(getAllSpells: sl(), cartSpells: sl()));
  //Usecases
  sl.registerLazySingleton(() => GetAllSpells(spellRepository: sl()));
  sl.registerLazySingleton(() => GetCartSpells(cartSpells: sl()));
  sl.registerLazySingleton(() => SearchSpell(spellRepository: sl()));

  //Repository
  sl.registerLazySingleton<SpellRepository>(
      () => SpellRepositoryImpl(spellsFromFileDataSourse: sl()));

  sl.registerLazySingleton<SpellsDataSourse>(() => SpellsDataSourseImpl());
}
