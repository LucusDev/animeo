import 'package:animeo/core/models/state.dart';
import 'package:animeo/settings/model/models/settings.dart';
import 'package:animeo/settings/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
