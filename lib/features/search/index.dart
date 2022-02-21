import 'package:hive/hive.dart';

import '../../main.dart';
import 'model/database/search_db.dart';
import 'model/models/search.dart';

class SearchFeature {
  Future<void> init() async {
    Hive.registerAdapter(SearchAdapter());
    // Hive.registerAdapter(ThemeTypeAdapter());
    getIt.registerSingleton<SearchDB>(SearchDB());
    // getIt.registerSingleton<NavKey<SettingsNavigation>>(
    //     NavKey(key: GlobalKey<NavigatorState>()));
  }
}
