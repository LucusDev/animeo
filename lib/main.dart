import 'package:animeo/bottom_navigation/view/bottom_navigation.dart';
import 'package:animeo/core/models/nav_key.dart';
import 'package:animeo/search/controller/search_notifier.dart';
import 'package:animeo/search/controller/search_provider.dart';
import 'package:animeo/search/index.dart';
import 'package:animeo/search/model/database/search_db.dart';
import 'package:animeo/settings/controller/settings_notifer.dart';
import 'package:animeo/settings/controller/settings_provider.dart';
import 'package:animeo/settings/index.dart';
import 'package:animeo/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:animeo/settings/model/database/settings_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  await SettingsFeature.init();
  await SearchFeature.init();
  getIt.registerSingleton<NavKey<MyApp>>(
      NavKey(key: GlobalKey<NavigatorState>()));
}

void main() async {
  await init();

  runApp(
    ProviderScope(
      overrides: [
        searchProvider.overrideWithValue(
          SearchNotifier(await getIt<SearchDB>().getSearch()),
        ),
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
          debugShowCheckedModeBanner: false,
          navigatorKey: getIt<NavKey<MyApp>>().key,
          theme: ref.watch(settingsProvider).value.getTheme,
          title: 'Animeo',
          home: const Scaffold(
            body: SafeArea(
              child: BottomNavigation(),
            ),
          ),
        );
      },
    );
  }
}
