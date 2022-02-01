import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/infinite_scroll_list.dart';
import 'package:animeo/core/widgets/tag.dart';
import 'package:animeo/home/model/network/network_repo.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<Anime> data = [];
  bool fetching = false;
  int pageNumber = 1;
  bool isError = false;
  @override
  void initState() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    super.initState();
  }

  Future<void> fetch(VisibilityInfo info) async {
    if (fetching) return;

    if (info.visibleFraction > 0.1) {
      // print("fetching");
      fetching = true;
      final result = await HomeNetworkRepo.getRecentEpisodes(pageNumber);
      fetching = false;
      result.when(
        success: (value) {
          // print("success");
          data.addAll(value);
          updateKeepAlive();
          isError = false;
          setState(() {});
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
    return Scaffold(
      body: CustomScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tag(
                      onClick: () {},
                      text: "Recent",
                      isActive: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tag(
                      onClick: () {},
                      text: "Subs",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tag(
                      onClick: () {},
                      text: "Dubs",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  pageNumber = 1;
                  fetching = false;
                  data = [];
                  updateKeepAlive();
                  setState(() {});
                },
                child: InfiniteScrollList(
                  onEnd: fetch,
                  totalCount: data.length,
                  isEnd: false,
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
                      subtitle: strings.length > 1
                          ? Text(
                              strings.elementAt(1),
                            )
                          : null,
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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Theme.of(context).primaryColorLight,
                child: Image.asset(
                  "assets/images/logo.png",
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          // title: Text(
          //   "Hello, Htet!",
          //   style: Theme.of(context).textTheme.headline1,
          // ),
          actions: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CustomCard(
                    padding: EdgeInsets.zero,
                    child: Expanded(
                      child: Icon(
                        Icons.notifications,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CustomCard(
                    padding: EdgeInsets.zero,
                    child: Expanded(
                      child: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CustomCard(
                    padding: EdgeInsets.zero,
                    child: Expanded(
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => data.isNotEmpty;
}
