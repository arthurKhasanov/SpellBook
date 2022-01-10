import 'package:spellbook/constants/constants.dart';
import 'package:spellbook/feature/domain/entities/spell_entity.dart';

class AllSpellsModel {
  List<SpellModel> allSpells = [];
  List<SpellModel> cantrips = [];
  List<SpellModel> firstLevel = [];
  List<SpellModel> secondLevel = [];
  List<SpellModel> thirdLevel = [];
  List<SpellModel> fourthLevel = [];
  List<SpellModel> fifthLevel = [];
  List<SpellModel> sixthLevel = [];
  List<SpellModel> seventhLevel = [];
  List<SpellModel> eighthLevel = [];
  List<SpellModel> ninthLevel = [];

  AllSpellsModel({required this.allSpells});
}

class SpellModel extends SpellEntity {
  bool isChecked = false;
  SpellModel({
    required isCheched,
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
