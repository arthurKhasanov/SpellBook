import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_cubit.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_state.dart';

class SpellList extends StatelessWidget {
  const SpellList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpellListCubit, SpellListState>(
        builder: (context, state) {
      List<List<SpellEntity>> spells = [];

      if (state is SpellListLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black87,
          ),
        );
      } else if (state is SpellListLoadedState) {
        spells = state.loadedSpellList;
        print(spells);
      }
      return Column(
        children: [
          const Text(
            'Заговоры',
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
           Expanded(
             child: ListView.separated(
                 itemBuilder: (context, index) {
                   return Text('${spells.isEmpty}');
                 },
                 separatorBuilder: (context, index) => const SizedBox(
                       height: 4,
                     ),
                 itemCount: 1),
           )
        ],
      );
    });
  }
}
