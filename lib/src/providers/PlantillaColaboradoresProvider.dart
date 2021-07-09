import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class PlantillaColaboradoresProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/cliente/plantilla-personal/";

  Future<List<PlantillaColaboradoresModel>?> getPlantillaColaboradores() async {
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final dataPlantilla = json.decode(utf8.decode(resp.bodyBytes));

    final plantillaColaboradoresModel =
        ListaPlantillaColaboradoresModel.fromJsonList(dataPlantilla);

    plantillaColaboradoresModel.items!.sort((a, b) {
      return a.nombre!.toLowerCase().compareTo(b.nombre!.toLowerCase());
    });
    return plantillaColaboradoresModel.items;
  }
}

final plantillaColaboradoresProvider = PlantillaColaboradoresProvider();
