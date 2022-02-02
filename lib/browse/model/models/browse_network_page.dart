import 'package:freezed_annotation/freezed_annotation.dart';
part 'browse_network_page.freezed.dart';

@freezed
class BrowseNetworkPage with _$BrowseNetworkPage {
  const factory BrowseNetworkPage.recent(int pageNum) = Recent;
  const factory BrowseNetworkPage.popular(int pageNum) = Popular;
  const factory BrowseNetworkPage.seasonal(
    int pageNum, {
    Season? season,
    int? year,
  }) = Seasonal;
  const factory BrowseNetworkPage.genres(
    int pageNum, {
    @Default(Genres.action) Genres genre,
  }) = Genre;
}

enum Season {
  fall,
  summer,
  spring,
  winter,
}

extension SeasonExt on Season {
  String toValue() {
    return toString().split(".").last;
  }
}

enum Genres {
  action,
  adventure,
  cars,
  comedy,
  crime,
  dementia,
  demons,
  drama,
  dub,
  ecchi,
  family,
  fantasy,
  game,
  gourmet,
  harem,
  hentai,
  historical,
  horror,
  josei,
  kids,
  magic,
  // ignore: constant_identifier_names
  martial_arts,
  mecha,
  military,
  music,
  mystery,
  parody,
  police,
  psychological,
  romance,
  samurai,
  school,
  // ignore: constant_identifier_names
  sci_fi,
  seinen,
  shoujo,
  // ignore: constant_identifier_names
  shoujo_ai,
  shounen,
  // ignore: constant_identifier_names
  shounen_ai,
  // ignore: constant_identifier_names
  slice_of_life,
  space,
  sports,
  // ignore: constant_identifier_names
  super_power,
  supernatural,
  suspense,
  thriller,
  vampire,
  // ignore: constant_identifier_names
  work_life,
  yaoi,
  yuri,
}

extension GenresExt on Genres {
  String toValue() {
    return toString().split(".").last.replaceAll("_", "-");
  }
}
