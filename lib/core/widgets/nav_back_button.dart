import 'package:flutter/material.dart';

class AppbarButton extends StatelessWidget {
  final VoidCallback? onClick;
  final Widget? child;

  const AppbarButton({
    Key? key,
    this.onClick,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onClick ??
            () {
              Navigator.of(context).pop();
            },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Theme.of(context).primaryColorLight,
            child: child ??
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
