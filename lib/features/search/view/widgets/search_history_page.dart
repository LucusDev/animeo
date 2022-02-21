import 'package:flutter/material.dart';

import '../../../../core/widgets/infinite_scroll_list.dart';

class SearchHistoryPage extends StatelessWidget {
  const SearchHistoryPage({
    Key? key,
    required this.searches,
    required this.onTap,
  }) : super(key: key);
  final void Function(String value) onTap;
  final List<String> searches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: InfiniteScrollList(
          totalCount: searches.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                searches.elementAt(index),
              ),
              onTap: () {
                onTap(searches.elementAt(index));
              },
              leading: const Icon(Icons.history),
              trailing: const Icon(Icons.north_west),
            );
          },
          onEnd: (info) {},
        ))
      ],
    );
  }
}
