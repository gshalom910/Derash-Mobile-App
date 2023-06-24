import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  late String userName;
  @HiveField(19)
  late int sex;
  @HiveField(2)
  late String age;
  @HiveField(3)
  late String profileImageUrl;
  @HiveField(4)
  late String bloodGroup;
  @HiveField(5)
  late List<dynamic> emergencyContacts;
  @HiveField(6)
  late List allergies;
  @HiveField(7)
  late List medicalConditions;
  @HiveField(8)
  late List currentMedications;
}
