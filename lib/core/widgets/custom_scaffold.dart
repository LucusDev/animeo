import 'package:animeo/bottom_navigation/view/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final Widget? appBar;
  const CustomScaffold({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                ),
              ),
            );
          },
          duration: const Duration(milliseconds: 350),
          child: appBar ?? const SizedBox(),
        ),
        Expanded(child: child),
        AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                ),
              ),
            );
          },
          duration: const Duration(milliseconds: 350),
          child: bottomNavigationBar ?? const SizedBox(),
        ),
      ],
    );
  }
}
