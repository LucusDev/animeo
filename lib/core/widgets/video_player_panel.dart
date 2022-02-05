import 'package:animeo/core/utils/navigate.dart';
import 'package:animeo/core/widgets/appbar_button.dart';
import 'package:animeo/core/widgets/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:video_player/video_player.dart';

import 'package:fijkplayer/fijkplayer.dart';
part 'video_player_panel.freezed.dart';

String _printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String oneDigits(String s) {
    if (s.length > 1) {
      return s[0] == "0" ? s[1] : s;
    }
    return s;
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  String hour = twoDigits(duration.inHours);
  return "${hour == "00" ? "" : hour + ":"}${oneDigits(twoDigitMinutes)}:$twoDigitSeconds";
}

@freezed
abstract class CustomVideoControllerType with _$CustomVideoControllerType {
  const factory CustomVideoControllerType.online(FijkPlayer controller) =
      _Online;
  const factory CustomVideoControllerType.offline(
      VideoPlayerController controller) = _Offline;
}

class CustomVideoController {
  final VoidCallback play;
  final VoidCallback pause;
  final void Function(Duration duration) seekTo;
  final CustomVideoControllerType type;
  const CustomVideoController({
    required this.play,
    required this.pause,
    required this.seekTo,
    required this.type,
  });

  factory CustomVideoController.fromVideoControllerType(
    CustomVideoControllerType type,
  ) {
    return type.map(
      online: (value) {
        final controller = value.controller;
        return CustomVideoController(
          type: type,
          play: () {
            controller.start();
          },
          pause: () {
            controller.pause();
          },
          seekTo: (duration) {
            controller.seekTo(duration.inMilliseconds);
          },
        );
      },
      offline: (value) {
        final controller = value.controller;
        return CustomVideoController(
          type: type,
          play: () {
            controller.play();
          },
          pause: () {
            controller.pause();
          },
          seekTo: (duration) {
            controller.seekTo(duration);
          },
        );
      },
    );
  }
}

class VideoPlayerPanel extends StatefulWidget {
  final Widget child;
  final bool isFullScreen;
  final bool isPlaying;
  final CustomVideoController controller;
  final Duration currentDuration;
  final Duration totalDuration;

  const VideoPlayerPanel({
    Key? key,
    required this.child,
    required this.controller,
    this.isFullScreen = false,
    this.isPlaying = false,
    this.currentDuration = Duration.zero,
    this.totalDuration = Duration.zero,
  }) : super(key: key);

  @override
  _VideoPlayerPanelState createState() => _VideoPlayerPanelState();
}

class _VideoPlayerPanelState extends State<VideoPlayerPanel> {
  bool isPlaying = false;
  bool isSeeking = false;
  bool isHide = false;
  late bool isFullScreen;
  late Duration currentDuration;
  late Duration totalDuration;
  Duration seekDuration = Duration.zero;
  Duration beforeDuration = Duration.zero;
  Offset seekOffset = Offset.zero;
  @override
  void initState() {
    isFullScreen = widget.isFullScreen;
    currentDuration = widget.currentDuration;
    totalDuration = widget.totalDuration;
    widget.controller.type.when(
      online: (controller) {
        if (isFullScreen && widget.isPlaying) {
          Future.delayed(Duration.zero).then((value) => controller.start());
        }
        controller.addListener(() {
          totalDuration = controller.value.duration;
          isPlaying = controller.state == FijkState.started;
          controller.onCurrentPosUpdate.listen((posiion) {
            currentDuration = posiion;
            if (mounted) setState(() {});
          });
          if (mounted) setState(() {});
        });
      },
      offline: (controller) {
        if (!controller.value.isInitialized) {
          controller.initialize();
        }
        controller.addListener(() {
          totalDuration = controller.value.duration;
          isPlaying = controller.value.isPlaying;
          currentDuration = controller.value.position;
          if (mounted) setState(() {});
        });
      },
    );
    super.initState();
  }

  void enterFullScreen() {
    widget.controller.type.maybeWhen(
      orElse: () {
        pushFullScreenVideo(
          context,
          VideoPlayerPanel(
            isFullScreen: true,
            child: widget.child,
            controller: widget.controller,
            currentDuration: currentDuration,
            totalDuration: totalDuration,
          ),
        );
      },
      online: (controller) async {
        if (isPlaying) {
          await controller.pause();
        }
        pushFullScreenVideo(
          context,
          VideoPlayerPanel(
            isFullScreen: true,
            child: widget.child,
            controller: widget.controller,
            currentDuration: currentDuration,
            totalDuration: totalDuration,
            isPlaying: isPlaying,
          ),
        );
      },
    );
  }

