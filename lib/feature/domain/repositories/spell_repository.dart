import 'package:spellbook/feature/data/model/spell_model.dart';

abstract class SpellRepository {
  AllSpellsModel getAllSpells();
  AllSpellsModel getCartSpells();
  List<SpellModel> getSpellsBy(String name);
}
