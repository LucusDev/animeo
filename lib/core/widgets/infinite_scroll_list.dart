import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../features/bottom_navigation/controller/bottom_nav_provider.dart';

class InfiniteScrollList extends ConsumerStatefulWidget {
  const InfiniteScrollList({
    Key? key,
    required this.totalCount,
    required this.itemBuilder,
    required this.onEnd,
    this.isEnd = true,
    this.hideOnScroll = true,
  }) : super(key: key);

  final int totalCount;
  final bool isEnd;
  final bool hideOnScroll;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final void Function(VisibilityInfo info)? onEnd;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InfiniteScrollListState();
}

class _InfiniteScrollListState extends ConsumerState<InfiniteScrollList> {
  // double currentOffset = 0;
  bool isUp = true;
  final _c = ScrollController();
  @override
  void initState() {
    _c.addListener(() {
      final newOffset = _c.offset;
      final currentOffset = ref.read(scrollOffsetProvider);
      if ((currentOffset - newOffset).abs() > 50) {
        if (currentOffset > newOffset) {
          if (!isUp) {
            isUp = true;
            ref.read(scrollStreamProvider).sink.add(isUp);
          }
        } else {
          if (isUp) {
            isUp = false;
            ref.read(scrollStreamProvider).sink.add(isUp);
          }
        }
        ref.read(scrollOffsetProvider.notifier).setOffset = newOffset;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.hideOnScroll ? _c : null,
      itemBuilder: (context, index) {
        if (index == widget.totalCount && !widget.isEnd) {
          return VisibilityDetector(
            key: UniqueKey(),
            onVisibilityChanged: widget.onEnd,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return widget.itemBuilder(context, index);
      },
      itemCount: widget.totalCount + (widget.isEnd ? 0 : 1),
    );
  }
}
