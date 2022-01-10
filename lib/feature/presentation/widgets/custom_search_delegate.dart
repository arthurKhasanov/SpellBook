import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_bloc_event.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_spell_bloc.dart';
import 'package:spellbook/feature/presentation/bloc/search_spell_bloc/search_spell_state.dart';
import 'package:spellbook/feature/presentation/widgets/spell_carusel_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final _suggestions = [
    'Волшебная стрела',
    'Лечащее слово',
    'Огненный шар',
    'Погребальный звон',
  ];
  CustomSearchDelegate()
      : super(searchFieldLabel: 'Поиск по названию заклинания');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchSpellBloc>(context, listen: false).add(SearchingSpellEvent(query: query));
    return BlocBuilder<SearchSpellBloc, SearchSpellState>(
      builder: (context, state) {
        if (state is SpellSearchingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SpellFoundState) {
          return SpellCarusel(spellArray: state.spells);
        } else if (state is SpellErrorState) {
          return Text(state.message);
        } else {
          return const Center(child: Text('БЕДА С СОСТОЯНИЕМ ПОИСКА'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return Container();
    }
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Text(
            _suggestions[index],
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: _suggestions.length);
  }
}
