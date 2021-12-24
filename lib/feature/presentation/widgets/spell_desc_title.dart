import 'package:flutter/material.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

class SpellDescTitle extends StatelessWidget {
  final SpellModel spell;
  const SpellDescTitle({Key? key, required this.spell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Text(
          spell.school,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
        Text(
          spell.level == 0 ? ', Заговор' : ', ${spell.level} уровень',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
        Text(
          spell.ritual ? ', Ритуал' : '',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),],),
        const SizedBox(
          height: 4,
        ),
        Text(spell.title,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
