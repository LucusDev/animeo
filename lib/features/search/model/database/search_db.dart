import '../../../../core/constants/names.dart';
import '../../../../core/models/db.dart';
import '../models/search.dart';

class SearchDB extends Db<Search> {
  SearchDB() : super(name: Names.searchDBName);

  Future<void> setSearch(Search search) async {
    await auto(() async {
      await db.clear();
      await db.add(search);
    });
  }

  Future<void> resetDefault() async {
    await auto(() async {
      await db.clear();
    });
  }

  Future<Search> getSearch() async {
    Search rV = const Search();
    await auto(() async {
      if (db.isNotEmpty) {
        rV = db.values.first;
      }
    });
    return rV;
  }
}
