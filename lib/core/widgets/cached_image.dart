import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final Widget? placeholder;
  final Widget? error;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;

  const CachedImage({
    Key? key,
    required this.url,
    this.placeholder,
    this.error,
    this.progressIndicatorBuilder,
  }) : super(key: key);

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
      placeholder: (context, url) => const SizedBox.expand(),
      // progressIndicatorBuilder: progressIndicatorBuilder ??
      //     (context, url, progress) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           value: progress.progress,
      //         ),
      //       );
      //     },
      cacheManager: CacheManager(Config(
        url,
        stalePeriod: const Duration(days: 365 * 5),
      )),
    );
  }
}
