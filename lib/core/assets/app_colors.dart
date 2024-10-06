import 'package:flutter/material.dart';

class AppColors {
  static const int _baseColor = 1000;
  static const int _colorCode10 = 10;
  static const int _colorCode20 = 20;
  static const int _colorCode30 = 30;
  static const int _colorCode40 = 40;
  static const int _colorCode50 = 50;
  static const int _colorCode60 = 60;
  static const int _colorCode70 = 70;
  static const int _colorCode80 = 80;
  static const int _colorCode90 = 90;
  static const int _colorCode100 = 100;
  static const Color _green = Color(0xFF11CE19);
  static const Color _red = Color(0xFFCC1010);
  static const Color _gray = Color(0xFF535353);
  static const Color _white = Color(0xFFF9F9F9);
  static const Color _lightBlue = Color(0xFFEDEFF3);
  static const Color _lightGreen = Color(0xFFCAF9CC);
  static const Color _lightRed = Color(0xFFF8D2D2);
  static const MaterialColor _blue = MaterialColor(
    0xFF02369C,
    <int, Color>{
      _baseColor: Color(0xFFCCD7EB),
      _colorCode10: Color(0xFFABBCDE),
      _colorCode20: Color(0xFF809ACD),
      _colorCode30: Color(0xFF5679BD),
      _colorCode40: Color(0xFF2C58AC),
      _colorCode50: Color(0xFF2C58AC),
      _colorCode60: Color(0xFF022D82),
      _colorCode70: Color(0xFF012468),
      _colorCode80: Color(0xFF011B4E),
      _colorCode90: Color(0xFF011234),
      _colorCode100: Color(0xFF000B1F),
    },
  );
  static const MaterialColor _black = MaterialColor(
    0xFF0F0F0F,
    <int, Color>{
      _baseColor: Color(0xFF0F0F0F),
      _colorCode10: Color(0xFFCFCFCF),
      _colorCode20: Color(0xFFAFAFAF),
      _colorCode30: Color(0xFF878787),
      _colorCode40: Color(0xFF5F5F5F),
      _colorCode50: Color(0xFF373737),
      _colorCode60: Color(0xFF0D0D0D),
      _colorCode70: Color(0xFF0A0A0A),
      _colorCode80: Color(0xFF080808),
      _colorCode90: Color(0xFF050505),
      _colorCode100: Color(0xFF030303),
    },
  );

  static int get baseColor => _baseColor;

  static int get colorCode10 => _colorCode10;

  static int get colorCode20 => _colorCode20;

  static int get colorCode30 => _colorCode30;

  static int get colorCode40 => _colorCode40;

  static int get colorCode50 => _colorCode50;

  static int get colorCode60 => _colorCode60;

  static int get colorCode70 => _colorCode70;

  static int get colorCode80 => _colorCode80;

  static int get colorCode90 => _colorCode90;

  static int get colorCode100 => _colorCode100;

  static Color get green => _green;

  static Color get red => _red;

  static Color get gray => _gray;

  static Color get white => _white;

  static Color get lightBlue => _lightBlue;

  static Color get lightGreen => _lightGreen;

  static Color get lightRed => _lightRed;

  static MaterialColor get blue => _blue;

  static MaterialColor get black => _black;
}
