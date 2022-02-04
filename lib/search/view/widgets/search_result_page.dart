import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/network/core_repo.dart';
import 'package:animeo/core/utils/navigate.dart';
import 'package:animeo/core/utils/toast.dart';
import 'package:animeo/core/widgets/anime_detail_page.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/headline.dart';
import 'package:animeo/core/widgets/infinite_scroll_list.dart';
import 'package:animeo/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    Key? key,
    required this.data,
    required this.isError,
    required this.isEnd,
    required this.refresh,
    required this.onEnd,
  }) : super(key: key);
  final List<Anime> data;
  final bool isError;
  final bool isEnd;
  final Future<void> Function() refresh;
  final void Function(VisibilityInfo info) onEnd;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadLine(
          text: "Result",
        ),
        Expanded(
          child: CustomScaffold(
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
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: InfiniteScrollList(
                      onEnd: onEnd,
                      totalCount: data.length,
                      isEnd: isEnd,
                      itemBuilder: (context, index) {
                        final strings = data.elementAt(index).title.split('\n');
                        return CustomTile(
                          onTap: () async {
                            final result = await loading(
                              context,
                              CoreNetworkRepo.animeHandler(
                                  data.elementAt(index).id),
                            );
                            result.when(
                              success: (value) {
                                navigate(context,
                                    page: AnimeDetailPage(
                                      anime: value,
                                      hightlightEpisode: -1,
                                    ));
                              },
                              error: (message) {
                                showToast(
                                    message:
                                        "Something is wrong! Please try again.");
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
                          subtitle: strings.length > 1
                              ? Text(
                                  strings.elementAt(1),
                                )
                              : Text(
                                  "Released: ${data.elementAt(index).released}"),
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
          ),
        ),
      ],
    );
  }
}
