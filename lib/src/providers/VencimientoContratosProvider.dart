import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/vencimientoContratosModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class VencimientoContratosProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/cliente/vencimiento-contratos/";

  Future<List<VencimientoContratosModel>?> getVencimiento() async {
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final dataPlantilla = json.decode(utf8.decode(resp.bodyBytes));

    final vencimientoContratosModel =
        ListaVencimientoContratosModel.fromJsonList(dataPlantilla);

    return vencimientoContratosModel.items;
  }

  Future<List<VencimientoContratosModel>?> getBuscarVencimiento(
      String query) async {
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final dataPlantilla = json.decode(utf8.decode(resp.bodyBytes));

    final vencimientoContratosModel =
        ListaVencimientoContratosModel.fromJsonList(dataPlantilla);

    vencimientoContratosModel.items!.sort((a, b) {
      return a.nombre!.toLowerCase().compareTo(b.nombre!.toLowerCase());
    });
    return vencimientoContratosModel.items;
  }
}

final vencimientoContratosProvider = VencimientoContratosProvider();
