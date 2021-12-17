import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:spellbook/core/error/exeption.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

abstract class SpellsFromFileDataSourse {
  Future<List<List<SpellModel>>> getAllSpells();
}

class SpellsFromFileDataSourseImpl implements SpellsFromFileDataSourse {
  @override
  Future<List<List<SpellModel>>> getAllSpells() async {
    final stringFromJson =
        await rootBundle.loadString('assets/json/spells.json');
    if (stringFromJson != null && stringFromJson.isNotEmpty) {
      final spells = json.decode(stringFromJson);
      return (spells['spells'] as List)
          .map((array) => (array as List)
              .map((spell) => SpellModel.fromJson(spell))
              .toList())
          .toList();
    } else {
      throw ReadFileExeption();
    }
  }
}

