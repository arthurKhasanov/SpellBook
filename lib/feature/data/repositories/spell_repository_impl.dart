import 'package:spellbook/core/error/exeption.dart';
import 'package:spellbook/feature/data/datasorses/spells_from_file_datasourse.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class SpellRepositoryImpl implements SpellRepository {
  final SpellsFromFileDataSourse spellsFromFileDataSourse;

  SpellRepositoryImpl({required this.spellsFromFileDataSourse});

  @override
  Future<Either<Failure, List<List<SpellEntity>>>> getAllSpells() async {
    try {
      final spells = await spellsFromFileDataSourse.getAllSpells();
      return Right(spells);
    } on ReadFileExeption {
      return Left(ReadFileFailure());
    }
  }
}
