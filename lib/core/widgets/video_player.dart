import 'package:animeo/core/widgets/video_player_panel.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:sizer/sizer.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late FijkPlayer _c;
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4");

    _c = FijkPlayer()
      ..setDataSource(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        // autoPlay: true,
      );
    super.initState();
  }

// viewSize
  @override
  void dispose() {
    _c.stop().then((value) {
      _c.dispose();
    });
    super.dispose();
  }

// CustomVideoPlayerPanel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: VideoPlayerPanel(
              controller: CustomVideoController(),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: FijkView(
                  player: _c,
                  fsFit: FijkFit.ar16_9,
                  fit: FijkFit.ar16_9,
                  panelBuilder: (player, data, context, viewSize, texturePos) {
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: VideoPlayerPanel(
              controller: CustomVideoController(),
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
