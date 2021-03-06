import 'package:animeo/core/constants/names.dart';
import 'package:animeo/core/models/db.dart';
import 'package:animeo/settings/model/models/settings.dart';

class SettingsDb extends Db<Settings> {
  SettingsDb() : super(name: Names.settingsDBName);

  Future<Settings> getSettings() async {
    Settings rV = const Settings();
    await auto(() async {
      if (db.isNotEmpty) {
        rV = db.values.first;
      }
    });
    return rV;
  }

  Future<void> setSettings(Settings settings) async {
    await auto(() async {
      await db.clear();
      await db.add(settings);
    });
  }

  Future<void> resetDefault() async {
    await auto(() async {
      await db.clear();
      await db.add(const Settings());
    });
  }
}
