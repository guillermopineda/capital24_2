import 'package:flutter/material.dart';

class ListaKardexEmpleadoModel {
  List<KardexEmpleadoModel>? items = [];
  ListaKardexEmpleadoModel({this.items});
  ListaKardexEmpleadoModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final listaKardex = new KardexEmpleadoModel.fromJson(item);
      items!.add(listaKardex);
    }
  }
}

class KardexEmpleadoModel {
  Color colorKardex() {
    if (marca == "FALTAS") {
      return Color(0xffCB6CE6);
    } else if (marca == "PERMISO S/D SUELDO") {
      return Color(0xff7ED957);
    } else if (marca == "INC. POR ACCIDENTE") {
      return Color(0xffA6A6A6);
    } else if (marca == "INC. POR ENLACE") {
      return Color(0xff5CE1E6);
    } else if (marca == "INC. MATERNIDAD") {
      return Color(0xffFF66C4);
    } else if (marca == "PERMISO G/G SUELDO") {
      return Color(0xff0069F6);
    } else if (marca == "DÍA SOLIDARIO") {
      return Color(0xff864EF6);
    } else if (marca == "VACACIONES") {
      return Color(0xffFFBD59);
    }
    return Color(0xff525151);
  }

  String? fecha;
  String? marca;

  KardexEmpleadoModel({
    this.fecha,
    this.marca,
  });
  factory KardexEmpleadoModel.fromJson(Map<String, dynamic> json) {
    return new KardexEmpleadoModel(
      fecha: json['fecha'],
      marca: json['marca'],
    );
  }
}
