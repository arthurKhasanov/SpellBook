import 'package:flutter/material.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/widgets/spell_card_widget.dart';

class SpellCarusel extends StatelessWidget {
  final List<SpellModel> spellArray;
  const SpellCarusel({Key? key, required this.spellArray}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (spellArray.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 250,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SpellCard(spell: spellArray[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: spellArray.length),
          ),
        ],
      );
    } else {
      return const SizedBox(
        height: 250,
      );
    }
  }
}
