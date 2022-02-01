import 'package:animeo/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({
    Key? key,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;
  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.23,
            color: Colors.black.withOpacity(1),
          ),
          // color: Theme.of(context).cardTheme.color,
        ),
        child: CustomCard(
          bgColor: Theme.of(context).cardTheme.color,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.children,
            ),
          ),
        ),
      ),
    );
  }
}
