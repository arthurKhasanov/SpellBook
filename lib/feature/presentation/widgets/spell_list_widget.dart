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
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Список 1',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Montserrat',
                  // fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 250,
              child: ListView.separated(
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
        ),
      );
    });
  }
}
