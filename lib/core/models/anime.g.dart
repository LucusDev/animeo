// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final int typeId = 3;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      title: fields[0] as String,
      img: fields[1] as String,
      id: fields[9] as String,
      isFullInfo: fields[10] as bool,
      episodes: (fields[8] as List).cast<String>(),
      synopsis: fields[2] as String,
      genres: (fields[3] as List).cast<String>(),
      released: fields[4] as int,
      status: fields[5] as String,
      otherName: fields[6] as String,
      totalEpisodes: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.synopsis)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.released)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.otherName)
      ..writeByte(7)
      ..write(obj.totalEpisodes)
      ..writeByte(8)
      ..write(obj.episodes)
      ..writeByte(9)
      ..write(obj.id)
      ..writeByte(10)
      ..write(obj.isFullInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
