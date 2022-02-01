import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_network_page.freezed.dart';

@freezed
class HomeNetworkPage with _$HomeNetworkPage {
  const factory HomeNetworkPage.recent(int pageNum) = Recent;
  const factory HomeNetworkPage.popular(int pageNum) = Popular;
  const factory HomeNetworkPage.seasonal(
    int pageNum, {
    Season? season,
    int? year,
  }) = Seasonal;
  const factory HomeNetworkPage.genres(
    int pageNum, {
    @Default(Genres.action) Genres genre,
  }) = Genre;
}

enum Season {
  spring,
  winter,
  summer,
  fall,
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
