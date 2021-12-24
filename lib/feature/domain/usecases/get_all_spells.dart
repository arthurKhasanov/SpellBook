import 'package:dartz/dartz.dart';
import 'package:spellbook/core/error/failure.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class GetAllSpells {
  final SpellRepository spellRepository;

  GetAllSpells({required this.spellRepository});

  AllSpellsModel getSpells() {
    var spells = spellRepository.getAllSpells();

    for (var spell in spells.allSpells) {
      if (spell.level == 0) {
        spells.cantrips.add(spell);
      } else if (spell.level == 1) {
        spells.firstLevel.add(spell);
      } else if (spell.level == 2) {
        spells.secondLevel.add(spell);
      } else if (spell.level == 3) {
        spells.thirdLevel.add(spell);
      } else if (spell.level == 4) {
        spells.fourthLevel.add(spell);
      } else if (spell.level == 5) {
        spells.fifthLevel.add(spell);
      } else if (spell.level == 6) {
        spells.sixthLevel.add(spell);
      } else if (spell.level == 7) {
        spells.seventhLevel.add(spell);
      } else if (spell.level == 8) {
        spells.eighthLevel.add(spell);
      } else if (spell.level == 9) {
        spells.ninthLevel.add(spell);
      }
    }
    return spells;
  }
}
