import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/state.dart';
import '../model/models/settings.dart';
import '../utils/enums.dart';

class SettingsNotifier
    extends StateNotifier<StateWrapper<Settings, SettingsState>> {
  SettingsNotifier(Settings setting)
      : super(StateWrapper(
          value: setting,
          state: SettingsState.idle,
        ));

  Future<void> changeTheme(ThemeType type) async {
    state = state.setValue(await state.value.setTheme(type));
  }
}
