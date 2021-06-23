import 'package:capital24_2/src/models/capitalBenefits/categoriaCapitalBenefitsModel.dart';
import 'package:capital24_2/src/models/capitalBenefits/serviciosCapitalBenefitsModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

final _url = "tdu.digital";

class ServiciosTduProvider with ChangeNotifier {
  List<TduServicios> tduServicios = [];
  int _selectedCategory = 4;
  List<CategoriaTduModel> listaCategorias = [
    //CategoriaTduModel(FontAwesomeIcons.storeAlt,"Todos",0 ),
    CategoriaTduModel(FontAwesomeIcons.utensils, "Restaurantes", 4),
    CategoriaTduModel(FontAwesomeIcons.shoppingBag, "Ropa", 5),
    CategoriaTduModel(FontAwesomeIcons.ticketAlt, "Entretenimiento", 2),
    CategoriaTduModel(FontAwesomeIcons.heartbeat, "Salud", 3),
    CategoriaTduModel(FontAwesomeIcons.conciergeBell, "Hoteles", 7),
    CategoriaTduModel(FontAwesomeIcons.car, "Autos", 1),
    CategoriaTduModel(FontAwesomeIcons.tags, "Varios", 6),
  ];

  Map<int, List<TduServicios>> categoriaTduServicios = {};

  ServiciosTduProvider() {
    this.getTduDirectorio();
    listaCategorias.forEach((item) {
      this.categoriaTduServicios[item.id] = [];
    });
    this.getTduCategorias(this._selectedCategory);
  }

  int get selectedCategory => this._selectedCategory;
  set selectedCategory(int id) {
    this._selectedCategory = id;

    this.getTduCategorias(id);
    notifyListeners();
  }

  List<TduServicios>? get getCategoriaTdu =>
      this.categoriaTduServicios[this.selectedCategory];

  getTduDirectorio() async {
    final _path =
        "/api/comercios/GYXFPwXvzD28j0ma/idapp?idtipobeneficio=1&idestado=9&idgiro=4";
    final url = Uri.http(_url, _path);
    final http.Response resp = await http.get(url);
    final tduServicios = tduServiciosFromJson(resp.body);

    this.tduServicios.addAll(tduServicios);

    notifyListeners();
  }

  getTduCategorias(int categoria) async {
    if (categoriaTduServicios[categoria]!.length > 0) {
      return this.categoriaTduServicios[categoria];
    }

    final _path =
        "/api/comercios/GYXFPwXvzD28j0ma/idapp?idtipobeneficio=1&idestado=9&idgiro=$categoria";
    final url = Uri.http(_url, _path);
    final http.Response resp = await http.get(url);
    final tduServicios = tduServiciosFromJson(resp.body);
    this.categoriaTduServicios[categoria]!.addAll(tduServicios);
    notifyListeners();
  }
}
