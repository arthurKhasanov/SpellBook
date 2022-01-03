import 'package:spellbook/feature/data/model/spell_model.dart';

class GetCartSpells {
  AllSpellsModel cartSpells;

  GetCartSpells({required this.cartSpells});

  void addSpell(SpellModel spell) {
    cartSpells.allSpells;

    switch (spell.level) {
      case 0:
        print('сработал addSpell to Cart 0');
        cartSpells.cantrips.add(spell);
        break;
      case 1:
        print('сработал addSpell to Cart 1');
        cartSpells.firstLevel.add(spell);
        break;
      case 2:
        print('сработал addSpell to Cart 2');
        cartSpells.secondLevel.add(spell);
        break;
      case 3:
        print('сработал addSpell to Cart 3');
        cartSpells.thirdLevel.add(spell);
        break;
      case 4:
        print('сработал addSpell to Cart 4');
        cartSpells.fourthLevel.add(spell);
        break;
      case 5:
        print('сработал addSpell to Cart 5');
        cartSpells.fifthLevel.add(spell);
        break;
      case 6:
        print('сработал addSpell to Cart 6');
        cartSpells.sixthLevel.add(spell);
        break;
      case 7:
        print('сработал addSpell to Cart 7');
        cartSpells.seventhLevel.add(spell);
        break;
      case 8:
        print('сработал addSpell to Cart 8');
        cartSpells.eighthLevel.add(spell);
        break;
      case 9:
        print('сработал addSpell to Cart 9');
        cartSpells.ninthLevel.add(spell);
        break;
    }
  }

  AllSpellsModel getCartSpells() {
    print('сработал getCartSpells');
    return cartSpells;
  }

  void deleteSpellFromCart(SpellModel spell) {
    if (cartSpells.cantrips.contains(spell)) {
      print('сработал deleteSpellFromCart 0');
      cartSpells.cantrips.remove(spell);
    } else if (cartSpells.firstLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 1');
      cartSpells.firstLevel.remove(spell);
    } else if (cartSpells.secondLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 2');
      cartSpells.secondLevel.remove(spell);
    } else if (cartSpells.thirdLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 3');
      cartSpells.thirdLevel.remove(spell);
    } else if (cartSpells.fourthLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 4');
      cartSpells.fourthLevel.remove(spell);
    } else if (cartSpells.fifthLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 5');
      cartSpells.fifthLevel.remove(spell);
    } else if (cartSpells.sixthLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 6');
      cartSpells.sixthLevel.remove(spell);
    } else if (cartSpells.seventhLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 7');
      cartSpells.seventhLevel.remove(spell);
    } else if (cartSpells.eighthLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 8');
      cartSpells.eighthLevel.remove(spell);
    } else if (cartSpells.ninthLevel.contains(spell)) {
      print('сработал deleteSpellFromCart 9');
      cartSpells.ninthLevel.remove(spell);
    }
  }

  bool isContains(SpellModel spell) {
    if (cartSpells.cantrips.contains(spell)) {
      print('сработал isContains 0');
      return true;
    } else if (cartSpells.firstLevel.contains(spell)) {
      print('сработал isContains 1');
      return true;
    } else if (cartSpells.secondLevel.contains(spell)) {
      print('сработал isContains 2');
      return true;
    } else if (cartSpells.thirdLevel.contains(spell)) {
      print('сработал isContains 3');
      return true;
    } else if (cartSpells.fourthLevel.contains(spell)) {
      print('сработал isContains 4');
      return true;
    } else if (cartSpells.fifthLevel.contains(spell)) {
      print('сработал isContains 5');
      return true;
    } else if (cartSpells.sixthLevel.contains(spell)) {
      print('сработал isContains 6');
      return true;
    } else if (cartSpells.seventhLevel.contains(spell)) {
      print('сработал isContains 7');
      return true;
    } else if (cartSpells.eighthLevel.contains(spell)) {
      print('сработал isContains 8');
      return true;
    } else if (cartSpells.ninthLevel.contains(spell)) {
      print('сработал isContains 9');
      return true;
    } else {
      return false;
    }
  }
}
