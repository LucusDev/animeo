import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/utils/navigate.dart';
import 'package:animeo/core/widgets/appbar_button.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/headline.dart';
import 'package:animeo/core/widgets/tag.dart';
import 'package:animeo/core/widgets/video_player.dart';
import 'package:animeo/core/widgets/video_player_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWithImage(theme: theme, anime: anime),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SynopsisText(
                anime: anime,
                theme: theme,
              ),
            ),
            GenreRow(anime: anime),
            HeadLine(
              text: "${anime.totalEpisodes} Episodes",
              icon: const Icon(Icons.sort),
              onClick: () {
                //TODO sorting from top or bottom add
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return Container(
                //       width: 100.w,
                //       height: 30.h,
                //       child: Column(
                //         children: [],
                //       ),
                //     );
                //   },
                // );
              },
            ),
            EpisodeList(
              // hightlightEpisode: hightlightEpisode,
              hightlightEpisode: -1,
              theme: theme,
              anime: anime,
            )
          ],
        ),
      ),
    );
  }
}

class EpisodeList extends StatelessWidget {
  const EpisodeList({
    Key? key,
    required this.hightlightEpisode,
    required this.theme,
    required this.anime,
  }) : super(key: key);

  final int hightlightEpisode;
  final ThemeData theme;
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ScrollTag(
          scroll: hightlightEpisode == index,
          child: CustomTile(
            onTap: () {
              //TODO watch add
              navigate(
                context,
                page: CustomVideoPlayer(),
              );
              print("watch");
            },
            color: hightlightEpisode == index ? theme.primaryColor : null,
            title: Text(
              "Episode ${index + 1}",
              style: theme.textTheme.headline1!.copyWith(fontSize: 20),
            ),
            trailing: IconButton(
              iconSize: 30,
              onPressed: () {
                //TODO downloading add
                print("downloading");
              },
              icon: Icon(
                Icons.download_for_offline_outlined,
                color: hightlightEpisode == index
                    ? theme.textTheme.headline1!.color
                    : null,
              ),
            ),
          ),
        );
      },
      itemCount: anime.episodes.length,
    );
  }
}

class ScrollTag extends StatefulWidget {
  final Widget child;
  final bool scroll;
  const ScrollTag({
    Key? key,
    required this.child,
    this.scroll = false,
  }) : super(key: key);

  @override
  _ScrollTagState createState() => _ScrollTagState();
}

class _ScrollTagState extends State<ScrollTag> {
  @override
  void initState() {
    if (widget.scroll) {
      Future.delayed(Duration.zero).then((_) {
        Scrollable.ensureVisible(context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class GenreRow extends StatelessWidget {
  const GenreRow({
    Key? key,
    required this.anime,
  }) : super(key: key);

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        width: constraint.maxWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...anime.genres.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Tag(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    onClick: () {},
                    text: e,
                    isActive: true,
                  ),
                );
              })
            ],
          ),
        ),
      );
    });
  }
}

class SynopsisText extends StatefulWidget {
  const SynopsisText({
    Key? key,
    required this.anime,
    required this.theme,
  }) : super(key: key);

  final Anime anime;
  final ThemeData theme;

  @override
  State<SynopsisText> createState() => _SynopsisTextState();
}

class _SynopsisTextState extends State<SynopsisText> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expand = !expand;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Text(
                widget.anime.synopsis +
                    "\nAlternative Name: " +
                    widget.anime.otherName,
                style: widget.theme.textTheme.subtitle1,
                maxLines: expand ? 999 : 3,
              ),
              if (!expand)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: widget.theme.cardTheme.color!.withOpacity(0.5),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                      ),
                    ),
                  ),
                )
            ],
          ),
          if (expand)
            const Center(
              child: Icon(Icons.arrow_drop_up_outlined),
            ),
        ],
      ),
    );
  }
}

class HeaderWithImage extends StatelessWidget {
  const HeaderWithImage({
    Key? key,
    required this.theme,
    required this.anime,
  }) : super(key: key);

  final ThemeData theme;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.cardTheme.color!.withOpacity(0.6),
                  theme.cardTheme.color!,
                ],
              ).createShader(bounds);
            },
            child: CachedImage(url: anime.img),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              leading: const AppbarButton(),
              title: Text(
                anime.title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 20.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: CachedImage(url: anime.img)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        anime.title,
                        style: theme.textTheme.headline1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      anime.status,
                      style: theme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
