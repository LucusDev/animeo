import 'package:hive/hive.dart';

import '../../core/models/anime.dart';
import '../../main.dart';
import 'model/database/category_db.dart';
import 'model/database/library_db.dart';
import 'model/models/library_anime.dart';

class LibraryFeature {
  Future<void> init() async {
    Hive.registerAdapter(AnimeAdapter());
    Hive.registerAdapter(LibraryAnimeAdapter());
    getIt.registerSingleton<LibraryDb>(LibraryDb());
    getIt.registerSingleton<CategoryDb>(CategoryDb());
  }
}
