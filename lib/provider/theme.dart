import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'database.dart';

final themesProvider = NotifierProvider<ThemesProvider, ThemeMode>(() {
  return ThemesProvider();
});

class ThemesProvider extends Notifier<ThemeMode> {

  @override
  ThemeMode build() {
    var themeMode = ref.read(databaseProvider).getPref('themeMode');
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void changeTheme(ThemeMode theme) async {
    state = theme;
    await ref.read(databaseProvider).putPref('themeMode', theme.name);
  }
}