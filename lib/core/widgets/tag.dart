import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final VoidCallback onClick;
  final Color? backgroundColor;
  final Color? borderColor;
  final String text;
  final bool isActive;
  final EdgeInsets? padding;

  ///adding this will break the isActive Changes
  final TextStyle? textStyle;
  const Tag({
    Key? key,
    required this.onClick,
    this.backgroundColor,
    this.isActive = false,
    required this.text,
    this.padding,
    this.borderColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: isActive ? Colors.white : Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor ?? Theme.of(context).primaryColor,
              width: 1.5,
            ),
          ),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(
            !isActive
                ? Colors.transparent
                : backgroundColor ?? Theme.of(context).primaryColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
          )),
    );
  }
}
