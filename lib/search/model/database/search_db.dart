import 'package:animeo/core/constants/names.dart';
import 'package:animeo/core/models/db.dart';
import 'package:animeo/search/model/models/search.dart';

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
        print("getting searches");
        rV = db.values.first;
      }
    });
    return rV;
  }
}
