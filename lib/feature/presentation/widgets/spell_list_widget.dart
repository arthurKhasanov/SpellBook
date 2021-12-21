import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_cubit.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_state.dart';
import 'package:spellbook/feature/presentation/widgets/spell_card_widget.dart';

class SpellList extends StatelessWidget {
  const SpellList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpellListCubit, SpellListState>(
        builder: (context, state) {
      late AllSpellsModel spells;

      if (state is SpellListLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black87,
          ),
        );
      } else if (state is SpellListLoadedState) {
        spells = state.loadedSpellList;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Заговоры',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Montserrat',
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SpellCard(spell: spells.spells[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: spells.spells.length),
          ),
        ],
      );
    });
  }
}
