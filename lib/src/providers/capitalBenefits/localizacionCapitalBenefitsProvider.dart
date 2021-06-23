import 'package:capital24_2/src/models/capitalBenefits/categoriaCapitalBenefitsModel.dart';
import 'package:capital24_2/src/models/capitalBenefits/localizacionCapitalBenefitsModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';

import 'package:http/http.dart' as http;

final _url = "tdu.digital";

class LocalizacionTduProvider with ChangeNotifier {
  List<TduLocalizacion> tduLocalizacion = [];
  int _selectedCategory = 4;
  bool _isLoading = true;
  List<CategoriaTduModelCercanos> listaCategorias = [
    //CategoriaTduModel(FontAwesomeIcons.storeAlt,"Todos",0 ),
    CategoriaTduModelCercanos(FontAwesomeIcons.utensils, "Restaurantes", 4),
    CategoriaTduModelCercanos(FontAwesomeIcons.shoppingBag, "Ropa", 5),
    CategoriaTduModelCercanos(FontAwesomeIcons.ticketAlt, "Entretenimiento", 2),
    CategoriaTduModelCercanos(FontAwesomeIcons.heartbeat, "Salud", 3),
    CategoriaTduModelCercanos(FontAwesomeIcons.conciergeBell, "Hoteles", 7),
    CategoriaTduModelCercanos(FontAwesomeIcons.carSide, "Autos", 1),
    CategoriaTduModelCercanos(FontAwesomeIcons.tags, "Varios", 6),
  ];

  Map<int, List<TduLocalizacion>> categoriaTduLocalizacion = {};

  LocalizacionTduProvider() {
    this.getTduCercanos();
    listaCategorias.forEach((item) {
      this.categoriaTduLocalizacion[item.id] = [];
    });
    this.getTduCategoriasCercanos(this._selectedCategory);
  }
  bool get isLoading => this._isLoading;

  int get selectedCategory => this._selectedCategory;
  set selectedCategory(int id) {
    this._selectedCategory = id;

    this._isLoading = true;
    this.getTduCategoriasCercanos(id);
    notifyListeners();
  }

  List<TduLocalizacion>? get getCategoriaTdu =>
      this.categoriaTduLocalizacion[this.selectedCategory];

  getTduCercanos() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });

    final _path =
        "/api/comercios/GYXFPwXvzD28j0ma/idapp?idtipobeneficio=1&latitud=${_locationData.latitude}&longitud=${_locationData.longitude}&mapa=true&idgiro=4";
    final url = Uri.http(_url, _path);
    final http.Response resp = await http.get(url);
    final tduLocalizacion = tduLocalizacionFromJson(resp.body);

    this.tduLocalizacion.addAll(tduLocalizacion);

    notifyListeners();
  }

  getTduCategoriasCercanos(int categoria) async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    if (categoriaTduLocalizacion[categoria]!.length > 0) {
      return this.categoriaTduLocalizacion[categoria];
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });

    final _path =
        "/api/comercios/GYXFPwXvzD28j0ma/idapp?idtipobeneficio=1&latitud=${_locationData.latitude}&longitud=${_locationData.longitude}&mapa=true&idgiro=$categoria";
    final url = Uri.http(_url, _path);
    final http.Response resp = await http.get(url);
    final tduLocalizacion = tduLocalizacionFromJson(resp.body);
    this.categoriaTduLocalizacion[categoria]!.addAll(tduLocalizacion);
    this._isLoading = false;

    notifyListeners();
  }
}
