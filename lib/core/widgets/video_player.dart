// import 'package:animeo/core/widgets/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import 'video_player_panel.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  // late FijkPlayer _c;
  late VideoPlayerController _controller;
  @override
  void initState() {
    Wakelock.enable();
    _controller = VideoPlayerController.network(
      widget.url,
    )
      ..initialize()
      ..play();

    // _c = FijkPlayer()
    //   ..setDataSource(
    //     "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    //     autoPlay: true,
    //   );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // _c.stop().then((value) {
    //   _c.dispose();
    // });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // Expanded(
          //   child: AspectRatio(
          //     aspectRatio: 16 / 9,
          //     child: FijkView(
          //       player: _c,
          //       color: Colors.black,
          //       fsFit: FijkFit.ar16_9,
          //       fit: FijkFit.ar16_9,
          //       panelBuilder: (player, data, context, viewSize, texturePos) {
          //         return VideoPlayerPanel(
          //           child: AspectRatio(
          //             aspectRatio: 16 / 9,
          //             child: FijkView(
          //               player: player,
          //               color: Colors.black,
          //               fsFit: FijkFit.ar16_9,
          //               fit: FijkFit.ar16_9,
          //               panelBuilder:
          //                   (player, data, context, viewSize, texturePos) {
          //                 return const SizedBox();
          //               },
          //             ),
          //           ),
          //           controller: CustomVideoController.fromVideoControllerType(
          //             CustomVideoControllerType.online(player),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
            child: VideoPlayerPanel(
              controller: CustomVideoController.fromVideoControllerType(
                CustomVideoControllerType.offline(_controller),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        ],
      )),
    );
  }
}
