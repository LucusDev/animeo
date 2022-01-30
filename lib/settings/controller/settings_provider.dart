import 'package:animeo/core/models/state.dart';
import 'package:animeo/settings/controller/settings_notifer.dart';
import 'package:animeo/settings/model/models/settings.dart';
import 'package:animeo/settings/utils/enums.dart';
import 'package:riverpod/riverpod.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier,
    StateWrapper<Settings, SettingsState>>(
  (ref) {
    throw UnimplementedError();
  },
);
