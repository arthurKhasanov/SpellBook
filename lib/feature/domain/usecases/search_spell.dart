import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/domain/repositories/spell_repository.dart';

class SearchSpell {
  final SpellRepository spellRepository;

  SearchSpell({required this.spellRepository});

  List<SpellModel> searchSpell(String name) {
    return spellRepository.getSpellsBy(name);
  }
}
