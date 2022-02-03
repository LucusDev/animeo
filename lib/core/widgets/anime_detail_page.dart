import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/widgets/appbar_button.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class AnimeDetailPage extends StatelessWidget {
  const AnimeDetailPage({
    Key? key,
    required this.anime,
    this.hightlightEpisode = -1,
  }) : super(key: key);
  final Anime anime;
  final int hightlightEpisode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarButton(),
        title: Text(
          anime.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Stack(
        children: [
          CachedImage(
            url: anime.img,
          ),
          Column(
            children: [
              ElevatedButton(
                child: Text(anime.id),
                onPressed: () {},
              ),
              ...anime.episodes
                  .map((e) => ElevatedButton(child: Text(e), onPressed: () {})),
            ],
          ),
        ],
      ),
    );
  }
}
