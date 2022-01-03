import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/constants/spell_carusel_title_constants.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_cubit.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_state.dart';
import 'package:spellbook/feature/presentation/widgets/spell_carusel_title.dart';
import 'package:spellbook/feature/presentation/widgets/spell_carusel_widget.dart';

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
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          const CaruselTitle(level: CaruselTitleConstants.cantrip),  
          SpellCarusel(spellArray: spells.cantrips),
          const CaruselTitle(level: CaruselTitleConstants.firstLevel),
          SpellCarusel(spellArray: spells.firstLevel),
          const CaruselTitle(level: CaruselTitleConstants.secondLevel),
          SpellCarusel(spellArray: spells.secondLevel),
          const CaruselTitle(level: CaruselTitleConstants.thirdLevel),
          SpellCarusel(spellArray: spells.thirdLevel),
          const CaruselTitle(level: CaruselTitleConstants.fourthLevel),
          SpellCarusel(spellArray: spells.fourthLevel),
          const CaruselTitle(level: CaruselTitleConstants.fifthLevel),
          SpellCarusel(spellArray: spells.fifthLevel),
          const CaruselTitle(level: CaruselTitleConstants.sixthLevel),
          SpellCarusel(spellArray: spells.sixthLevel),
          const CaruselTitle(level: CaruselTitleConstants.seventhLevel),
          SpellCarusel(spellArray: spells.seventhLevel),
          const CaruselTitle(level: CaruselTitleConstants.eighthLevel),
          SpellCarusel(spellArray: spells.eighthLevel),
          const CaruselTitle(level: CaruselTitleConstants.ninthLevel),
          SpellCarusel(spellArray: spells.ninthLevel),
          const SizedBox(height: 20,),
          ],
        ),
      );
    });
  }
}
