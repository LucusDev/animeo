import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core/models/nav_key.dart';
import '../../main.dart';
import 'model/database/settings_db.dart';
import 'model/models/settings.dart';
import 'utils/enums.dart';
import 'view/widgets/settings_navigation.dart';

///Initialize required things for settings to work
class SettingsFeature {
  Future<void> init() async {
    Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(ThemeTypeAdapter());
    getIt.registerSingleton<SettingsDb>(SettingsDb());
    getIt.registerSingleton<NavKey<SettingsNavigation>>(
        NavKey(key: GlobalKey<NavigatorState>()));
  }
}
