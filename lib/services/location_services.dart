// import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';

// class LocationSevices {
//   Future getCoordinates() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     final coordinate = new Coordinates(position.latitude, position.longitude);

//     var address = await Geocoder.local.findAddressesFromCoordinates(coordinate);
//     var alamat = address.first;

//     return alamat.addressLine.toString();
//   }
// }
