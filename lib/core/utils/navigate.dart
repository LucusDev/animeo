import 'package:flutter/material.dart';

enum NavType {
  material,
  slideUp,
}
void navigate(
  BuildContext context, {
  required Widget page,
  NavType navType = NavType.material,
}) {
  if (navType == NavType.material) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }
}
