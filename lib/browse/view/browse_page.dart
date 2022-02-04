import 'package:animeo/bottom_navigation/controller/bottom_nav_provider.dart';
import 'package:animeo/core/utils/navigate.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/tag.dart';
import 'package:animeo/browse/model/models/browse_network_page.dart';
import 'package:animeo/browse/view/widgets/browse_tab_page.dart';
import 'package:animeo/search/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:sizer/sizer.dart';

class BrowsePage extends ConsumerStatefulWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  ConsumerState<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends ConsumerState<BrowsePage>
    with AutomaticKeepAliveClientMixin {
  final PageController _controller = PageController(
    keepPage: true,
  );
  Season? season;
  int? year;
  Genres genre = Genres.action;
  late final pages = [
    BrowseTabPage(
      getHomeTabType: (pageNum) {
        return BrowseNetworkPage.recent(pageNum);
      },
    ),
    BrowseTabPage(
      getHomeTabType: (pageNum) {
        return BrowseNetworkPage.popular(pageNum);
      },
    ),
    BrowseTabPage(
      getHomeTabType: (pageNum) {
        return BrowseNetworkPage.seasonal(
          pageNum,
          season: season,
          year: year,
        );
      },
      changeSeason: (season, year) {
        this.season = season;
        this.year = year;
        setState(() {});
      },
    ),
    BrowseTabPage(
      getHomeTabType: (pageNum) {
        return BrowseNetworkPage.genres(pageNum, genre: genre);
      },
      changeGenre: (genres) {
        setState(() {
          genre = genres;
        });
      },
    ),
  ];
  int currentPage = 0;
  @override
  void initState() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScaffold(
        hideOnScroll: true,
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
                      onClick: () {
                        ref.read(scrollOffsetProvider.notifier).setOffset(0);
                        ref.read(scrollStreamProvider).sink.add(true);
                        currentPage = 0;
                        _controller.animateToPage(0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                        setState(() {});
                      },
                      text: "Recent",
                      isActive: currentPage == 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tag(
                      onClick: () {
                        ref.read(scrollOffsetProvider.notifier).setOffset(0);
                        ref.read(scrollStreamProvider).sink.add(true);
                        currentPage = 1;
                        _controller.animateToPage(1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);

                        setState(() {});
                      },
                      text: "Popular",
                      isActive: currentPage == 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tag(
                      onClick: () {
                        ref.read(scrollOffsetProvider.notifier).setOffset(0);
                        ref.read(scrollStreamProvider).sink.add(true);
                        currentPage = 2;
                        _controller.animateToPage(2,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);

                        setState(() {});
                      },
                      text: "Seasonal",
                      isActive: currentPage == 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tag(
                      onClick: () {
                        ref.read(scrollOffsetProvider.notifier).setOffset(0);
                        ref.read(scrollStreamProvider).sink.add(true);
                        currentPage = 3;
                        _controller.animateToPage(3,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);

                        setState(() {});
                      },
                      text: "Genre",
                      isActive: currentPage == 3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return pages.elementAt(index);
                },
                controller: _controller,
                itemCount: pages.length,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
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
                GestureDetector(
                  onTap: () {
                    navigate(context, page: const SearchPage());
                  },
                  child: Hero(
                    tag: "search_icon",
                    child: SizedBox(
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
  bool get wantKeepAlive => true;
}
