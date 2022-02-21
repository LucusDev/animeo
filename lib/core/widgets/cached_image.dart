import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';

import '../constants/names.dart';
import '../models/result.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    Key? key,
    required this.url,
    this.placeholder,
    this.error,
    this.progressIndicatorBuilder,
  }) : super(key: key);
  final String url;
  final Widget? placeholder;
  final Widget? error;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
      fit: BoxFit.cover,
      fadeInDuration: Duration.zero,
      placeholderFadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      placeholder: (context, url) => const AspectRatio(
        aspectRatio: 4 / 3,
        child: SizedBox.expand(),
      ),
      // progressIndicatorBuilder: progressIndicatorBuilder ??
      //     (context, url, progress) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           value: progress.progress,
      //         ),
      //       );
      //     },
      cacheManager: CacheManager(Config(
        Names.cachedManagerName,
        stalePeriod: const Duration(days: 365 * 5),
      )),
    );
  }

  Future<Result<bool>> copyToPath(String path) async {
    try {
      final cachedFile = await CacheManager(Config(
        Names.cachedManagerName,
        stalePeriod: const Duration(days: 365 * 5),
      )).getSingleFile(url);
      OpenFile.open(
        cachedFile.path,
      );

      // await cachedFile.copy(path);
      // final file = File(path);

      // if (!file.existsSync()) {
      //   await file.create(recursive: true);
      // }
      // if(file.existsSync()){
      //   file.c
      // }
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
