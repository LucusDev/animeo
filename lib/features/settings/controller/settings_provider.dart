import 'package:riverpod/riverpod.dart';

import '../../../core/models/state.dart';
import '../model/models/settings.dart';
import '../utils/enums.dart';
import 'settings_notifer.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier,
    StateWrapper<Settings, SettingsState>>(
  (ref) {
    throw UnimplementedError();
  },
);
