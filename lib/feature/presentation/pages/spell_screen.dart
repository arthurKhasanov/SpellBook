import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_cubit.dart';
import 'package:spellbook/feature/presentation/widgets/spell_list_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var isCart = false;
  @override
  Widget build(BuildContext context) {
    final SpellListCubit spellCubit = context.read<SpellListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заклинания', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (!isCart) {
                  isCart = !isCart;
                  spellCubit.getCartSpells();
                } else {
                  isCart = !isCart;
                  spellCubit.loadSpells();
                }
              },
              icon: const Icon(
                Icons.check_rounded,
                color: Colors.black87,
                size: 12,
              )),
        ],
      ),
      body: const SpellList(),
    );
  }
}
