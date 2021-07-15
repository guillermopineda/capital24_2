import 'dart:convert';

import 'package:capital24_2/src/models/capitalBenefits/categoriaCapitalBenefitsModel.dart';
import 'package:capital24_2/src/models/capitalBenefits/descuentosCapitalModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

final _url = "capital24-5phdg.ondigitalocean.app";

class ServiciosDescuentoProvider with ChangeNotifier {
  List<DescuentoCapitalModel> descuentoServicios = [];
  int _selectedCategory = 2;
  List<CategoriaDescuentoModel> listaCategorias = [
    //CategoriaTduModel(FontAwesomeIcons.storeAlt,"Todos",0 ),
    CategoriaDescuentoModel(FontAwesomeIcons.heartbeat, "Salud", 2),
    CategoriaDescuentoModel(FontAwesomeIcons.graduationCap, "Educativo", 5),
    CategoriaDescuentoModel(FontAwesomeIcons.utensils, "Restaurantes", 4),
    CategoriaDescuentoModel(FontAwesomeIcons.shoppingBag, "Ropa", 3),
    CategoriaDescuentoModel(FontAwesomeIcons.ticketAlt, "Entretenimiento", 1),
    CategoriaDescuentoModel(FontAwesomeIcons.tags, "Varios", 6),
  ];

  Map<int, List<DescuentoCapitalModel>> categoriaDescuentosServicios = {};

  ServiciosDescuentoProvider() {
    this.getDescuentoDirectorio();
    listaCategorias.forEach((item) {
      this.categoriaDescuentosServicios[item.id] = [];
    });
    this.getDescuentoCategorias(this._selectedCategory);
  }

  int get selectedCategory => this._selectedCategory;
  set selectedCategory(int id) {
    this._selectedCategory = id;

    this.getDescuentoCategorias(id);
    notifyListeners();
  }

  List<DescuentoCapitalModel>? get getCategoriaDescuento =>
      this.categoriaDescuentosServicios[this.selectedCategory];

  getDescuentoDirectorio() async {
    final _path = "/descuentos/giro/2/";
    final _prefs = PreferenciasUsuario();
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};
    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );

    final descuentoServicios =
        descuentoServiciosFromJson(utf8.decode(resp.bodyBytes));
    this.descuentoServicios.addAll(descuentoServicios);

    // final dataDescuentosServicios = json.decode(utf8.decode(resp.bodyBytes));
    // final descuentosServicioModel =
    //     new DescuentosCapitalModel.fromJsonList(dataDescuentosServicios);

    // this.descuentoServicios.addAll(
    //     descuentosServicioModel.items as Iterable<DescuentosCapitalModel>);

    notifyListeners();
  }

  getDescuentoCategorias(int categoria) async {
    if (categoriaDescuentosServicios[categoria]!.length > 0) {
      return this.categoriaDescuentosServicios[categoria];
    }
    final _path = "/descuentos/giro/$categoria/";
    final _prefs = PreferenciasUsuario();
    final url = Uri.https(_url, _path);
    final headersToken = {'Authorization': 'Token ${_prefs.token}'};
    http.Response resp = await http.get(
      url,
      headers: headersToken,
    );
    final descuentoServicios =
        descuentoServiciosFromJson(utf8.decode(resp.bodyBytes));
    this.categoriaDescuentosServicios[categoria]!.addAll(descuentoServicios);
    // final dataDescuentosServicios = json.decode(utf8.decode(resp.bodyBytes));
    // this
    //     .categoriaDescuentosServicios[categoria]!
    //     .addAll(dataDescuentosServicios);
    notifyListeners();
  }
}
