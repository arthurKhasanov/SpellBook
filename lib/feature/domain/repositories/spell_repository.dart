import 'package:dartz/dartz.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';


abstract class SpellRepository {
  AllSpellsModel getAllSpells();
}
