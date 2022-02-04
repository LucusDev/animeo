import 'package:animeo/core/widgets/appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:video_player/video_player.dart';

import 'package:fijkplayer/fijkplayer.dart';

class CustomVideoController {
  // final VoidCallback play;
  // final VoidCallback pause;
  // final VoidCallback enterFullScreen;
  // final VoidCallback exitFullScreen;

  // const CustomVideoController({
  //   required this.play,
  //   required this.pause,
  //   required this.enterFullScreen,
  //   required this.exitFullScreen,
  // });
}

class VideoPlayerPanel extends StatefulWidget {
  final Widget child;
  final CustomVideoController controller;
  const VideoPlayerPanel({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  _VideoPlayerPanelState createState() => _VideoPlayerPanelState();
}

class _VideoPlayerPanelState extends State<VideoPlayerPanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomMultiChildLayout(
        delegate: CustomLayout(),
        children: [
          LayoutId(
            child: widget.child,
            id: "video",
          ),
          LayoutId(
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            id: "header",
          ),
          LayoutId(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.replay_10),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.forward_10),
                ),
              ],
            ),
            id: "body",
          ),
          LayoutId(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "4:37/44:07",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.fullscreen),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackShape: CustomTrackShape(),
                      trackHeight: 1.5,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 7),
                      activeTrackColor: Colors.yellow,
                    ),
                    child: Slider(
                      value: 1,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            id: "video_slider",
          ),
        ],
      )),
    );
  }
}

class CustomLayout extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final maxSize = layoutChild("video", BoxConstraints.loose(size));
    final appbarSize = layoutChild(
        "header",
        BoxConstraints(
          maxWidth: maxSize.width,
          maxHeight: maxSize.height / 5 * 1,
          minWidth: maxSize.width,
          minHeight: maxSize.height / 5 * 1,
        ));
    positionChild("header", const Offset(0, 0));
    final sliderSize = layoutChild(
        "video_slider",
        BoxConstraints(
          maxWidth: maxSize.width,
          maxHeight: maxSize.height / 5 * 1,
          minWidth: maxSize.width,
          minHeight: maxSize.height / 5 * 1,
        ));
    positionChild(
      "video_slider",
      Offset(0, maxSize.height - sliderSize.height),
    );
    layoutChild(
        "body",
        BoxConstraints(
          maxWidth: maxSize.width,
          maxHeight: maxSize.height / 5 * 3,
          minWidth: maxSize.width,
          minHeight: maxSize.height / 5 * 3,
        ));

    positionChild("body", Offset(0, appbarSize.height));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + 3 + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
