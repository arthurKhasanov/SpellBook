import 'package:flutter/material.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

class SpellCardTitle extends StatelessWidget {
  final SpellModel spell;
  final Color color;
  const SpellCardTitle({Key? key, required this.spell, required this.color})
      : super(key: key);

  String getSubtitle(SpellModel spell) {
    var subtitle = spell.school;
    if (spell.level == 0) {
      subtitle += ', Заговор';
    } else {
      subtitle += ', ${spell.level} уровень';
    }

    if (spell.ritual) {
      subtitle += ', Ритуал';
    }
    return subtitle;
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = getSubtitle(spell);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(subtitle, style: TextStyle(
                      color: color,
                      fontSize: 12,
                    ),
                    maxLines: 2,),
            ),
            spell.isChecked
                ? const Icon(Icons.check_box_outlined,
                    size: 20, color: Colors.white)
                : Container(),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(spell.title,
            style: TextStyle(
                color: color, fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
