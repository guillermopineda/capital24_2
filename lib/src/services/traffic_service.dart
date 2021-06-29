import 'package:capital24_2/src/models/trafficModel.dart';
import 'package:dio/dio.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrafficService {
  TrafficService._privateConstructor();
  static final TrafficService _instance = TrafficService._privateConstructor();
  factory TrafficService() {
    return _instance;
  }
  final _dio = new Dio();
  final _baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey =
      'pk.eyJ1IjoiYWRtaW5nbjEwIiwiYSI6ImNrOHJvOWJjeDBncXUzZXJzd3Zsbm9zcTgifQ.kWzq_7iLv2DgtylFCxtPaw';
  final _destLat = '19.699954';
  final _destLong = '-99.2844251';

  Future getCoordsInicioYDestino(LatLng? inicio, LatLng? destino) async {
    final coordString =
        '${inicio?.longitude},${inicio?.latitude};$_destLong,$_destLat';
    final url = '${this._baseUrl}/mapbox/driving/$coordString';
    final resp = await this._dio.get(url, queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': 'false',
      'access_token': this._apiKey,
      'language': 'es',
    });
    final data = DrivingResponse.fromJson(resp.data);

    return data;
  }
}
