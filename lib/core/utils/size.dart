import 'package:flutter/cupertino.dart';

///GLobal class for accessing screen sizes
class ScreenSize {
  static double width = 0;
  static double height = 0;
  static double scaleFactor = 0;
  static Orientation orientation = Orientation.portrait;

  static void init(
      double width, double height, double scale, Orientation orientation) {
    ScreenSize.width = width;
    ScreenSize.height = height;
    ScreenSize.scaleFactor = scale;
    ScreenSize.orientation = orientation;
  }

  static void initWindow(MediaQueryData data) {
    ScreenSize.width = data.size.width;
    ScreenSize.height = data.size.height;
    ScreenSize.scaleFactor = data.textScaleFactor;
    ScreenSize.orientation = data.orientation;
  }
}

extension Sizes on num {
  double get w => (this / 100) * ScreenSize.width;

  double get h => (this / 100) * ScreenSize.height;

  double get rem => this * 14;
}

///Widget For Changing Size Changes(Combined Widget of [LayoutBuilder] and [OrientationBuilder]).If u dont wanna use this,Use [ScreenSize.initWindow] for custom changes.
class SizeWrapper extends StatelessWidget {
  final Widget child;
  final bool changeWidthAndHeightOnOrientation;
  const SizeWrapper({
    Key? key,
    required this.child,
    this.changeWidthAndHeightOnOrientation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
      ScreenSize.init(
        constraint.maxWidth,
        constraint.maxHeight,
        data.textScaleFactor,
        data.orientation,
      );
      return changeWidthAndHeightOnOrientation
          ? OrientationBuilder(
              builder: (context, orientation) {
                ScreenSize.init(
                  constraint.maxWidth,
                  constraint.maxHeight,
                  data.textScaleFactor,
                  orientation,
                );
                return child;
              },
            )
          : child;
    });
  }
}
