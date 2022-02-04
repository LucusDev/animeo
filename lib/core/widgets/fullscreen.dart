import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void pushFullScreenVideo(
  BuildContext context,
  Widget video,
) {
//This will help to hide the status bar and bottom bar of Mobile
//also helps you to set preferred device orientations like landscape

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );

//This will help you to push fullscreen view of video player on top of current page

  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constraint) {
                return SizedBox(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: video,
                    ),
                  ),
                );
              }),
            ));
      },
    ),
  ).then(
    (value) {
//This will help you to set previous Device orientations of screen so App will continue for portrait mode

      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          // DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
    },
  );
}
