import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/models/result.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/infinite_scroll_list.dart';
import 'package:animeo/core/widgets/tag.dart';
import 'package:animeo/home/model/models/home_network_page.dart';
import 'package:animeo/home/model/network/network_repo.dart';
import 'package:animeo/home/view/widgets/home_tab_page.dart';
import 'package:animeo/search/model/models/search.dart';
import 'package:animeo/search/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final PageController _controller = PageController(
    keepPage: true,
  );
  Genres genre = Genres.action;
  late final pages = [
    HomeTabPage(
      getHomeTabType: (pageNum) {
        return HomeNetworkPage.recent(pageNum);
      },
    ),
    HomeTabPage(
      getHomeTabType: (pageNum) {
        return HomeNetworkPage.popular(pageNum);
      },
    ),
    HomeTabPage(
      getHomeTabType: (pageNum) {
        return HomeNetworkPage.seasonal(pageNum);
      },
    ),
    HomeTabPage(
      getHomeTabType: (pageNum) {
        return HomeNetworkPage.genres(pageNum, genre: genre);
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
                      onClick: () {
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage();
                      },
                    ));
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
