// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcase.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowcaseAdapter extends TypeAdapter<Showcase> {
  @override
  final int typeId = 3;

  @override
  Showcase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Showcase(
      displayShowCase: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Showcase obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.displayShowCase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowcaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
