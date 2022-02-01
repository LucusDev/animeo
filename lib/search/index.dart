import 'package:animeo/main.dart';
import 'package:animeo/search/model/database/search_db.dart';
import 'package:animeo/search/model/models/search.dart';
import 'package:hive/hive.dart';

class SearchFeature {
  static Future<void> init() async {
    Hive.registerAdapter(SearchAdapter());
    // Hive.registerAdapter(ThemeTypeAdapter());
    getIt.registerSingleton<SearchDB>(SearchDB());
    // getIt.registerSingleton<NavKey<SettingsNavigation>>(
    //     NavKey(key: GlobalKey<NavigatorState>()));
  }
}
