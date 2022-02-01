import 'package:animeo/core/constants/urls.dart';
import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/models/result.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class HomeNetworkRepo {
  ///get Recent Episodes
  static Future<Result<List<Anime>>> getRecentEpisodes(int pageNum) async {
    if (pageNum < 1) throw InvalidArgsError();
    String modifiedUrl = Urls.main + "/?page=$pageNum";

    try {
      final res = await http
          .get(
            Uri.parse(modifiedUrl),
          )
          .timeout(const Duration(seconds: 10));

      List<Anime> returnValue = [];
      final $ = parser.parse(res.body);
      $
          .querySelector('#load_recent_release')!
          .querySelectorAll('div.last_episodes ul li')
          .asMap()
          .forEach((key, value) {
        String img = "";
        String name = "";
        String? animeId;
        int episode = 0;
        final a = value.querySelector(".img a img");
        final b = value.querySelector(".episode");
        if (a != null) {
          img = (a.attributes['src']!);
          name = (a.attributes['alt']!);
        }
        if (b != null) {
          final regexp = RegExp(r'\d+');
          episode = int.parse(regexp.firstMatch(b.innerHtml)!.group(0)!);
        }
        final c = value.querySelector(".name a");
        if (c != null) {
          animeId = c.attributes['href']!.split('/').last;
          if (animeId.contains("episode")) {
            animeId = animeId.replaceAll(RegExp(r"-episode-.+"), "");
          }
        }
        returnValue.add(Anime(
          title: "$name\nEpisode-$episode",
          img: img,
          isFullInfo: false,
          id: animeId ?? "",
        ));
      });
      return Result.success(returnValue);
    } catch (e) {
      // print(e);
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
