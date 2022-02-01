import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class InfiniteScrollList extends StatelessWidget {
  final int totalCount;
  final bool isEnd;
  final ScrollController? controller;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final void Function(VisibilityInfo info)? onEnd;
  const InfiniteScrollList({
    Key? key,
    required this.totalCount,
    required this.itemBuilder,
    required this.onEnd,
    this.isEnd = true,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        if (index == totalCount && !isEnd) {
          return VisibilityDetector(
            key: UniqueKey(),
            onVisibilityChanged: onEnd,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return itemBuilder(context, index);
      },
      itemCount: totalCount + (isEnd ? 0 : 1),
    );
  }
}
