import 'dart:convert';
import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/helper_functions/fallback_localizations.dart';
import 'package:derash/l10n/l10n.dart';
import 'package:derash/models/hospital.dart';
import 'package:derash/providers/locale_provider.dart';
import 'package:derash/veiws/about_first_aid.dart';
import 'package:derash/veiws/about_us.dart';
import 'package:derash/veiws/account/allergies.dart';
import 'package:derash/veiws/bottom_nav.dart';
import 'package:derash/veiws/account/current_medication.dart';
import 'package:derash/veiws/donate_blood.dart';
import 'package:derash/veiws/donate_to_cc.dart';
import 'package:derash/veiws/account/edit_profile.dart';
import 'package:derash/veiws/account/emergency_contacts.dart';
import 'package:derash/veiws/emergency_services.dart';
import 'package:derash/veiws/account/medical_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'models/emergency.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmergencyAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(HospitalAdapter());

  await Hive.openBox<Emergency>('emergencies');
  await Hive.box<Emergency>('emergencies').clear();
  await Hive.openBox<User>('user');
  await Hive.openBox<Hospital>('hospital');
  await Hive.box<Hospital>('hospital').clear();
  //fetching initial emergency data from json file
  final String response =
      await rootBundle.loadString('assets/data/emergency.json');
  final data = await json.decode(response);
  final List emergencies = data['emergencies'];
  final box = Boxes.getEmergencies();
  for (var emergency in emergencies) {
    final singleEmergency = Emergency(
        name: emergency['name'],
        iconUrl: emergency['iconUrl'],
        language: emergency['language'],
        description: emergency['description']);
    box.add(singleEmergency);
  }
  //fetching initial hospital data from json file

  final String response2 =
      await rootBundle.loadString('assets/data/hospital.json');
  final hospitalData = await json.decode(response2);
  final List hospitals = hospitalData['hospitals'];
  final box2 = Boxes.getHospitals();
  for (var hospital in hospitals) {
    final singleHospital = Hospital(
        name_en: hospital['name_en'],
        name_am: hospital['name_am'],
        location: hospital['location'],
        phone: hospital['phone'],
        facebook: hospital['facebook'],
        telegram: hospital['telegram']);
    box2.add(singleHospital);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocalProvider(),
        builder: (context, child) {
          final locale = Provider.of<LocalProvider>(context).locale;
          return MaterialApp(
              title: 'ደራሽ',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.white,
                primarySwatch: Colors.red,

                scaffoldBackgroundColor: Colors.white,
                // fontFamily: "OverpassRegular",
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              locale: locale,
              supportedLocales: L10n.all,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                FallbackLocalizationDelegate()
              ],
              home: const BottomNav(),
              routes: {
                'emergency-services': (context) => const EmergencyServices(),
                'donate-to-cc': (context) => const DonateToCc(),
                'donate-blood': (context) => const DonateBlood(),
                'emergency-contacts': (context) => const EmergencyContacts(),
                'allergies': (context) => const Allergies(),
                'medical-conditions': (context) => const MedicalConditions(),
                'current-medications': (context) => const CurrentMedication(),
                'about-us': (context) => const AboutUs(),
                'edit-profile': (context) => const EditProfile(),
                'about-first-aid': (context) => const AboutFirstAid(),
              });
        });
  }
}
