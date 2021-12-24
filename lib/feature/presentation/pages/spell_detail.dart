import 'package:flutter/material.dart';
import 'package:spellbook/constants/card_desc_constants.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/widgets/spell_card_row.dart';
import 'package:spellbook/feature/presentation/widgets/spell_card_title.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_row.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_sheet.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_title.dart';

class SpellDetailScreen extends StatelessWidget {
  final SpellModel spell;
  const SpellDetailScreen({Key? key, required this.spell}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(spell.getImage()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 30,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SpellDescSheet(spell: spell),
        ],
      ),
    );
  }
}

/*
DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.85,
            builder:
                (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpellDescTitle(spell: spell),
                            const SizedBox(
                              height: 10,
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
                            const SizedBox(height: 10),
                             Text(spell.description),
                          ]),
                    ),
                  ));

                }
          ),
*/


