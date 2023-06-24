// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HospitalAdapter extends TypeAdapter<Hospital> {
  @override
  final int typeId = 2;

  @override
  Hospital read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hospital(
      name_en: fields[6] as String,
      name_am: fields[7] as String,
      location: (fields[1] as Map).cast<String, dynamic>(),
      phone: fields[2] as String,
      facebook: fields[3] as String,
      telegram: fields[4] as String,
    )..distance = fields[8] as double;
  }

  @override
  void write(BinaryWriter writer, Hospital obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.facebook)
      ..writeByte(4)
      ..write(obj.telegram)
      ..writeByte(6)
      ..write(obj.name_en)
      ..writeByte(7)
      ..write(obj.name_am)
      ..writeByte(8)
      ..write(obj.distance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HospitalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
