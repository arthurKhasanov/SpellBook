import 'package:spellbook/feature/data/datasourses/spells_from_file_datasourse.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class SpellRepositoryImpl implements SpellRepository {
  final SpellsDataSourse spellsFromFileDataSourse;

  SpellRepositoryImpl({required this.spellsFromFileDataSourse});

  @override
  AllSpellsModel getAllSpells() {
    final spells = spellsFromFileDataSourse.getAllSpells();
    return spells;
  }

  @override
  List<SpellModel> getSpellsBy(String title) {
    final spells = spellsFromFileDataSourse.getAllSpells();
    final foundSpells = spells.allSpells
        .where((spell) => spell.title.toLowerCase().contains(title))
        .toList();
    return foundSpells;
  }

  @override
  AllSpellsModel getCartSpells() {
    final cartSpells = spellsFromFileDataSourse.getCartSpells();
    return cartSpells;
  }
}
