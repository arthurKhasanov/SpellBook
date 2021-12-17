import 'package:dartz/dartz.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/data/repositories/spell_repository_impl.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class GetAllSpells {
  final SpellRepository spellRepository;

  GetAllSpells({required this.spellRepository});

  Future<Either<Failure, List<List<SpellEntity>>>> getSpells() async {
    return await spellRepository.getAllSpells();
  }
}
