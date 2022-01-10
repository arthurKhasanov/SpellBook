import 'package:spellbook/feature/data/model/spell_model.dart';

class GetCartSpells {
  AllSpellsModel cartSpells;

  GetCartSpells({required this.cartSpells});

  void addSpell(SpellModel spell) {
    cartSpells.allSpells;

    switch (spell.level) {
      case 0:
        cartSpells.cantrips.add(spell);
        break;
      case 1:
        cartSpells.firstLevel.add(spell);
        break;
      case 2:
        cartSpells.secondLevel.add(spell);
        break;
      case 3:
        cartSpells.thirdLevel.add(spell);
        break;
      case 4:
        cartSpells.fourthLevel.add(spell);
        break;
      case 5:
        cartSpells.fifthLevel.add(spell);
        break;
      case 6:
        cartSpells.sixthLevel.add(spell);
        break;
      case 7:
        cartSpells.seventhLevel.add(spell);
        break;
      case 8:
        cartSpells.eighthLevel.add(spell);
        break;
      case 9:
        cartSpells.ninthLevel.add(spell);
        break;
    }
  }

  AllSpellsModel getCartSpells() {
    return cartSpells;
  }

  void deleteSpellFromCart(SpellModel spell) {
    if (cartSpells.cantrips.contains(spell)) {
      cartSpells.cantrips.remove(spell);
    } else if (cartSpells.firstLevel.contains(spell)) {
      cartSpells.firstLevel.remove(spell);
    } else if (cartSpells.secondLevel.contains(spell)) {
      cartSpells.secondLevel.remove(spell);
    } else if (cartSpells.thirdLevel.contains(spell)) {
      cartSpells.thirdLevel.remove(spell);
    } else if (cartSpells.fourthLevel.contains(spell)) {
      cartSpells.fourthLevel.remove(spell);
    } else if (cartSpells.fifthLevel.contains(spell)) {
      cartSpells.fifthLevel.remove(spell);
    } else if (cartSpells.sixthLevel.contains(spell)) {
      cartSpells.sixthLevel.remove(spell);
    } else if (cartSpells.seventhLevel.contains(spell)) {
      cartSpells.seventhLevel.remove(spell);
    } else if (cartSpells.eighthLevel.contains(spell)) {
      cartSpells.eighthLevel.remove(spell);
    } else if (cartSpells.ninthLevel.contains(spell)) {
      cartSpells.ninthLevel.remove(spell);
    }
  }

  bool isContains(SpellModel spell) {
    if (cartSpells.cantrips.contains(spell)) {
      return true;
    } else if (cartSpells.firstLevel.contains(spell)) {
      return true;
    } else if (cartSpells.secondLevel.contains(spell)) {
      return true;
    } else if (cartSpells.thirdLevel.contains(spell)) {
      return true;
    } else if (cartSpells.fourthLevel.contains(spell)) {
      return true;
    } else if (cartSpells.fifthLevel.contains(spell)) {
      return true;
    } else if (cartSpells.sixthLevel.contains(spell)) {
      return true;
    } else if (cartSpells.seventhLevel.contains(spell)) {
      return true;
    } else if (cartSpells.eighthLevel.contains(spell)) {
      return true;
    } else if (cartSpells.ninthLevel.contains(spell)) {
      return true;
    } else {
      return false;
    }
  }
}
