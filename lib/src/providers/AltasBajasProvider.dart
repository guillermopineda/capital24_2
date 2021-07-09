import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/altasBajasModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class HeadcountProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/cliente/headcount/";

  Future<IndicadorNegocioModel> getHeadcountNegocio() async {
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final datoIndicador = json.decode(utf8.decode(resp.bodyBytes));

    final headcountModel = IndicadorNegocioModel.fromJsonMap(datoIndicador);

    return headcountModel;
  }
}

final headcountProvider = HeadcountProvider();
