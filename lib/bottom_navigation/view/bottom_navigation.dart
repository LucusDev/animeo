import 'package:animeo/bottom_navigation/controller/bottom_nav_provider.dart';
import 'package:animeo/bottom_navigation/view/widgets/custom_bottom_navigation.dart';
import 'package:animeo/browse/view/browse_page.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/loading.dart';
import 'package:animeo/core/widgets/video_player_panel.dart';
import 'package:animeo/settings/view/widgets/settings_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  final PageController _c = PageController(
    keepPage: true,
  );

  int currentPage = 0;
  final pages = [
    const BrowsePage(),
    const SettingsNavigation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: CustomScaffold(
            hideOnScroll: true,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return pages.elementAt(index);
              },
              controller: _c,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
            ),
            bottomNavigationBar: CustomBottomNavigation(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = 0;
                    });

                    _c.jumpToPage(currentPage);
                  },
                  child: CustomCard(
                    text: currentPage != 0 ? null : "Home",
                    child: const Icon(Icons.home),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = 1;
                    });

                    _c.jumpToPage(currentPage);
                  },
                  child: CustomCard(
                    text: currentPage != 1 ? null : "My List",
                    child: const Icon(Icons.bookmark),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = 2;
                    });

                    _c.jumpToPage(currentPage);
                  },
                  child: CustomCard(
                    text: currentPage != 2 ? null : "Browse",
                    child: const Icon(CupertinoIcons.compass_fill),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = 3;
                    });
                    _c.animateToPage(currentPage,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn);
                    _c.jumpToPage(currentPage);
                  },
                  child: CustomCard(
                    text: currentPage != 3 ? null : "More",
                    child: const Icon(Icons.more_horiz),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
