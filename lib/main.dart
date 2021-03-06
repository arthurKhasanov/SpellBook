import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spellbook/feature/auth_feature/view/auth_screen.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_spell_bloc.dart';
import 'package:spellbook/feature/presentation/bloc/spell_list_cubit/spell_list_cubit.dart';
import 'package:spellbook/feature/theme_feature/cubit/theme_cubit.dart';
import 'package:spellbook/feature/theme_feature/themes/themes.dart';
import 'package:spellbook/locator_service.dart' as locator;
import 'feature/presentation/pages/spell_screen.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider<SpellListCubit>(
                    create: (context) => sl<SpellListCubit>()..loadSpells()),
                BlocProvider<SearchSpellBloc>(
                    create: (context) => sl<SearchSpellBloc>()),
                BlocProvider<ThemeCubit>(create: (context) => sl<ThemeCubit>()),
              ],
              child: BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: state,
                    home: child,
                  );
                },
              ));
        },
        child: isAuth ? HomePage() : AuthScreen());
  }
}
