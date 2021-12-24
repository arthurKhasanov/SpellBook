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

