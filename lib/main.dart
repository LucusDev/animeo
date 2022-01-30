import 'package:animeo/settings/controller/settings_notifer.dart';
import 'package:animeo/settings/controller/settings_provider.dart';
import 'package:animeo/settings/model/models/settings.dart';
import 'package:animeo/settings/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:animeo/settings/model/database/settings_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(ThemeTypeAdapter());
  getIt.registerSingleton<SettingsDb>(SettingsDb());
  await SettingsDb().init();
}

void main() async {
  await init();

  runApp(
    ProviderScope(
      overrides: [
        settingsProvider.overrideWithValue(
            SettingsNotifier(await getIt<SettingsDb>().getSettings())),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return MaterialApp(
          theme: ref.watch(settingsProvider).value.getTheme,
          title: 'Animeo',
          home: Scaffold(
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(settingsProvider.notifier)
                        .changeTheme(ThemeType.dark);
                  },
                  child: Text("change to dark mode"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(settingsProvider.notifier)
                        .changeTheme(ThemeType.light);
                  },
                  child: Text("change to light mode"),
                ),
                ElevatedButton(onPressed: () {}, child: Text("")),
                ElevatedButton(onPressed: () {}, child: Text("")),
                ElevatedButton(onPressed: () {}, child: Text("")),
              ],
            ),
          ),
        );
      },
    );
  }
}
