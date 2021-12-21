import 'package:dartz/dartz.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';


// "Контракт" для Репозитория

abstract class SpellRepository {
  //Получаем все заклинания или ошибку
  Either<Failure, AllSpellsModel> getAllSpells();
}
