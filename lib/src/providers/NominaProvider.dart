import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/nominaModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class DesglosesPagoProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/empleado/desglose-de-pagos/nomina/";

  Future<List<DesglosePagoModel>> getDesglosePago() async {
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final dataProv = json.decode(utf8.decode(resp.bodyBytes));
    final desgloses = new ListaDesglosePagoModel.fromJsonList(dataProv);

    return desgloses.items!.toList();
  }
}

final desglosesPagoProvider = DesglosesPagoProvider();
