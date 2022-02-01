import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_network_page.freezed.dart';

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
  // ignore: constant_identifier_names
  shoujo_ai,
  comedy,
  romance,
}

extension GenresExt on Genres {
  String toValue() {
    return toString().split(".").last.replaceAll("_", "-");
  }
}

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
