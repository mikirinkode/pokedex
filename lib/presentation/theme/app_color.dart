import 'package:flutter/material.dart';

import '../../utils/pokemon_type_constants.dart';

class AppColor {
  // Identity
  static const primary = Color(0xFFDC0A2D);

  // Pokemon Type Color
  static const typeBug = Color(0xFFA7B723);
  static const typeDark = Color(0xFF75574C);
  static const typeDragon = Color(0xFF7037FF);
  static const typeElectric = Color(0xFFF9CF30);
  static const typeFairy = Color(0xFFE69EAC);
  static const typeFighting = Color(0xFFC12239);
  static const typeFire = Color(0xFFF57D31);
  static const typeFlying = Color(0xFFA891EC);
  static const typeGhost = Color(0xFF70559B);
  static const typeNormal = Color(0xFFAAA67F);
  static const typeGrass = Color(0xFF74CB48);
  static const typeGround = Color(0xFFDEC16B);
  static const typeIce = Color(0xFF9AD6DF);
  static const typePoison = Color(0xFFA43E9E);
  static const typePsychic = Color(0xFFFB5584);
  static const typeRock = Color(0xFFB69E31);
  static const typeSteel = Color(0xFFB7B9D0);
  static const typeWater = Color(0xFF6493EB);

  // Grayscale
  static const grayscaleDark = Color(0xFF212121);
  static const grayscaleMedium = Color(0xFF666666);
  static const grayscaleLight = Color(0xFFB6B6B6);
  static const grayscaleBackground = Color(0xFFEFEFEF);
  static const grayscaleWhite = Colors.white;
  static const grayscaleLoading = Color(0xFFD9D9D9);

  static Color getPokemonTypeColor(String type) {
    switch (type) {
      case PokemonTypeConstants.typeBug:
        return AppColor.typeBug;
      case PokemonTypeConstants.typeDark:
        return AppColor.typeDark;
      case PokemonTypeConstants.typeDragon:
        return AppColor.typeDragon;
      case PokemonTypeConstants.typeElectric:
        return AppColor.typeElectric;
      case PokemonTypeConstants.typeFairy:
        return AppColor.typeFairy;
      case PokemonTypeConstants.typeFighting:
        return AppColor.typeFighting;
      case PokemonTypeConstants.typeFire:
        return AppColor.typeFire;
      case PokemonTypeConstants.typeFlying:
        return AppColor.typeFlying;
      case PokemonTypeConstants.typeGhost:
        return AppColor.typeGhost;
      case PokemonTypeConstants.typeNormal:
        return AppColor.typeNormal;
      case PokemonTypeConstants.typeGrass:
        return AppColor.typeGrass;
      case PokemonTypeConstants.typeGround:
        return AppColor.typeGround;
      case PokemonTypeConstants.typeIce:
        return AppColor.typeIce;
      case PokemonTypeConstants.typePoison:
        return AppColor.typePoison;
      case PokemonTypeConstants.typePsychic:
        return AppColor.typePsychic;
      case PokemonTypeConstants.typeRock:
        return AppColor.typeRock;
      case PokemonTypeConstants.typeSteel:
        return AppColor.typeSteel;
      case PokemonTypeConstants.typeWater:
        return AppColor.typeWater;
      default:
        return Colors.black;
    }
  }
}
