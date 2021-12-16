import 'package:dartz/dartz.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';


// "Контракт" для Репозитория

abstract class SpellRepository {
  //Получаем все заклинания или ошибку
  Future<Either<Failure, List<List<SpellEntity>>>> getAllSpells();
}
