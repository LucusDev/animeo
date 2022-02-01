import 'package:animeo/core/widgets/custom_scaffold.dart';
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
                      Hero(
                        tag: "search_icon",
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).textTheme.subtitle1!.color!,
                        ),
                      ),
                    ],
                  )),
            ),
            child: Column(
              children: [
                // Expanded(child: Infi)
              ],
            )),
      ),
    );
  }
}
