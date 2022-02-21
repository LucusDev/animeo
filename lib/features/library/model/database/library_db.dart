import '../../../../core/constants/names.dart';
import '../../../../core/models/db.dart';
import '../../../../core/models/result.dart';

import '../models/library_anime.dart';

class LibraryDb extends Db<LibraryAnime> {
  LibraryDb({String? name}) : super(name: name ?? Names.libraryDBName);

  Future<void> addToLibrary(LibraryAnime anime) async {
    await auto(() async {
      await db.put(anime.anime.id, anime);
    });
  }

  Future<Result<LibraryAnime>> getOneAnime(String id) async {
    return auto(() async {
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

  Future<List<LibraryAnime>> getAll() async {
    return auto(() async {
      final rV = db.values;
      return rV.toList();
    });
  }

  Future<void> deleteAll() async {
    await auto(() async => db.clear());
  }
}
