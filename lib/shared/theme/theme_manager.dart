import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/theme/theme_service.dart';

class ThemeManager implements ThemeService{
   late List<Color> _colors;
  @override
  LinearGradient backgroundGradient() {
    return LinearGradient(
      colors: _colors,
      begin: const Alignment(0.00, -1.00),
      end: const Alignment(0, 1),
    );
  }

  @override
  set setColors(List<Color> colors) {
    _colors = colors;
  }
}
