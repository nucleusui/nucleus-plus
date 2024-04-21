import 'package:latlong2/latlong.dart';

class MapModel {
  LatLng coordinate;
  String price;
  bool active;

  MapModel({
    required this.coordinate,
    required this.price,
    required this.active,
  });
}
