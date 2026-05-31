import 'package:flutter/material.dart';

class AppGradient {
  static const LinearGradient linearGradientContainerLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFFFE799),
      Color(0xFFFFD582),
      Color(0xFFFFC174),
      Color(0xFFFFAC70),
      Color(0xFFFF9677),
      Color(0xFFFF8287),
      Color(0xFFFF709D),
      Color(0xFFFF61B5),
    ],
    tileMode: TileMode.mirror,
  );

  static const LinearGradient linearGradientContainerDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFB3EFB2),
      Color(0xFF8DE7A1),
      Color(0xFF68DE9F),
      Color(0xFF44D5AA),
      Color(0xFF2CC0B7),
      Color(0xFF25849A),
      Color(0xFF1C4F75),
      Color(0xFF142850),
    ],
    tileMode: TileMode.mirror,
  );

  static const LinearGradient linearGradientContainerVibrant = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFF3FD6F),
      Color(0xFFCEFB6F),
      Color(0xFFA9F970),
      Color(0xFF87F770),
      Color(0xFF71F57D),
      Color(0xFF72F29E),
      Color(0xFF72F0BE),
      Color(0xFF73EEDC),
    ],
    tileMode: TileMode.mirror,
  );

  static const LinearGradient linearGradientContainerNeutral = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFF4C3E3E),
      Color(0xFF684B48),
      Color(0xFF875B4E),
      Color(0xFFA97052),
      Color(0xFFBF8C61),
      Color(0xFFD2A974),
      Color(0xFFE1C58B),
      Color(0xFFEDDEA4),
    ],
    tileMode: TileMode.mirror,
  );
}
