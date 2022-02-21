import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/navigate.dart';
import '../../../core/widgets/anime_detail_page.dart';
import '../../../core/widgets/cached_image.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_tile.dart';
import '../../../core/widgets/tag.dart';
import '../controller/category_notifier.dart';
import '../controller/library_provider.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final categories = ref.watch(Category.categoryProvider).category;
    final current = ref.watch(Category.categoryProvider).current;

    final data = ref
        .watch(libraryProvider)
        .value
        .values
        .where((element) => element.category.contains(current))
        .map((e) => e.anime);

    return Scaffold(
      body: Column(
        children: [
          LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: constraint.maxWidth,
                child: Row(
                  children: [
                    ...categories.map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tag(
                            onClick: () {
                              ref.read(Category.categoryProvider).setCurrent =
                                  e;
                            },
                            text: e,
                            isActive: e == current,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tag(
                        onClick: () {
                          ref
                              .read(Category.categoryProvider)
                              .addCategory('reading');
                        },
                        text: '+',
                        isActive: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomTile(
                  onTap: () {
                    navigate(context,
                        page: AnimeDetailPage(
                          anime: data.elementAt(index),
                        ));
                  },
                  leading: CustomCard(
                    padding: EdgeInsets.zero,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CachedImage(
                        url: data.elementAt(index).img,
                      ),
                    ),
                  ),
                  title: Text(
                    data.elementAt(index).title,
                    maxLines: 1,
                  ),
                  subtitle: Text('Released: ${data.elementAt(index).released}'),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Color.fromRGBO(80, 88, 253, 1),
                  ),
                );
              },
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
