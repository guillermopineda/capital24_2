import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/capitalBenefits/descuentosCapitalModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:http/http.dart' as http;

class DescuentosCapitalProvider {
  final _prefs = PreferenciasUsuario();
  String _url = "capital24-5phdg.ondigitalocean.app";
  String _path = "/descuentos/";
  List<DescuentoCapitalModel> descuentos = [];

  Future<List<DescuentoCapitalModel>> getDescuentoPlatinum() async {
    final url = Uri.https(
      _url,
      _path,
    );

    final headersToken = {'Authorization': 'Token ${_prefs.token}'};

    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );
    final dataDescuento = json.decode(utf8.decode(resp.bodyBytes));
    final descuentosModel =
        new DescuentosCapitalModel.fromJsonList(dataDescuento);

    return descuentosModel.items;
  }
}

final descuentoProvider = DescuentosCapitalProvider();
