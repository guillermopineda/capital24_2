import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/kardexClienteModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class KardexClienteProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/cliente/kardex/";

  Future<AnioKardexModel> getKardexCliente() async {
    final url = Uri.http(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final datoKardex = json.decode(utf8.decode(resp.bodyBytes));

    final kardexClienteModel = AnioKardexModel.fromJson(datoKardex);

    return kardexClienteModel;
  }
}

final kardexClienteProvider = KardexClienteProvider();
