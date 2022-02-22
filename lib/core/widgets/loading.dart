import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../constants/urls.dart';
import '../models/result.dart';
import '../utils/extensions.dart';

String fakeUserAgent() {
  final String a = faker.internet.userAgent();
  if (a.contains('Chrome/')) {
    if (int.parse(a.split('Chrome/').last.split('.').first) > 55) {
      return a;
    } else {
      return fakeUserAgent();
    }
  } else {
    return fakeUserAgent();
  }
}

enum WebViewLoadingType {
  download,
  stream,
}

class LoadingScreen<E> extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<Result<E>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<Result<E>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Navigator.of(context).pop(snapshot.data);
            return const SizedBox();
          }
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color!.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          );
        });
  }
}

// class WebViewLoading<E> extends StatefulWidget {
//   const WebViewLoading({
//     Key? key,
//     required this.url,
//     this.type = WebViewLoadingType.stream,
//   }) : super(key: key);
//   final String url;
//   final WebViewLoadingType type;
//   @override
//   State<WebViewLoading<E>> createState() => _WebViewLoadingState<E>();
// }

// class _WebViewLoadingState<E> extends State<WebViewLoading<E>> {
//   WebViewController? _c;
//   late String userAgent;
//   @override
//   void initState() {
//     userAgent = fakeUserAgent();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.transparent,
//         body: BackdropFilter(
//           filter: ImageFilter.blur(
//             sigmaX: 5,
//             sigmaY: 5,
//           ),
//           child: Stack(
//             children: [
//               SizedBox(
//                 width: 0,
//                 height: 0,
//                 child: WebView(
//                   userAgent: userAgent,
//                   initialUrl: widget.url.addPrefixToUrl(),
//                   javascriptMode: JavascriptMode.unrestricted,
//                   onPageStarted: (url) async {
//                     if (_c == null) return;
//                     if (!url.contains('gogoplay')) {
//                       await _c!.loadUrl(widget.url.addPrefixToUrl());
//                       return;
//                     }
//                   },
//                   onWebViewCreated: (controller) {
//                     _c = controller;
//                   },
//                   onProgress: (progress) {
//                     if (kDebugMode) {
//                       print(progress);
//                     }
//                   },
//                   onPageFinished: (url) async {
//                     if (_c == null) return;
//                     if (!url.contains('gogoplay')) return;
//                     if (widget.type == WebViewLoadingType.stream) {
//                       await _c!.runJavascript(
//                           'document.querySelector(".jw-icon.jw-icon-inline.jw-button-color.jw-reset.jw-icon-playback").click()');
//                       final jstring = await _c!.runJavascriptReturningResult(
//                           'window.document.body.innerHTML');
//                       final doc = parser.parse(json.decode(jstring));
//                       final videoTag = doc.getElementsByTagName('video');
//                       if (videoTag.isNotEmpty) {
//                         if (videoTag.first.attributes['src'] != null) {
//                           if (kDebugMode) {
//                             print(videoTag.first.attributes['src']);
//                           }
//                           if (!mounted) return;
//                           Navigator.of(context)
//                               .pop(videoTag.first.attributes['src']);
//                         } else {
//                           await _c!.loadUrl(widget.url.addPrefixToUrl());
//                         }
//                       }
//                     } else {
//                       final jstring = await _c!.runJavascriptReturningResult(
//                           'window.document.body.innerHTML');
//                       if (!mounted) return;

//                       Navigator.of(context).pop(json.decode(jstring));
//                     }
//                   },
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).cardTheme.color!.withOpacity(0.7),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const CircularProgressIndicator(),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

Future<Result<E>> loading<E>(
    BuildContext context, Future<Result<E>> future) async {
  final result = await Navigator.of(context).push<Result<E>>(PageRouteBuilder(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) {
      return LoadingScreen(
        future: future,
      );
    },
  ));
  if (result == null) {
    return Result.error(NullThrownError().toString());
  }
  return result;
}

Future<Result<String>> animeEpisodeHandler(String id) async {
  try {
    final res = await http.get(Uri.parse('${Urls.main}//$id'));
    String url = '';
    final body = res.body;
    final $ = parser.parse(body);
    $.querySelectorAll('div#wrapper_bg').asMap().forEach((index, element) {
      final $element = element;
      $element
          .querySelectorAll('div.anime_muti_link ul li')
          .asMap()
          .forEach((j, el) {
        final $el = el;
        // String? name = $el
        //     .querySelector('a')!
        //     .text
        //     .substring(0, $el.querySelector('a')!.text.lastIndexOf('C'))
        //     .trim();
        var iframe = $el.querySelector('a')!.attributes['data-video'];
        if (iframe!.startsWith('//')) {
          iframe =
              $el.querySelector('a')!.attributes['data-video']!.substring(2);
          if (iframe.contains('embedplus')) {
            // name = 'main';
          }
        }
        if (iframe.contains('gogoplay')) {
          url = iframe;
        }

        // servers.add(Servers(name: name, iframe: iframe));
      });
    });
    return Result.success(url);
    // return NetworkResult<Episode>(
    //     state: NetworkState.success,
    //     data: Episode(id: id, servers: servers, type: EpisodeType.iframe));
  } catch (e) {
    return const Result.error();
  }
}

Future<Result<String>> getStreamingLink(String iframeUrl) async {
  String rV = '';
  late final HeadlessInAppWebView headlessWebView;
  headlessWebView = HeadlessInAppWebView(
    initialUrlRequest: URLRequest(
      url: Uri.parse(
        iframeUrl.addPrefixToUrl(),
      ),
    ),
    onWebViewCreated: (controller) {},
    onLoadStart: (controller, url) async {
      if (!url.toString().contains('gogoplay')) {
        await controller.loadUrl(
            urlRequest: URLRequest(
          url: Uri.parse(
            iframeUrl.addPrefixToUrl(),
          ),
        ));
        return;
      }
    },
    onProgressChanged: (controller, progress) {
      if (kDebugMode) {
        print(progress);
      }
    },
    // ignore: no_leading_underscores_for_local_identifiers
    onLoadStop: (_c, url) async {
      try {
        if (!url.toString().contains('gogoplay')) return;
        await _c.evaluateJavascript(
            source:
                'document.querySelector(".jw-icon.jw-icon-inline.jw-button-color.jw-reset.jw-icon-playback").click()');

        final jstring = await _c
            .evaluateJavascript(source: '''window.document.body.innerHTML''');
        final doc = parser.parse(jstring);
        final videoTag = doc.getElementsByTagName('video');
        if (videoTag.isNotEmpty) {
          if (videoTag.first.attributes['src'] != null) {
            // if (kDebugMode) {
            // print('ans is here' + videoTag.first.attributes['src']!);
            rV = videoTag.first.attributes['src']!;
            _c.stopLoading();
            headlessWebView.dispose();
            // }
          } else {
            await _c.loadUrl(
              urlRequest: URLRequest(
                url: Uri.parse(
                  iframeUrl.addPrefixToUrl(),
                ),
              ),
            );
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('error$e');
        }
      }
    },
  );

  await headlessWebView.run();
  while (headlessWebView.isRunning()) {
    await Future.delayed(const Duration(milliseconds: 300));
  }
  return Result.success(rV);
}
