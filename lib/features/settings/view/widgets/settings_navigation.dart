import 'package:flutter/material.dart';

import '../settings_view.dart';

class SettingsNavigation extends StatelessWidget {
  const SettingsNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const SettingsView();
          },
        );
      },
    );
  }
}
