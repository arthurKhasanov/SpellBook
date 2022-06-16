import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_cubit.dart';
import 'package:spellbook/feature/presentation/widgets/custom_search_delegate.dart';
import 'package:spellbook/feature/presentation/widgets/spell_list_widget.dart';
import 'package:spellbook/feature/theme_feature/cubit/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SpellListCubit spellCubit = context.read<SpellListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => context.read<ThemeCubit>().changeTheme(),
          child:
              const Text('Заклинания', style: TextStyle(color: Colors.black)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black87,
              size: 25,
            )),
        actions: [
          IconButton(
              onPressed: () {
                if (!spellCubit.isCart) {
                  spellCubit
                    ..changeListStatus()
                    ..getCartSpells();
                } else {
                  spellCubit
                    ..changeListStatus()
                    ..loadSpells();
                }
              },
              icon: const Icon(
                Icons.check_box_outlined,
                color: Colors.black87,
                size: 25,
              )),
        ],
      ),
      body: SpellList(),
    );
  }
}
