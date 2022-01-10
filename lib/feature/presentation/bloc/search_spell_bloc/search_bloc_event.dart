import 'package:equatable/equatable.dart';

abstract class SearchSpellEvent extends Equatable {
  const SearchSpellEvent();

  @override
  List<Object?> get props => [];
}

class SearchingSpellEvent extends SearchSpellEvent {
  final String query;

  const SearchingSpellEvent({required this.query});
}
