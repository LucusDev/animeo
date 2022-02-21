import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    Key? key,
    this.icon,
    this.onClick,
    required this.text,
  }) : super(key: key);

  final Widget? icon;
  final VoidCallback? onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            bottom: 4.0,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const Spacer(),
        if (icon != null) IconButton(onPressed: onClick ?? () {}, icon: icon!)
      ],
    );
  }
}
