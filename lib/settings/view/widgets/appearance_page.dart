import 'package:animeo/core/widgets/custom_tile.dart';
import 'package:animeo/core/widgets/appbar_button.dart';
import 'package:animeo/settings/controller/settings_provider.dart';
import 'package:animeo/settings/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppearancePage extends ConsumerWidget {
  const AppearancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        children: [
          CustomTile(
            title: Text(
              "Dark Mode",
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
            ),
            trailing: Consumer(builder: (context, ref, _) {
              return Switch.adaptive(
                activeColor: Theme.of(context).primaryColor,
                value:
                    ref.watch(settingsProvider).value.theme == ThemeType.dark,
                onChanged: (value) async {
                  ThemeType tt = ThemeType.light;
                  if (value) {
                    tt = ThemeType.dark;
                  }
                  await ref.read(settingsProvider.notifier).changeTheme(tt);
                },
              );
            }),
          ),
        ],
      ),
      appBar: AppBar(
        leading: const AppbarButton(),
        title: Text(
          "Appearance",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
