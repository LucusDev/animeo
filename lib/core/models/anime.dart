// import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'anime.g.dart';

@immutable
@HiveType(typeId: 3)
class Anime extends Equatable {
  const Anime({
    required this.title,
    required this.img,
    required this.id,
    required this.isFullInfo,
    this.episodes = const <String>[],
    this.synopsis = '',
    this.genres = const <String>[],
    this.released = 0,
    this.status = 'unknown',
    this.otherName = '',
    this.totalEpisodes = 0,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    List<String> episodes = <String>[];
    String synopsis = '';
    String title = '';
    String img = '';
    String id = '';
    List<String> genres = <String>[];
    int released = 0;
    String status = 'unknown';
    String otherName = '';
    int totalEpisodes = 0;
    episodes = [
      ...(json['episodes'] as List<dynamic>).map((dynamic e) => '$e')
    ];
    synopsis = json['synopsis'] as String? ?? '';
    title = json['title'] as String? ?? '';
    img = json['img'] as String? ?? '';
    id = json['id'] as String? ?? '';
    genres = [...(json['genres'] as List<dynamic>).map((e) => '$e')];
    released = json['released'] as int? ?? 0;
    status = json['status'] as String? ?? 'unknown';
    totalEpisodes = json['totalEpisodes'] as int? ?? 0;
    otherName = json['otherName'] as String? ?? '';
    return Anime.fullInfoCheck(
      Anime(
          title: title,
          img: img,
          id: id,
          episodes: episodes,
          genres: genres,
          otherName: otherName,
          released: released,
          status: status,
          synopsis: synopsis,
          totalEpisodes: totalEpisodes,
          isFullInfo: false),
    );
  }
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String img;
  @HiveField(2)
  final String synopsis;
  @HiveField(3)
  final List<String> genres;
  @HiveField(4)
  final int released;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final String otherName;
  @HiveField(7)
  final int totalEpisodes;
  @HiveField(8)
  final List<String> episodes;
  @HiveField(9)
  final String id;
  @HiveField(10)
  final bool isFullInfo;

  Anime copyWith({
    String? title,
    String? img,
    String? id,
    bool? isFullInfo,
    List<String>? episodes,
    String? synopsis,
    List<String>? genres,
    int? released,
    String? status,
    String? otherName,
    int? totalEpisodes,
  }) {
    return Anime(
      title: title ?? this.title,
      img: img ?? this.img,
      id: id ?? this.id,
      isFullInfo: isFullInfo ?? this.isFullInfo,
      episodes: episodes ?? this.episodes,
      synopsis: synopsis ?? this.synopsis,
      genres: genres ?? this.genres,
      released: released ?? this.released,
      status: status ?? this.status,
      otherName: otherName ?? this.otherName,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
    );
  }

  static Anime fullInfoCheck(Anime val) {
    bool isFullInfo = true;
    if (val.title.isEmpty ||
        val.id.isEmpty ||
        val.img.isEmpty ||
        val.genres.isEmpty ||
        val.status == 'unknown') {
      isFullInfo = false;
    }

    return val.copyWith(isFullInfo: isFullInfo);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['img'] = img;
    data['synopsis'] = synopsis;
    data['genres'] = genres;
    data['released'] = released;
    data['status'] = status;
    data['otherName'] = otherName;
    data['totalEpisodes'] = totalEpisodes;
    data['id'] = id;
    data['isFullInfo'] = isFullInfo;
    data['episodes'] = episodes.map((String v) => v).toList();
    return data;
  }

  @override
  List<Object?> get props => <Object?>[
        id,
      ];
}
