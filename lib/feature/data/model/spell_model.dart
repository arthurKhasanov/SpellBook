import 'package:spellbook/constants/constants.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';

class AllSpellsModel {
  final List<SpellModel> spells;
  AllSpellsModel({required this.spells});
}

class SpellModel extends SpellEntity {
  const SpellModel({
    required level,
    required title,
    required school,
    required castingTime,
    required ritual,
    required rangeArea,
    required components,
    required duration,
    required classes,
    required source,
    required description,
  }) : super(
          level: level,
          title: title,
          school: school,
          castingTime: castingTime,
          ritual: ritual,
          rangeArea: rangeArea,
          components: components,
          duration: duration,
          classes: classes,
          source: source,
          description: description,
        );

  String getImage() {
    return Constants.imagePath + school + Constants.imageFormat;
  }
}
