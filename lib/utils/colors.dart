import 'package:flutter/material.dart';

class AppColors {
  static const Color red = Color(0xff6B1515);
  static const Color orange = Color(0xff8C3514);
  static const Color amber = Color(0xff7A4D1E);
  static const Color yellow = Color(0xff7D5C22);
  static const Color green = Color(0xff214F2C);
  static const Color emerald = Color(0xff1F4E36);
  static const Color teal = Color(0xff1B7A6F);
  static const Color cyan = Color(0xff1B8E9B);
  static const Color sky = Color(0xff378BAF);
  static const Color blue = Color(0xff1e5bc7);
  static const Color indigo = Color(0xff2D235B);
  static const Color purple = Color(0xff46235E);
  static const Color pink = Color(0xffA31546);
  static const Color rose = Color(0xff8C152C);
  static const Color slate = Color(0xff465A63);
  static const Color gray = Color(0xff1A1A1A);
  static const Color neutral = Color(0xff333333);
  static const Color black = Color(0xff000000);
  static const Color whiteNew = Color(0xffffffff);

  static Color _getShade(
    Color color, {
    bool darker = false,
    double value = .1,
  }) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value)).clamp(
        0.0,
        1.0,
      ),
    );

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> _colorShades = {
      50: _getShade(color, value: 0.72),
      100: _getShade(color, value: 0.65),
      200: _getShade(color, value: 0.6),
      300: _getShade(color, value: 0.5),
      400: _getShade(color, value: 0.4),
      500: _getShade(color, value: 0.3),
      600: _getShade(color, value: 0.2),
      700: _getShade(color, value: 0.15),
      800: _getShade(color, value: 0.1),
      900: color,
    };
    return MaterialColor(color.value, _colorShades);
  }

  //use shade colors as{AppColors.getMaterialColorFromColor(AppColors.red800).shade50;}
}
