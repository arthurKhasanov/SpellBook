import 'package:spellbook/core/error/exeption.dart';
import 'package:spellbook/feature/data/datasourses/spells_from_file_datasourse.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class SpellRepositoryImpl implements SpellRepository {
  final SpellsDataSourse spellsFromFileDataSourse;

  SpellRepositoryImpl({required this.spellsFromFileDataSourse});

  @override
  AllSpellsModel getAllSpells()  {
    try {
      final spells = spellsFromFileDataSourse.getAllSpells();
      return spells;
    } on ReadFileExeption {
      throw Exception();
    }
  }
}
