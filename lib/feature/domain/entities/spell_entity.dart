import 'package:equatable/equatable.dart';

class SpellEntity extends Equatable {
  final int id;
  final int level;
  final String title;
  final String school;
  final String castingTime;
  final int ritual;
  final String rangeArea;
  final String components;
  final String duration;
  final List<String> classes;
  final String sourse;
  final String description;

  const SpellEntity({
    required this.id,
    required this.level,
    required this.title,
    required this.school,
    required this.castingTime,
    required this.ritual,
    required this.rangeArea,
    required this.components,
    required this.duration,
    required this.classes,
    required this.sourse,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        level,
        title,
        school,
        castingTime,
        ritual,
        rangeArea,
        components,
        duration,
        classes,
        sourse,
        description
      ];
}
