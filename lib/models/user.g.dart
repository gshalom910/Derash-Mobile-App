// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..userName = fields[0] as String
      ..sex = fields[19] as int
      ..age = fields[2] as String
      ..profileImageUrl = fields[3] as String
      ..bloodGroup = fields[4] as String
      ..emergencyContacts = (fields[5] as List).cast<dynamic>()
      ..allergies = (fields[6] as List).cast<dynamic>()
      ..medicalConditions = (fields[7] as List).cast<dynamic>()
      ..currentMedications = (fields[8] as List).cast<dynamic>();
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(19)
      ..write(obj.sex)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.profileImageUrl)
      ..writeByte(4)
      ..write(obj.bloodGroup)
      ..writeByte(5)
      ..write(obj.emergencyContacts)
      ..writeByte(6)
      ..write(obj.allergies)
      ..writeByte(7)
      ..write(obj.medicalConditions)
      ..writeByte(8)
      ..write(obj.currentMedications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
