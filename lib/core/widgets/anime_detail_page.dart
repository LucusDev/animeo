import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../features/library/controller/library_provider.dart';
import '../../features/library/model/models/library_anime.dart';
import '../constants/state.dart';
import '../models/anime.dart';
import '../network/core_repo.dart';
import '../utils/navigate.dart';
import 'appbar_button.dart';
import 'cached_image.dart';
import 'custom_card.dart';
import 'custom_tile.dart';
import 'loading.dart';
import 'tag.dart';
import 'video_player.dart';

class AnimeDetailPage extends ConsumerStatefulWidget {
  const AnimeDetailPage({
    Key? key,
    required this.anime,
    this.hightlightEpisode = -1,
  }) : super(key: key);
  final Anime anime;
  final int hightlightEpisode;

  @override
  ConsumerState<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends ConsumerState<AnimeDetailPage> {
  final TempState filter = TempState();
  late Anime anime = widget.anime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: RefreshIndicator(
      color: theme.primaryColor,
      onRefresh: () async {
        final result = await CoreNetworkRepo().animeHandler(anime.id);
        result.when(
          success: (value) {
            anime = value;
            ref
                .read(libraryProvider.notifier)
                .addToLibrary(LibraryAnime(anime: value))
                .then((value) {
              if (kDebugMode) {
                print('success refreshing');
              }
            });
            setState(() {});
          },
          error: (message) {},
        );
      },
      child: AnimatedBuilder(
          animation: filter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8.0,
                      bottom: 4.0,
                    ),
                    child: Text(
                      '${anime.totalEpisodes} Episodes',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const Spacer(),
                  DropdownButton<bool>(
                    underline: const SizedBox(),
                    hint: const SizedBox(),
                    onChanged: (value) {
                      filter.setisOldFirst(value ?? filter.isOldFirst);
                    },
                    items: const [
                      DropdownMenuItem<bool>(
                        value: true,
                        child: Text('Older First'),
                      ),
                      DropdownMenuItem<bool>(
                        value: false,
                        child: Text('Newer First'),
                      ),
                    ],
                    icon: Icon(
                      Icons.sort,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
          builder: (context, c) {
            return ListView.builder(
              itemBuilder: (context, i) {
                if (i == 0) {
                  return c!;
                }
                int index = i - 1;
                if (!filter.isOldFirst) {
                  index = anime.episodes.length - i;
                }
                return ScrollTag(
                  child: CustomTile(
                    onTap: () async {
                      final iframe = await loading(context,
                          animeEpisodeHandler(anime.episodes.elementAt(index)));

                      iframe.when(
                        success: (value) async {
                          if (value.isNotEmpty) {
                            final uu = await Navigator.of(context)
                                .push<String>(PageRouteBuilder(
                              opaque: false,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return WebViewLoading(url: value);
                              },
                            ));
                            if (uu != null) {
                              if (!mounted) return;

                              navigate(
                                context,
                                page: CustomVideoPlayer(
                                  url: uu,
                                ),
                              );
                            }
                            // print();
                          }
                        },
                        error: (message) {},
                      );
                      //TODO watch add

                      if (kDebugMode) {
                        print('watch');
                      }
                    },
                    color: widget.hightlightEpisode == index
                        ? theme.primaryColor
                        : null,
                    title: Text(
                      'Episode ${index + 1}',
                      style: theme.textTheme.headline1!.copyWith(fontSize: 20),
                    ),
                    trailing: IconButton(
                      iconSize: 30,
                      onPressed: () {
                        //TODO downloading add
                        if (kDebugMode) {
                          print('downloading');
                        }
                      },
                      icon: Icon(
                        Icons.download_for_offline_outlined,
                        color: widget.hightlightEpisode == index
                            ? theme.textTheme.headline1!.color
                            : null,
                      ),
                    ),
                  ),
                );
              },
              itemCount: anime.episodes.length + 1,
            );
          }),
    ));
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
              // navigate(
              //   context,
              //   page: CustomVideoPlayer(),
              // );
              if (kDebugMode) {
                print('watch');
              }
            },
            color: hightlightEpisode == index ? theme.primaryColor : null,
            title: Text(
              'Episode ${index + 1}',
              style: theme.textTheme.headline1!.copyWith(fontSize: 20),
            ),
            trailing: IconButton(
              iconSize: 30,
              onPressed: () {
                //TODO downloading add
                if (kDebugMode) {
                  print('downloading');
                }
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
  const ScrollTag({
    Key? key,
    required this.child,
    this.scroll = false,
  }) : super(key: key);
  final Widget child;
  final bool scroll;

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
                '${widget.anime.synopsis}\nAlternative Name: ${widget.anime.otherName}',
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
            Consumer(
              builder: (context, ref, c) {
                // anime
                final isInLibrary =
                    ref.watch(libraryProvider).value[anime.id] != null;

                return AppBar(
                  backgroundColor: Colors.transparent,
                  leading: const AppbarButton(),
                  title: c,
                  actions: [
                    Row(
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                //TODO add library choosing dialog
                                return const AlertDialog();
                              },
                            );
                          },
                          onTap: () async {
                            if (isInLibrary) {
                              await ref
                                  .watch(libraryProvider.notifier)
                                  .deleteFromLibrary(anime.id);
                            } else {
                              await ref
                                  .watch(libraryProvider.notifier)
                                  .addToLibrary(LibraryAnime(anime: anime));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CustomCard(
                                padding: EdgeInsets.zero,
                                child: Expanded(
                                  child: Icon(
                                    isInLibrary
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              child: Text(
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
