import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/helper_functions/maps.dart';
import 'package:derash/l10n/l10n.dart';
import 'package:derash/models/hospital.dart';
import 'package:derash/providers/locale_provider.dart';
import 'package:derash/veiws/hospital_detail.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  Position? userLocation;

  getUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position? location = await Geolocator.getCurrentPosition();
      setState(() {
        userLocation = location;
        // print(location);
      });
    } else {
      // print('user location is not found');
      userLocation = null;
    }
  }

  calculateDistance(userLocation, List<Hospital> hospitals) {
    for (var hospital in hospitals) {
      if (userLocation != null) {
        final distance = Map().distance(
            userLocation!.latitude,
            userLocation!.longitude,
            hospital.location["latitude"],
            hospital.location["longitude"]);
        hospital.distance = double.parse(distance);
      }
    }
  }

  @override
  void initState() {
    getUserLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Provider.of<LocalProvider>(context).locale;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 250, 242, 242),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.hospital_near_by,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ValueListenableBuilder<Box<Hospital>>(
                valueListenable: Boxes.getHospitals().listenable(),
                builder: (context, box, _) {
                  final hospitals = box.values.cast<Hospital>().toList();
                  calculateDistance(userLocation, hospitals);
                  hospitals.sort((a, b) {
                    return a.distance.compareTo(b.distance);
                  });
                  return Expanded(
                      child: ListView.builder(
                          itemCount: hospitals.length,
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 2,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return HospitalDetail(
                                          hospital: hospitals[index],
                                          distance: hospitals[index]
                                              .distance
                                              .toString());
                                    }));
                                  },
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                      locale == L10n.all[1]
                                          ? hospitals[index].name_am
                                          : hospitals[index].name_en,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.call,
                                    color: Colors.green,
                                  ),
                                  subtitle:hospitals[index].distance == -1?const Text('coundnt estimate distance your location is off'):Text(
                                      " ${hospitals[index].distance} ${AppLocalizations.of(context)!.kilometers} ${AppLocalizations.of(context)!.away}"),
                                ));
                          }));
                })
          ],
        ),
      ),
    );
  }
}
