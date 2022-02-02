import 'package:animeo/browse/model/models/browse_network_page.dart';
import 'package:animeo/core/constants/urls.dart';
import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/models/result.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class HomeNetworkRepo {
  ///get Recent Episodes
  static Future<Result<List<Anime>>> get(
      BrowseNetworkPage browseNetworkPage) async {
    String modifiedUrl = "";
    int pageNumber = 0;

    browseNetworkPage.when(
      recent: (pageNum) {
        pageNumber = pageNum;
        modifiedUrl = Urls.main + "/?page=$pageNum";
      },
      popular: (pageNum) {
        pageNumber = pageNum;
        modifiedUrl = Urls.main + "/popular.html?page=$pageNum";
      },
      seasonal: (pageNum, season, year) {
        pageNumber = pageNum;
        if (!(season == null || year == null)) {
          modifiedUrl = Urls.main +
              "/sub-category/${season.toValue()}-$year-anime?page=$pageNum";
        } else {
          modifiedUrl = Urls.main + "/new-season.html?page=$pageNum";
        }
      },
      genres: (pageNum, genre) {
        pageNumber = pageNum;
        modifiedUrl = Urls.main + "/genre/${genre.toValue()}?page=$pageNum";
      },
    );

    try {
      if (pageNumber < 1) throw InvalidArgsError();
      final res = await http
          .get(
            Uri.parse(modifiedUrl),
          )
          .timeout(const Duration(seconds: 10));

      List<Anime> returnValue = [];
      final $ = parser.parse(res.body);
      if ($.querySelector('#wrapper_bg') == null) {
        return Result.success(returnValue);
      }
      $
          .querySelector('#wrapper_bg')!
          .querySelectorAll('div.last_episodes ul li')
          .asMap()
          .forEach((key, value) {
        String img = "";
        String name = "";
        String? animeId;
        int episode = 0;
        int released = 0;
        final a = value.querySelector(".img a img");
        final b = value.querySelector(".episode");
        final r = value.querySelector(".released");
        if (r != null) {
          final regexp = RegExp(r'\d+');
          released = int.parse(regexp.firstMatch(r.innerHtml)?.group(0) ?? "0");
        }
        if (a != null) {
          img = (a.attributes['src'] ?? "");
          name = (a.attributes['alt'] ?? "");
        }
        if (b != null) {
          final regexp = RegExp(r'\d+');
          episode = int.parse(regexp.firstMatch(b.innerHtml)?.group(0) ?? "0");
        }
        final c = value.querySelector(".name a");
        if (c != null) {
          animeId = c.attributes['href']!.split('/').last;
          if (animeId.contains("episode")) {
            animeId = animeId.replaceAll(RegExp(r"-episode-.+"), "");
          }
        }
        returnValue.add(Anime(
          title: name + (episode == 0 ? "" : "\nEpisode-$episode"),
          img: img,
          released: released,
          isFullInfo: false,
          id: animeId ?? "",
        ));
      });
      // print(returnValue);
      return Result.success(returnValue);
    } catch (e) {
      print(e);
      if (e is InvalidArgsError) return Result.error(e.toString());
      return const Result.error(
          "Something is wrong!,Please check your internet connection and try again.");
    }
  }
}

class InvalidArgsError extends Error {
  String? message;
  InvalidArgsError([this.message]);

  @override
  String toString() {
    return message ?? "Please provide vaild arguments";
  }
}
