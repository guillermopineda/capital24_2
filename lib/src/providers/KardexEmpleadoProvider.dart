import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/kardexEmpleadoModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class KardexEmpleadoProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/empleado/kardex/";
  List<KardexEmpleadoModel> listaKardexEmpleado = [];

  Future<List<KardexEmpleadoModel>?> getKardex() async {
    final url = Uri.https(_url, _path);

    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );
    final dataKardexEmpleado = json.decode(utf8.decode(resp.bodyBytes));

    final listaKardexEmpleadoModel =
        new ListaKardexEmpleadoModel.fromJsonList(dataKardexEmpleado);

    return listaKardexEmpleadoModel.items;
  }
}

final listaKardexEmpleadoProvider = KardexEmpleadoProvider();
