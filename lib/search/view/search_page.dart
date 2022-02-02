import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/headline.dart';
import 'package:animeo/core/widgets/infinite_scroll_list.dart';
import 'package:animeo/core/widgets/nav_back_button.dart';
import 'package:animeo/main.dart';
import 'package:animeo/search/controller/search_provider.dart';
import 'package:animeo/search/model/database/search_db.dart';
import 'package:animeo/search/model/network/search_network_repo.dart';
import 'package:animeo/search/view/widgets/search_history_page.dart';
import 'package:animeo/search/view/widgets/search_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _c = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isSearching = true;
  List<Anime> data = [];
  bool fetching = false;
  int pageNumber = 1;
  bool isError = false;
  bool isEnd = false;
  String lastSearch = "";
  Future<void> refresh() async {
    pageNumber = 1;
    isEnd = false;
    fetching = false;
    data = [];
    ref.read(searchProvider.notifier).addSearch(_c.text);
    setState(() {});
  }

  void onTapHistory(String value) {
    _c.text = value;
    isSearching = true;
    unFocus();
    refresh();
  }

  Future<void> fetch(VisibilityInfo info) async {
    if (fetching) return;

    if (info.visibleFraction > 0.1) {
      // print("fetching");
      fetching = true;
      final result = await SearchNetworkRepo.get(_c.text, pageNumber);
      fetching = false;
      result.when(
        success: (value) {
          if (value.isEmpty) isEnd = true;
          // print("success");
          data.addAll(value);
          isError = false;
          if (mounted) {
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

  void unFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void focus() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        isSearching = !_focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final historySearches =
        ref.watch(searchProvider).value.getSearch.reversed.toList();
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
                    Expanded(
                      child: TextField(
                        onTap: () {
                          isSearching = false;
                          setState(() {});
                        },
                        onSubmitted: (value) {
                          if (lastSearch != value) {
                            refresh();
                          }
                        },
                        autofocus: true,
                        focusNode: _focusNode,
                        controller: _c,
                        decoration: const InputDecoration(
                          hintText: "Search",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        isSearching = true;
                        unFocus();
                        refresh();
                      },
                      child: Hero(
                        tag: "search_icon",
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).textTheme.subtitle1!.color!,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          child: !isSearching
              ? SearchHistoryPage(
                  searches: historySearches,
                  onTap: onTapHistory,
                )
              : SearchResultPage(
                  data: data,
                  isEnd: isEnd,
                  isError: isError,
                  onEnd: fetch,
                  refresh: refresh,
                ),
        ),
      ),
    );
  }
}
