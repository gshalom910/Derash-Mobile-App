import 'package:derash/helper_functions/boxes.dart';
// import 'package:derash/helper_functions/maps.dart';
import 'package:derash/l10n/l10n.dart';
import 'package:derash/models/hospital.dart';
import 'package:derash/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:dio/dio.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:haversine/haversine.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:great_circle_distance2/great_circle_distance2.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetail extends StatefulWidget {
  final Hospital hospital;
  final String distance;
  const HospitalDetail(
      {Key? key, required this.hospital, required this.distance})
      : super(key: key);

  @override
  State<HospitalDetail> createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  final Completer<GoogleMapController> _controller = Completer();
  final box = Boxes.getHospitals();
  late LatLng showLocation;
  Set<Marker> markers = {};
  double getDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  initState() {
    showLocation = LatLng(widget.hospital.location['latitude'],
        widget.hospital.location['longitude']);
    // final title = widget.hospital.name_en;
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: const InfoWindow(
          //popup info
          // title: title,
          ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Provider.of<LocalProvider>(context).locale;
    return Scaffold(
      appBar: AppBar(
        title: locale == L10n.all[1]
            ? Text(widget.hospital.name_am)
            : Text(widget.hospital.name_en),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
               padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 242, 242),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color.fromARGB(255, 184, 187, 189),
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: GoogleMap(
                      markers: markers,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      initialCameraPosition: CameraPosition(
                        target: showLocation,
                        zoom: 20.0,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'More info',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: ListView(
                      children: [
                        if(widget.hospital.phone !='')
                        Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () async {
                              await launch('tel:${widget.hospital.phone}');
                            },
                            leading: const Icon(
                              Icons.phone,
                              color: Colors.green,
                              size: 35,
                            ),
                            title: Text(
                              widget.hospital.phone,
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: const Text(
                              'Click to dial',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      
                        Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () async {
                              String googleUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${widget.hospital.location['latitude']},${widget.hospital.location['longitude']}';
                              await launch(googleUrl);
                            },
                            leading: Image.asset(
                              'assets/images/pin_hospital.png',
                              width: 30,
                            ),
                            title: Text(
                              '${widget.distance} ${AppLocalizations.of(context)!.kilometers} ${AppLocalizations.of(context)!.away}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: const Text(
                              'Click to open on google maps',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        if(widget.hospital.facebook!='')
                        Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () async {
                              await launch(
                                  'https://www.facebook.com/${widget.hospital.facebook}/');
                            },
                            leading: Image.asset(
                              'assets/images/facebook.png',
                              width: 30,
                            ),
                            // title: Text(
                            //   widget.hospital.facebook,
                            //   style: const TextStyle(fontSize: 22),
                            // ),
                            subtitle: const Text(
                              'Click to open page',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        if(widget.hospital.telegram != '')
                        Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () async {
                              final userName =
                                  widget.hospital.telegram.substring(1);
                              await launch('https://t.me/$userName');
                            },
                            leading: Image.asset(
                              'assets/images/telegram.png',
                              width: 30,
                            ),
                            // title: Text(
                            //   widget.hospital.telegram,
                            //   style: const TextStyle(fontSize: 22),
                            // ),
                            subtitle: const Text(
                              'Click to open page',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
