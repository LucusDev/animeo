import 'package:animeo/bottom_navigation/view/widgets/custom_bottom_navigation.dart';
import 'package:animeo/core/widgets/custom_scaffold.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/home/view/home_page.dart';
import 'package:animeo/search/view/search_page.dart';
import 'package:animeo/settings/view/widgets/settings_navigation.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageController _c = PageController(
    keepPage: true,
  );

  int currentPage = 0;
  final pages = [
    const SearchPage(),
    const HomePage(),
    const SettingsNavigation(),
    Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("1"),
          onPressed: () {},
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("2"),
          onPressed: () {},
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("3"),
          onPressed: () {},
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: CustomScaffold(
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
                  // _c.animateToPage(currentPage,
                  //     duration: const Duration(milliseconds: 350),
                  //     curve: Curves.easeIn);
                  _c.jumpToPage(currentPage);
                },
                child: CustomCard(
                  text: currentPage != 0 ? null : "home",
                  child: Icon(Icons.home),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 1;
                  });
                  // _c.animateToPage(currentPage,
                  //     duration: const Duration(milliseconds: 350),
                  //     curve: Curves.easeIn);
                  _c.jumpToPage(currentPage);
                },
                child: CustomCard(
                  text: currentPage != 1 ? null : "home",
                  child: Icon(Icons.home),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = 2;
                  });
                  // _c.animateToPage(currentPage,
                  //     duration: const Duration(milliseconds: 350),
                  //     curve: Curves.easeIn);
                  _c.jumpToPage(currentPage);
                },
                child: CustomCard(
                  text: currentPage != 2 ? null : "home",
                  child: Icon(Icons.home),
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
                  text: currentPage != 3 ? null : "home",
                  child: Icon(Icons.home),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
