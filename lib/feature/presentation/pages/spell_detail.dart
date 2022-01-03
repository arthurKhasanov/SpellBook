import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/data/model/spell_model.dart';
import 'package:spellbook/feature/presentation/bloc/spell_desc_cubit/spell_desc_cubit.dart';
import 'package:spellbook/feature/presentation/bloc/spell_desc_cubit/spell_desc_state.dart';
import 'package:spellbook/feature/presentation/widgets/spell_desc_sheet.dart';

class SpellDetailScreen extends StatelessWidget {
  final SpellModel spell;
  const SpellDetailScreen({Key? key, required this.spell}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final SpellDescCubit cubit = context.read<SpellDescCubit>();
    final size = MediaQuery.of(context).size;

    return BlocBuilder<SpellDescCubit, SpellDescState>(
        builder: (context, state) {
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
              width: size.width - 30,
              left: 15,
              top: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context, true),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        cubit.addOrDeleteSpellFromCart(spell);
                      },
                      icon: spell.isChecked
                          ? const Icon(
                              Icons.check_box_outlined,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.check_box_outline_blank_sharp,
                              color: Colors.white,
                            ))
                ],
              ),
            ),
            SpellDescSheet(spell: spell),
          ],
        ),
      );
    });
  }

  Widget iconButtonFromState(SpellDescState state, SpellDescCubit cubit) {
    if (state is SpellAddedState) {
      return IconButton(
          onPressed: () {
            cubit.addOrDeleteSpellFromCart(spell);
          },
          icon: const Icon(
            Icons.check_box_outlined,
            color: Colors.white,
          ));
    } else if (state is SpellNotAddedState) {
      return IconButton(
          onPressed: () {
            cubit.addOrDeleteSpellFromCart(spell);
          },
          icon: const Icon(
            Icons.check_box_outlined,
            color: Colors.white,
          ));
    } else {
      return Text(
        '${state.runtimeType}',
        style: const TextStyle(color: Colors.white),
      );
    }
  }
}