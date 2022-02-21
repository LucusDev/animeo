import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Text? subtitle;
  final Widget? trailing;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 75,
            minHeight: 50,
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 0.23,
                  color: Colors.black.withOpacity(0.3),
                ),
                color: color ?? Theme.of(context).cardTheme.color,
              ),
              width: width,
              height: height,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 60,
                      maxHeight: 60,
                    ),
                    child: leading ?? const SizedBox(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.headline1 ??
                                const TextStyle(),
                            child: title ?? const SizedBox(),
                          ),
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.subtitle1 ??
                                const TextStyle(),
                            child: subtitle ?? const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 50,
                      maxHeight: 50,
                    ),
                    child: trailing ?? const SizedBox(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
