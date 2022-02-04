import 'package:animeo/bottom_navigation/controller/bottom_nav_provider.dart';
import 'package:animeo/bottom_navigation/view/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomScaffold extends ConsumerWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final Widget? appBar;
  final bool hideOnScroll;
  const CustomScaffold({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.hideOnScroll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return StreamBuilder<bool>(
        stream: hideOnScroll ? ref.watch(scrollStreamProvider).stream : null,
        initialData: true,
        builder: (context, snapshot) {
          bool show = true;

          if (snapshot.hasData) {
            show = (snapshot.data as bool);
          }

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
                child: show ? appBar ?? const SizedBox() : const SizedBox(),
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
                child: show
                    ? bottomNavigationBar ?? const SizedBox()
                    : const SizedBox(),
              ),
            ],
          );
        });
  }
}
