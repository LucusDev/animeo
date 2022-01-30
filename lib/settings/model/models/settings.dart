import 'package:animeo/core/models/state.dart';
import 'package:animeo/main.dart';
import 'package:animeo/settings/model/database/settings_db.dart';
import 'package:animeo/settings/model/models/themes.dart';
import 'package:animeo/settings/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'settings.g.dart';

@HiveType(typeId: 0)
@immutable
class Settings {
  //Theme
  @HiveField(0)
  final ThemeType theme;

  ThemeData get getTheme {
    ThemeData themeData = CustomTheme.light;
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
  //TODO add other settings here

  const Settings({
    this.theme = ThemeType.light,
  });
  Settings copyWith({
    ThemeType? theme,
  }) =>
      Settings(
        theme: theme ?? this.theme,
      );
}
