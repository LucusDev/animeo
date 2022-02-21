import 'package:hive/hive.dart';

import '../../../../core/models/anime.dart';

part 'library_anime.g.dart';

@HiveType(typeId: 10)
class LibraryAnime {
  const LibraryAnime({this.category = const ['default'], required this.anime});

  @HiveField(0)
  final List<String> category;

  @HiveField(1)
  final Anime anime;
}
