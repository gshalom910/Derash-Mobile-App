// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmergencyAdapter extends TypeAdapter<Emergency> {
  @override
  final int typeId = 0;

  @override
  Emergency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emergency(
      name: fields[0] as String,
      iconUrl: fields[1] as String,
      description: (fields[2] as List).cast<dynamic>(),
      language: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Emergency obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.iconUrl)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmergencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
