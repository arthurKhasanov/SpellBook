import 'package:flutter/material.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

class SpellCardTitle extends StatelessWidget {
  final SpellModel spell;
  final Color color;
  const SpellCardTitle({Key? key, required this.spell, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              spell.school,
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
            Text(
              spell.level == 0 ? ', Заговор' : ', ${spell.level} уровень',
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
            Text(
              spell.ritual ? ', Ритуал' : '',
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(spell.title,
            style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
