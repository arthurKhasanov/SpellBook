import 'package:flutter/material.dart';
import 'package:spellbook/feature/presentation/widgets/spell_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заклинания', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: const SpellList(),
    );
  }
}
