import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hospital.g.dart';

@HiveType(typeId: 2)
class Hospital extends HiveObject {
  @HiveField(1)
  final Map<String, dynamic> location;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String facebook;
  @HiveField(4)
  final String telegram;
  @HiveField(6)
  final String name_en;
  @HiveField(7)
  final String name_am;
  @HiveField(8)
   double distance = -1;

  Hospital(
      {required this.name_en,
      required this.name_am,
      required this.location,
      required this.phone,
      required this.facebook,
      required this.telegram,
      });
}
