import 'package:hive/hive.dart';
part 'enums.g.dart';

@HiveType(typeId: 100)
enum ThemeType {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
}

@HiveType(typeId: 99)
enum SettingsState {
  @HiveField(0)
  idle,
  @HiveField(1)
  busy,
}
