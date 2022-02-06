import 'package:animeo/core/models/anime.dart';
import 'package:animeo/library/model/database/library_db.dart';
import 'package:animeo/main.dart';
import 'package:hive/hive.dart';

class LibraryFeature {
  static Future<void> init() async {
    Hive.registerAdapter(AnimeAdapter());
    getIt.registerSingleton<LibraryDb>(LibraryDb());
  }
}
