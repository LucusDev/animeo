import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/infinite_scroll_list.dart';
import 'package:animeo/core/widgets/tag.dart';
import 'package:animeo/home/model/models/home_network_page.dart';
import 'package:animeo/home/model/network/network_repo.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeTabPage extends StatefulWidget {
  final HomeNetworkPage Function(int pageNum) getHomeTabType;
  final void Function(Genres genres)? changeGenre;
  const HomeTabPage({
    Key? key,
    required this.getHomeTabType,
    this.changeGenre,
  }) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
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
          await HomeNetworkRepo.get(widget.getHomeTabType(pageNumber));
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
                "No connection",
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
                          text: e.toValue().replaceAll("-", " "),
                          isActive: value.genre == e,
                        ),
                      );
                    })
                  ],
                ),
              );
            },
            seasonal: (value) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
              );
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: InfiniteScrollList(
                onEnd: fetch,
                totalCount: data.length,
                isEnd: isEnd,
                itemBuilder: (context, index) {
                  final strings = data.elementAt(index).title.split('\n');
                  return CustomTile(
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
                        : Text("Released: ${data.elementAt(index).released}"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Color.fromRGBO(80, 88, 253, 1),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
