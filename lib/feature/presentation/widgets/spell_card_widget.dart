import 'package:flutter/material.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';

class SpellCard extends StatelessWidget {
  const SpellCard({Key? key, required this.spell}) : super(key: key);
  final SpellModel spell;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(spell.getImage()),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(spell.title, style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Casting Time:',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        spell.castingTime,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 12
                            ),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
