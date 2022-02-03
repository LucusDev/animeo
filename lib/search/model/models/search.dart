import 'package:animeo/main.dart';
import 'package:animeo/search/model/database/search_db.dart';
import 'package:hive/hive.dart';
part 'search.g.dart';

@HiveType(typeId: 4)
class Search {
  @HiveField(0)
  final List<String> searches;

  List<String> get getSearch {
    return searches;
  }

  Future<Search> setSearch(List<String> searches) async {
    final newSearch = [...this.searches];
    for (var element in searches) {
      newSearch.remove(element);
    }
    final l = [...newSearch, ...searches.reversed];
    final rV = copyWith(
      searches: l.length > 20 ? l.sublist(0, 20) : l,
    );
    await getIt<SearchDB>().setSearch(rV);
    return rV;
  }

  Future<Search> deleteSearch(List<String> searches) async {
    final current = [...this.searches.reversed];

    for (var s in searches) {
      current.remove(s);
    }

    final rV = copyWith(
      searches: current,
    );
    await getIt<SearchDB>().setSearch(rV);
    return rV;
  }

  const Search({
    this.searches = const [],
  });
  Search copyWith({
    List<String>? searches,
  }) =>
      Search(
        searches: searches ?? this.searches,
      );
}
