import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../main.dart';
import '../../utils/enums.dart';
import '../database/settings_db.dart';
import 'themes.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
@immutable
class Settings {
  const Settings({
    this.theme = ThemeType.light,
  });
  Settings copyWith({
    ThemeType? theme,
  }) =>
      Settings(
        theme: theme ?? this.theme,
      );
  @HiveField(0)
  final ThemeType theme;

  ThemeData get getTheme {
    ThemeData themeData = CustomTheme().light;
    if (theme == ThemeType.dark) {
      themeData = CustomTheme.dark;
    }
    return themeData;
  }

  Future<Settings> setTheme(ThemeType theme) async {
    if (theme == this.theme) return this;
    final rV = copyWith(
      theme: theme,
    );

    await getIt<SettingsDb>().setSettings(rV);
    return rV;
  }
}
