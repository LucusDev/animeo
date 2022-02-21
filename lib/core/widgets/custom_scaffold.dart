import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/bottom_navigation/controller/bottom_nav_provider.dart';

class CustomScaffold extends ConsumerWidget {
  const CustomScaffold({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.hideOnScroll = false,
  }) : super(key: key);
  final Widget child;
  final Widget? bottomNavigationBar;
  final Widget? appBar;
  final bool hideOnScroll;

  @override
  Widget build(BuildContext context, ref) {
    return StreamBuilder<bool>(
        stream: hideOnScroll ? ref.watch(scrollStreamProvider).stream : null,
        initialData: true,
        builder: (context, snapshot) {
          bool show = true;

          if (snapshot.hasData) {
            show = (snapshot.data) ?? false;
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
                          end: Offset.zero,
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
                          end: Offset.zero,
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
