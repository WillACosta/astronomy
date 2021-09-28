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
      displayHomeShowcase: fields[0] as bool,
      displayGridShowcase: fields[1] as bool,
      displayGridDetailShowcase: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Showcase obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.displayHomeShowcase)
      ..writeByte(1)
      ..write(obj.displayGridShowcase)
      ..writeByte(2)
      ..write(obj.displayGridDetailShowcase);
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
