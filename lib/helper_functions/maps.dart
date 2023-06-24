import 'dart:math';
import 'package:intl/intl.dart';

class Map {
  deg2rad(deg) {
    return deg * pi / 180;
  }

  rad2deg(rad) {
    return rad * 180 / pi;
  }

  String distance(double lat1, double lon1, double lat2, double lon2) {
    double theta = lon1 - lon2;
    double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
    dist = acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;
    // DecimalFormat df = new DecimalFormat("###.##");
    var df = NumberFormat("###.##", "en_US");
    return df.format(dist * 1.60934);
  }
}
