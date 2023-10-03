import 'package:flutter/material.dart';

abstract class ThemeService {
  set setColors( List<Color> colors);
  LinearGradient backgroundGradient();
}