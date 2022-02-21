// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LibraryAnimeAdapter extends TypeAdapter<LibraryAnime> {
  @override
  final int typeId = 10;

  @override
  LibraryAnime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LibraryAnime(
      category: (fields[0] as List).cast<String>(),
      anime: fields[1] as Anime,
    );
  }

  @override
  void write(BinaryWriter writer, LibraryAnime obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.anime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibraryAnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
