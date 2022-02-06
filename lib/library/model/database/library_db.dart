import 'package:animeo/core/constants/names.dart';
import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/models/db.dart';
import 'package:animeo/core/models/result.dart';

class LibraryDb extends Db<Anime> {
  LibraryDb() : super(name: Names.libraryDBName);

  Future<void> addToLibrary(Anime anime) async {
    await auto(() async {
      await db.put(anime.id, anime);
    });
  }

  Future<Result<Anime>> getOneAnime(String id) async {
    return await auto(() async {
      final rV = db.get(id);
      if (rV == null) return const Result.error();
      return Result.success(rV);
    });
  }

  Future<void> deleteOneAnime(String id) async {
    await auto(() async {
      await db.delete(id);
    });
  }

  Future<List<Anime>> getAll() async {
    return await auto(() async {
      final rV = db.values;
      return rV.toList();
    });
  }

  Future<void> deleteAll() async {
    await auto(() async => await db.clear());
  }
}
