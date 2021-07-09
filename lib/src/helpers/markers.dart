part of 'helpers.dart';

Future<BitmapDescriptor> getAssetImageMarker() async {
  return await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3.5), 'images/marker.png');
}
