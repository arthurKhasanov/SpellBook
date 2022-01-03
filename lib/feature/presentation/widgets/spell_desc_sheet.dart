import 'package:flutter/material.dart';
import 'package:spellbook/constants/card_desc_constants.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_row.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_title.dart';

class SpellDescSheet extends StatelessWidget {
  final SpellModel spell;
  const SpellDescSheet({Key? key, required this.spell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) =>
          ClipRRect(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [SpellDescTitle(
                          spell: spell,
                        ),
                        SpellDescRow(
                              rowName: CardDescConstans.castingTime,
                              rowDesc: spell.castingTime),
                          SpellDescRow(
                              rowName: CardDescConstans.rangeArea,
                              rowDesc: spell.rangeArea),
                          SpellDescRow(
                              rowName: CardDescConstans.components,
                              rowDesc: spell.components),
                          SpellDescRow(
                              rowName: CardDescConstans.duration,
                              rowDesc: spell.duration),
                          SpellDescRow(
                              rowName: CardDescConstans.classes,
                              rowDesc: spell.classes.toString()),
                          SpellDescRow(
                              rowName: CardDescConstans.source,
                              rowDesc: spell.source),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(spell.description),
                        ],),
            ),
          ),
        ),
      ),
    );
  }
}
