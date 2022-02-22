import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

import 'core/models/nav_key.dart';
import 'features/bottom_navigation/view/bottom_navigation.dart';
import 'features/library/controller/category_notifier.dart';
import 'features/library/controller/library_notifier.dart';
import 'features/library/controller/library_provider.dart';
import 'features/library/index.dart';
import 'features/library/model/database/category_db.dart';
import 'features/library/model/database/library_db.dart';
import 'features/search/controller/search_notifier.dart';
import 'features/search/controller/search_provider.dart';
import 'features/search/index.dart';
import 'features/search/model/database/search_db.dart';
import 'features/settings/controller/settings_notifer.dart';
import 'features/settings/controller/settings_provider.dart';
import 'features/settings/index.dart';
import 'features/settings/model/database/settings_db.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  await SettingsFeature().init();
  await SearchFeature().init();
  await LibraryFeature().init();
  getIt.registerSingleton<NavKey<MyApp>>(
      NavKey(key: GlobalKey<NavigatorState>()));
}

Future<void> main() async {
  // Stream
  // Future.sync(() => null);
  await init();
  await CategoryDb().add('default');
  await getIt<LibraryDb>().deleteAll();

  runApp(
    ProviderScope(
      overrides: [
        searchProvider.overrideWithValue(
          SearchNotifier(await getIt<SearchDB>().getSearch()),
        ),
        Category.categoryProvider.overrideWithValue(
            Category(categories: await getIt<CategoryDb>().get())),
        libraryProvider.overrideWithValue(
            LibraryNotifier(await getIt<LibraryDb>().getAll())),
        settingsProvider.overrideWithValue(
            SettingsNotifier(await getIt<SettingsDb>().getSettings())),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
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
      builder: (BuildContext context, WidgetRef ref, _) {
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
