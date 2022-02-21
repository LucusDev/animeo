import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/appbar_button.dart';
import '../../../../core/widgets/custom_tile.dart';
import '../../controller/settings_provider.dart';
import '../../utils/enums.dart';

class AppearancePage extends ConsumerWidget {
  const AppearancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        children: [
          CustomTile(
            title: Text(
              'Dark Mode',
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
          'Appearance',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
