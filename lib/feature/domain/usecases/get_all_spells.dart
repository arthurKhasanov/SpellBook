import 'package:dartz/dartz.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class GetAllSpells {
  final SpellRepository spellRepository;

  GetAllSpells({required this.spellRepository});

  Either<Failure, AllSpellsModel> getSpells() {
    return spellRepository.getAllSpells();
  }
}
