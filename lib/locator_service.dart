import 'package:get_it/get_it.dart';
import 'package:spellbook/feature/data/datasourses/spells_from_file_datasourse.dart';
import 'package:spellbook/feature/data/repositories/spell_repository_impl.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';
import 'package:spellbook/feature/domain/usecases/get_all_spells.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_cubit.dart';

final sl = GetIt.instance;

init() {
  //Cubit
  sl.registerFactory(() => SpellListCubit(getAllSpells: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetAllSpells(spellRepository: sl()));

  //Repository
  sl.registerLazySingleton<SpellRepository>(
      () => SpellRepositoryImpl(spellsFromFileDataSourse: sl()));

  sl.registerLazySingleton<SpellsDataSourse>(
      () => SpellsDataSourseImpl());
}
