// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaEntityAdapter extends TypeAdapter<MediaEntity> {
  @override
  final int typeId = 2;

  @override
  MediaEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaEntity();
  }

  @override
  void write(BinaryWriter writer, MediaEntity obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
