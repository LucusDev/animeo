import 'dart:ui';

import 'package:animeo/core/models/result.dart';
import 'package:flutter/material.dart';

enum LoadingType {
  normal,
  webview,
}

class LoadingScreen<E> extends StatelessWidget {
  final Future<Result<E>> future;
  const LoadingScreen({
    Key? key,
    required this.future,
  }) : super(key: key);

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

class WebViewLoading<E> extends StatelessWidget {
  const WebViewLoading({
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
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).cardTheme.color!.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

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
