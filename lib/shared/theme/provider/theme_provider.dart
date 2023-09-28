import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/theme/theme_manager.dart';
import 'package:galaxy_18_lottery_app/shared/theme/theme_service.dart';

final themeProvider = Provider<ThemeService>((ref){
 final ThemeManager theme = ThemeManager();
 return theme;
});