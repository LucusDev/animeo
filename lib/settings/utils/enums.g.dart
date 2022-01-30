// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeTypeAdapter extends TypeAdapter<ThemeType> {
  @override
  final int typeId = 100;

  @override
  ThemeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeType.light;
      case 1:
        return ThemeType.dark;
      default:
        return ThemeType.light;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeType obj) {
    switch (obj) {
      case ThemeType.light:
        writer.writeByte(0);
        break;
      case ThemeType.dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsStateAdapter extends TypeAdapter<SettingsState> {
  @override
  final int typeId = 99;

  @override
  SettingsState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SettingsState.idle;
      case 1:
        return SettingsState.busy;
      default:
        return SettingsState.idle;
    }
  }

  @override
  void write(BinaryWriter writer, SettingsState obj) {
    switch (obj) {
      case SettingsState.idle:
        writer.writeByte(0);
        break;
      case SettingsState.busy:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