  void exitFullScreen() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          isHide = true;
          setState(() {});
        },
        onLongPressStart: (details) {
          isHide = false;
          seekDuration = currentDuration;
          beforeDuration = currentDuration;
          seekOffset = details.localPosition;
          isSeeking = true;
          setState(() {});
        },
        onLongPressMoveUpdate: (details) {
          // final sValue = totalDuration.inMinutes != 0 ? 5 : 15;
          // final sValue = 5;
          final magicNum =
              ((details.localPosition.dx - seekOffset.dx) ~/ 5).clamp(
            -beforeDuration.inSeconds,
            (totalDuration.inSeconds - beforeDuration.inSeconds),
          );

          seekDuration = Duration(seconds: beforeDuration.inSeconds + magicNum);
          setState(() {});
        },
        onLongPressEnd: (detail) {
          isHide = false;
          currentDuration = seekDuration;
          isSeeking = false;
          widget.controller.seekTo(currentDuration);
        },
        child: CustomMultiChildLayout(
          delegate: CustomLayout(),
          children: [
            LayoutId(
              child: GestureDetector(
                child: Stack(
                  children: [
                    widget.child,
                    Positioned.fill(
                      child: FadeWidget(
                        isFade: isHide,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  isHide = false;
                  setState(() {});
                },
              ),
              id: "video",
            ),
            LayoutId(
              child: FadeWidget(
                isFade: isHide,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // enterFullScreen();
                      },
                      icon: const Icon(Icons.more_horiz),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              id: "header",
            ),
            LayoutId(
              child: GestureDetector(
                onTap: () {
                  isHide = !isHide;
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onDoubleTap: () {
                          widget.controller.seekTo(Duration(
                              seconds: currentDuration.inSeconds - 10));
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                      flex: 1,
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     widget.controller.seekTo(
                    //         Duration(seconds: currentDuration.inSeconds - 10));
                    //   },
                    //   icon: const Icon(Icons.replay_10),
                    // ),
                    FadeWidget(
                      isFade: isHide,
                      child: IconButton(
                        onPressed: () {
                          isPlaying
                              ? widget.controller.pause()
                              : widget.controller.play();
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 50,
                        ),
                      ),
                    ),

                    Flexible(
                      child: GestureDetector(
                        onDoubleTap: () {
                          widget.controller.seekTo(Duration(
                              seconds: currentDuration.inSeconds + 10));
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                      flex: 1,
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     widget.controller.seekTo(
                    //         Duration(seconds: currentDuration.inSeconds + 10));
                    //   },
                    //   icon: const Icon(Icons.forward_10),
                    // ),
                  ],
                ),
              ),
              id: "body",
            ),
            LayoutId(
              child: FadeWidget(
                isFade: isHide,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                                left: 8,
                                top: 0,
                              ),
                              // padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${isSeeking ? _printDuration(seekDuration) : _printDuration(currentDuration)}/${_printDuration(totalDuration)}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                                right: 8,
                                top: 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  isFullScreen
                                      ? exitFullScreen()
                                      : enterFullScreen();
                                },
                                child: Icon(
                                  isFullScreen
                                      ? Icons.fullscreen_exit
                                      : Icons.fullscreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: isFullScreen
                          ? const EdgeInsets.only(
                              bottom: 8.0, left: 8, right: 8)
                          : EdgeInsets.zero,
                      child: SizedBox(
                        height: 10,
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackShape: CustomTrackShape(),
                            trackHeight: 1.5,
                            thumbColor: Colors.red.shade900,
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: isFullScreen ? 7 : 0),
                            activeTrackColor: Colors.red.shade900,
                          ),
                          child: Slider(
                            value: isSeeking
                                ? seekDuration.inMilliseconds.toDouble().clamp(
                                    0, totalDuration.inMilliseconds.toDouble())
                                : currentDuration.inMilliseconds
                                    .toDouble()
                                    .clamp(
                                        0,
                                        totalDuration.inMilliseconds
                                            .toDouble()),
                            max: totalDuration.inMilliseconds.toDouble(),
                            onChangeStart: (value) {
                              isSeeking = true;
                              seekDuration = currentDuration;
                              setState(() {});
                            },
                            onChanged: (value) {
                              seekDuration =
                                  Duration(milliseconds: value.toInt());
                              setState(() {});
                            },
                            onChangeEnd: (value) {
                              isSeeking = false;
                              currentDuration =
                                  Duration(milliseconds: value.toInt());
                              widget.controller.seekTo(currentDuration);
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              id: "video_slider",
            ),
          ],
        ),
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
    layoutChild(
        "body",
        BoxConstraints(
          maxWidth: maxSize.width,
          maxHeight: maxSize.height / 5 * 3,
          minWidth: maxSize.width,
          minHeight: maxSize.height / 5 * 3,
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

    positionChild("body", Offset(0, appbarSize.height));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
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

class FadeWidget extends StatelessWidget {
  final bool isFade;
  final Widget child;
  const FadeWidget({
    Key? key,
    this.isFade = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 350,
      ),
      child: isFade ? const SizedBox() : child,
    );
  }
}
