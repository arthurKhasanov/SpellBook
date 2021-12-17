import 'package:spellbook/feature/domain/entities/spell_entity.dart';

class SpellModel extends SpellEntity {
  const SpellModel({
    required id,
    required level,
    required title,
    required school,
    required castingTime,
    required ritual,
    required rangeArea,
    required components,
    required duration,
    required classes,
    required sourse,
    required description,
  }) : super(
          id: id,
          level: level,
          title: title,
          school: school,
          castingTime: castingTime,
          ritual: ritual,
          rangeArea: rangeArea,
          components: components,
          duration: duration,
          classes: classes,
          sourse: sourse,
          description: description,
        );

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
      id: json['id'],
      level: json['level'],
      title: json['title'],
      school: json['school'],
      castingTime: json['castingTime'],
      ritual: (json['ritual'] as int) == 1 ? true : false,
      rangeArea: json['rangeArea'],
      components: json['components'],
      duration: json['duration'],
      classes:
          (json['classes'] as List<dynamic>).map((e) => e as String).toList(),
      sourse: json['sourse'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level,
      'title': title,
      'school': school,
      'castingTime': castingTime,
      'ritual': ritual,
      'rangeArea': rangeArea,
      'components': components,
      'duration': duration,
      'classes': classes,
      'sourse': sourse,
      'description': description,
    };
  }
}
