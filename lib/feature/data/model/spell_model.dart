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
  
}
