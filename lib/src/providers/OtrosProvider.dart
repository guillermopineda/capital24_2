import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/otrosModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class DesglosesOtroProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/empleado/desglose-de-pagos/otros";

  Future<List<DesgloseOtroModel>> getDesgloseOtro() async {
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final dataOtros = json.decode(utf8.decode(resp.bodyBytes));
    final desglosesOtros = new ListaDesgloseOtroModel.fromJsonList(dataOtros);

    return desglosesOtros.items!.toList();
  }
}

final desglosesOtroProvider = DesglosesOtroProvider();
