import 'package:animeo/core/models/nav_key.dart';
import 'package:animeo/main.dart';
import 'package:animeo/settings/model/database/settings_db.dart';
import 'package:animeo/settings/model/models/settings.dart';
import 'package:animeo/settings/utils/enums.dart';
import 'package:animeo/settings/view/widgets/settings_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

///Initialize required things for settings to work
class SettingsFeature {
  static Future<void> init() async {
    Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(ThemeTypeAdapter());
    getIt.registerSingleton<SettingsDb>(SettingsDb());
    getIt.registerSingleton<NavKey<SettingsNavigation>>(
        NavKey(key: GlobalKey<NavigatorState>()));
  }
}
