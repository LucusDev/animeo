import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../core/models/anime.dart';
import '../../../../core/network/core_repo.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/navigate.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/widgets/anime_detail_page.dart';
import '../../../../core/widgets/cached_image.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_tile.dart';
import '../../../../core/widgets/infinite_scroll_list.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../core/widgets/tag.dart';
import '../../../library/controller/library_provider.dart';
import '../../model/models/browse_network_page.dart';
import '../../model/network/network_repo.dart';

class BrowseTabPage extends StatefulWidget {
  const BrowseTabPage({
    Key? key,
    required this.getHomeTabType,
    this.changeGenre,
    this.changeSeason,
  }) : super(key: key);

  final BrowseNetworkPage Function(int pageNum) getHomeTabType;
  final void Function(Genres genres)? changeGenre;
  final void Function(
    Season? season,
    int? year,
  )? changeSeason;

  @override
  _BrowseTabPageState createState() => _BrowseTabPageState();
}

class _BrowseTabPageState extends State<BrowseTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => data.isNotEmpty;

  List<Anime> data = [];
  bool fetching = false;
  int pageNumber = 1;
  bool isError = false;
  bool isEnd = false;

  Future<void> refresh() async {
    pageNumber = 1;
    isEnd = false;
    fetching = false;
    data = [];
    updateKeepAlive();
    setState(() {});
  }

  Future<void> fetch(VisibilityInfo info) async {
    if (fetching) return;

    if (info.visibleFraction > 0.1) {
      // print("fetching");
      fetching = true;
      final result =
          await HomeNetworkRepo().get(widget.getHomeTabType(pageNumber));
      fetching = false;
      result.when(
        success: (value) {
          if (value.isEmpty) isEnd = true;
          // print("success");
          data.addAll(value);
          isError = false;
          if (mounted) {
            updateKeepAlive();
            setState(() {});
          }
        },
        error: (message) {
          if (!fetching) {
            fetching = true;
            Future.delayed(const Duration(seconds: 5)).then((_) {
              fetching = false;
              fetch(info);
              // print("refetching");
            });
          }
          // print("error");
          if (!isError) {
            isError = true;
            setState(() {});
          }
        },
      );
      if (isError) return;
      pageNumber++;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScaffold(
      bottomNavigationBar: isError
          ? FractionallySizedBox(
              widthFactor: 1,
              child: Text(
                'No connection',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          : null,
      child: Column(
        children: [
          widget.getHomeTabType(pageNumber).maybeMap(
            orElse: () {
              return const SizedBox();
            },
            genres: (value) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...Genres.values.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Tag(
                          onClick: () {
                            if (widget.changeGenre == null) return;
                            widget.changeGenre!(e);
                            refresh();
                          },
                          text: e.toValue().replaceAll('-', ' '),
                          isActive: value.genre == e,
                        ),
                      );
                    })
                  ],
                ),
              );
            },
            seasonal: (value) {
              Season? season;
              int? year;
              value.maybeWhen(
                orElse: () {},
                seasonal: (pageNum, ss, yy) {
                  season = ss;
                  year = yy;
                },
              );
              final totalYear = <int>[];
              for (var i = DateTime.now().year; i >= 2000; i--) {
                totalYear.add(i);
              }

              final totalSeasons = Season.values.length * totalYear.length;
              return Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return StatefulBuilder(builder: (context, setState) {
                            return AnimatedBuilder(
                                animation: animation,
                                child: Scaffold(
                                  body: CustomScaffold(
                                    appBar: AppBar(
                                      automaticallyImplyLeading: false,
                                      centerTitle: true,
                                      title: Text(
                                        'Seasons',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                value.maybeWhen(
                                                  orElse: () {},
                                                  seasonal: (pageNum, ss, yy) {
                                                    Navigator.pop(context);
                                                    if (ss == season &&
                                                        yy == year) return;
                                                    if (widget.changeSeason !=
                                                        null) {
                                                      widget.changeSeason!(
                                                        season,
                                                        year,
                                                      );
                                                    }
                                                    refresh();
                                                  },
                                                );
                                              },
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: CustomCard(
                                                  padding: EdgeInsets.zero,
                                                  child: Expanded(
                                                    child: Icon(
                                                      Icons.cancel,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    child: ListView.builder(
                                      itemBuilder: (context, i) {
                                        if (i == 0) {
                                          return ListTile(
                                            onTap: () {
                                              season = null;
                                              year = null;
                                              setState(() {});
                                            },
                                            title: Text(
                                              'Current Season',
                                              style: TextStyle(
                                                color: year == null &&
                                                        season == null
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : null,
                                              ),
                                            ),
                                          );
                                        }

                                        final index = i - 1;
                                        return ListTile(
                                          onTap: () {
                                            season = Season.values
                                                .elementAt(index % 4);
                                            year = totalYear
                                                .elementAt((index / 4).floor());
                                            setState(() {});
                                          },
                                          title: Text(
                                            '${Season.values.elementAt(index % 4).toValue().capitalize()} ${totalYear.elementAt((index / 4).floor())}',
                                            style: TextStyle(
                                              color: (year ==
                                                          totalYear.elementAt(
                                                              (index / 4)
                                                                  .floor()) &&
                                                      season ==
                                                          Season.values
                                                              .elementAt(
                                                                  index % 4))
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: totalSeasons + 1,
                                    ),
                                  ),
                                ),
                                builder: (context, c) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.ease),
                                    ),
                                    child: c,
                                  );
                                });
                          });
                        },
                      ));
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: Text(
                      (!(season == null || year == null))
                          ? '${season!.toValue().capitalize()} $year'
                          : 'Current Season',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: Consumer(builder: (context, ref, _) {
                return InfiniteScrollList(
                  onEnd: fetch,
                  totalCount: data.length,
                  isEnd: isEnd,
                  itemBuilder: (context, index) {
                    final strings = data.elementAt(index).title.split('\n');
                    int epNum = -1;
                    if (strings.length > 1) {
                      epNum = int.tryParse(strings
                              .elementAt(1)
                              .replaceAll('Episode-', '')) ??
                          -1;
                    }
                    return CustomTile(
                      onTap: () async {
                        final isInLibrary = ref
                                .read(libraryProvider)
                                .value[data.elementAt(index).id] !=
                            null;
                        if (isInLibrary) {
                          navigate(context,
                              page: AnimeDetailPage(
                                anime: ref
                                    .read(libraryProvider)
                                    .value[data.elementAt(index).id]!
                                    .anime,
                                hightlightEpisode: epNum - 1,
                              ));

                          return;
                        }
                        final result = await loading(
                          context,
                          CoreNetworkRepo()
                              .animeHandler(data.elementAt(index).id),
                        );
                        result.when(
                          success: (value) {
                            navigate(context,
                                page: AnimeDetailPage(
                                  anime: value,
                                  hightlightEpisode: epNum - 1,
                                ));
                          },
                          error: (message) {
                            showToast(
                                message:
                                    'Something is wrong! Please try again.');
                          },
                        );
                      },
                      leading: CustomCard(
                        padding: EdgeInsets.zero,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CachedImage(
                            url: data.elementAt(index).img,
                          ),
                        ),
                      ),
                      title: strings.isNotEmpty
                          ? Text(
                              strings.elementAt(0),
                              maxLines: 1,
                            )
                          : null,
                      // subtitle: Text("Released: ${data.elementAt(index).released}"),
                      subtitle: strings.length > 1
                          ? Text(
                              strings.elementAt(1),
                            )
                          : data.elementAt(index).released == 0
                              ? null
                              : Text(
                                  'Released: ${data.elementAt(index).released}'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Color.fromRGBO(80, 88, 253, 1),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
