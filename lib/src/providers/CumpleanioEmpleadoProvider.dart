import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/cumpleanioEmpleadoModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class CumpleanioProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/empleado/cumpleanios/";
  List<CumpleanioModel> cumpleanios = [];

  Future<List<CumpleanioModel>> getCumpleanio() async {
    final url = Uri.https(_url, _path);

    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );
    final dataCumpleanio = json.decode(utf8.decode(resp.bodyBytes));
    final cumpleaniosModel = new CumpleaniosModel.fromJsonList(dataCumpleanio);

    return cumpleaniosModel.items;
  }
}

final cumpleanioProvider = CumpleanioProvider();
