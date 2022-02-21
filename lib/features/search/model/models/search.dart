import 'package:hive/hive.dart';

import '../../../../main.dart';
import '../database/search_db.dart';

part 'search.g.dart';

@HiveType(typeId: 4)
class Search {
  const Search({
    this.searches = const [],
  });
  Search copyWith({
    List<String>? searches,
  }) =>
      Search(
        searches: searches ?? this.searches,
      );
  @HiveField(0)
  final List<String> searches;

  List<String> get getSearch {
    return searches;
  }

  Future<Search> setSearch(List<String> searches) async {
    final newSearch = [...this.searches];
    searches.forEach(newSearch.remove);

    final l = [...newSearch, ...searches.reversed];
    final rV = copyWith(
      searches: l.length > 20 ? l.sublist(0, 20) : l,
    );

    await getIt<SearchDB>().setSearch(rV);
    return rV;
  }

  Future<Search> deleteSearch(List<String> searches) async {
    final current = [...this.searches.reversed];
    searches.forEach(current.remove);

    final rV = copyWith(
      searches: current,
    );
    await getIt<SearchDB>().setSearch(rV);
    return rV;
  }
}
