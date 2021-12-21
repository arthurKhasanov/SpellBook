import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit.dart/spell_list_cubit.dart';
import 'package:spellbook/locator_service.dart' as di;

import 'feature/presentation/pages/spell_screen.dart';
import 'locator_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SpellListCubit>(
              create: (context) => sl<SpellListCubit>()..loadSpells())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Montserrat',
              backgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
              )),
          home: SafeArea(child: HomePage()),
        ));
  }
}
