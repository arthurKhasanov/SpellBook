import 'package:flutter/material.dart';
import 'package:spellbook/constants/card_desc_constants.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/pages/spell_detail.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_row.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_title.dart';

class SpellCard extends StatelessWidget {
  const SpellCard({Key? key, required this.spell}) : super(key: key);
  final SpellModel spell;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SpellDetailScreen(spell: spell)));
      },
      child: Container(
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
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpellDescTitle(spell: spell, color: Colors.white,),
                Column(children: [
                  SpellDescRow(
                      rowName: CardDescConstans.castingTime,
                      rowDesc: spell.castingTime,),
                  const SizedBox(
                    height: 4,
                  ),
                  SpellDescRow(
                      rowName: CardDescConstans.rangeArea,
                      rowDesc: spell.rangeArea,),
                  const SizedBox(
                    height: 4,
                  ),
                  SpellDescRow(
                      rowName: CardDescConstans.components,
                      rowDesc: spell.components,),
                  const SizedBox(
                    height: 4,
                  ),
                  SpellDescRow(
                      rowName: CardDescConstans.duration,
                      rowDesc: spell.duration,),
                ]),
              ]),
        ),
      ),
    );
  }
}
