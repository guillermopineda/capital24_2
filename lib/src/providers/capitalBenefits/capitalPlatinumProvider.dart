import 'dart:convert';
import 'dart:async';

import 'package:capital24_2/src/models/capitalBenefits/capitalPlatinumModel.dart';
import 'package:http/http.dart' as http;

class ListaHotDealsProvider {
  String _url = "tdu.digital";
  String _path =
      "/api/comercios/GYXFPwXvzD28j0ma/idapp?idtipobeneficio=2&idestado=15&mapa=true";

  Future<List<DirectorioModel>> getHotDeal() async {
    final url = Uri.http(
      _url,
      _path,
    );

    http.Response resp = await http.get(url);

    final dataHotDeal = json.decode(utf8.decode(resp.bodyBytes));

    final listaHotDealsModel = new ListaHotDealsModel.fromJsonList(dataHotDeal);

    return listaHotDealsModel.items;
  }
}

final hotDealProvider = ListaHotDealsProvider();
