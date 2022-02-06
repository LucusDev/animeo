import 'package:animeo/core/utils/navigate.dart';
import 'package:animeo/core/widgets/anime_detail_page.dart';
import 'package:animeo/core/widgets/cached_image.dart';
import 'package:animeo/core/widgets/custom_card.dart';
import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/library/controller/library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(libraryProvider).value.values;
    return Scaffold(
      body: Column(
        children: [
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
                  subtitle: Text("Released: ${data.elementAt(index).released}"),
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
