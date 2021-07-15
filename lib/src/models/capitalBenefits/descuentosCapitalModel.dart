// To parse this JSON data, do
//
//     final descuentosCapitalModel = descuentosCapitalModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

class DescuentosCapitalModel {
  List<DescuentoCapitalModel> items = [];

  DescuentosCapitalModel();

  DescuentosCapitalModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final descuentoModel = new DescuentoCapitalModel.fromJsonMap(item);
      items.add(descuentoModel);
    }
  }
}

List<DescuentoCapitalModel> descuentoServiciosFromJson(String str) =>
    List<DescuentoCapitalModel>.from(
        json.decode(str).map((x) => DescuentoCapitalModel.fromJson(x)));

class DescuentoCapitalModel {
  String? unicoId;
  int? id;
  int? giro;
  String? nombreEstablecimiento;
  String? marcaEstablecimeinto;
  String? logo;
  String? imagenVip;
  String? imagenVipA;
  String? imagenVipB;
  String? terminosCondiciones;
  String? promocion;
  String? ubicacion;
  String? paginaWeb;
  String? catalogo;
  String? creado;
  String? actualizado;

  DescuentoCapitalModel({
    this.id,
    this.giro,
    this.nombreEstablecimiento,
    this.marcaEstablecimeinto,
    this.logo,
    this.imagenVip,
    this.imagenVipA,
    this.imagenVipB,
    this.terminosCondiciones,
    this.promocion,
    this.ubicacion,
    this.paginaWeb,
    this.catalogo,
    this.creado,
    this.actualizado,
  });

  factory DescuentoCapitalModel.fromJson(Map<String, dynamic> json) =>
      DescuentoCapitalModel(
        id: json["id"],
        giro: json["giro"],
        nombreEstablecimiento: json["nombre_establecimiento"],
        marcaEstablecimeinto: json["marca_establecimeinto"],
        logo: json["logo"],
        imagenVip: json["imagen_vip"],
        imagenVipA: json["imagen_vip_a"],
        imagenVipB: json["imagen_vip_b"],
        terminosCondiciones: json["terminos_condiciones"],
        promocion: json["promocion"],
        ubicacion: json["ubicacion"],
        paginaWeb: json["pagina_web"],
        catalogo: json["catalogo"],
        creado: json["creado"],
        actualizado: json["actualizado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "giro": giro,
        "nombre_establecimiento": nombreEstablecimiento,
        "marca_establecimiento": marcaEstablecimeinto,
        "logo": logo,
        "imagen_vip": imagenVip,
        "imagen_vip_a": imagenVipA,
        "imagen_vip_b": imagenVipB,
        "terminos_condiciones": terminosCondiciones,
        "promocion": promocion,
        "ubicacion": ubicacion,
        "pagina_web": paginaWeb,
        "catalogo": catalogo,
        "creado": creado,
        "actualizado": actualizado
      };

  DescuentoCapitalModel.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    giro = json["giro"];
    nombreEstablecimiento = json["nombre_establecimiento"];
    marcaEstablecimeinto = json["marca_establecimeinto"];
    logo = json["logo"];
    imagenVip = json["imagen_vip"];
    imagenVipA = json["imagen_vip_a"];
    imagenVipB = json["imagen_vip_b"];
    terminosCondiciones = json["terminos_condiciones"];
    promocion = json["promocion"];
    ubicacion = json["ubicacion"];
    paginaWeb = json["pagina_web"];
    catalogo = json["catalogo"];
    creado = json["creado"];
    actualizado = json["actualizado"];
  }

  getImagenVip() {
    if (imagenVip == null) {
      return AssetImage('images/platinum.png');
    } else {
      return NetworkImage(imagenVip!);
    }
  }

  getImagenVipA(context) {
    final size = MediaQuery.of(context).size;
    if (imagenVipA == null) {
      return AssetImage('images/terminos.png');
    } else {
      return Image.network(
        imagenVipA!,
        width: size.width * .95,
        height: size.height * .5,
      );
    }
  }

  getImagenVipB(context) {
    final size = MediaQuery.of(context).size;
    if (imagenVipB == null) {
      return AssetImage('images/terminos.png');
    } else {
      return Image.network(
        imagenVipB!,
        width: size.width * .95,
        height: size.height * .5,
      );
    }
  }

  getImagenLogo() {
    if (logo == null) {
      return AssetImage('images/logo.png');
    } else {
      return logo;
    }
  }
}
