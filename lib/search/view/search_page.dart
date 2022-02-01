import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/infinite_scroll_list.dart';
import 'package:animeo/core/widgets/nav_back_button.dart';
import 'package:animeo/search/controller/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searches = ref.watch(searchProvider).value.getSearch;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScaffold(
            appBar: AppBar(
              leading: const AppbarButton(),
              title: Container(
                  decoration: BoxDecoration(
                    // border: Border.all(width: 2, color: Colors.white),
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(searchProvider.notifier)
                              .addSearch("testing");
                        },
                        child: Hero(
                          tag: "search_icon",
                          child: Icon(
                            Icons.search,
                            color:
                                Theme.of(context).textTheme.subtitle1!.color!,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    bottom: 4.0,
                  ),
                  child: Text(
                    "Result",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Expanded(
                    child: InfiniteScrollList(
                  totalCount: searches.length,
                  itemBuilder: (context, index) {
                    return const CustomTile(
                      title: Text("One Punch Man"),
                      subtitle: Text("Episode-1"),
                      leading: CustomCard(
                        padding: EdgeInsets.zero,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CachedImage(
                            url:
                                'https://i.pinimg.com/originals/62/3a/a8/623aa8f9933ee9a286871bf6e0782538.jpg',
                          ),
                        ),
                      ),
                    );
                    // return ListTile(
                    //   title: Text(
                    //     searches.elementAt(index),
                    //   ),
                    //   leading: const Icon(Icons.history),
                    //   trailing: const Icon(Icons.north_west),
                    // );
                  },
                  onEnd: (info) {},
                  isEnd: true,
                ))
              ],
            )),
      ),
    );
  }
}
