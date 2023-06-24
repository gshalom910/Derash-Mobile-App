import 'package:derash/models/hospital.dart';
import 'package:derash/models/user.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:derash/models/emergency.dart';

class Boxes {
  static Box<Emergency> getEmergencies() => Hive.box<Emergency>('emergencies');
  static Box<User> getUser() => Hive.box<User>('user');
  static Box<Hospital> getHospitals() => Hive.box<Hospital>('hospital');
}
