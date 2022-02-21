import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.child,
    this.bgColor,
    this.padding,
    this.text,
    this.textStyle,
  }) : super(key: key);

  final Widget? child;
  final Color? bgColor;
  final EdgeInsets? padding;
  final String? text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: bgColor ?? Theme.of(context).primaryColorLight,
        padding: padding ?? const EdgeInsets.all(15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            child ?? const SizedBox(),
            if (text != null)
              const SizedBox(
                width: 10,
              ),
            AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 350,
              ),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.horizontal,
                    child: SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    ),
                  ),
                );
              },
              child: text != null
                  ? Text(
                      text!,
                      style: textStyle ??
                          Theme.of(context).textTheme.headline6?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
