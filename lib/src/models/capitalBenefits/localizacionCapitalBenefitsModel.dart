// To parse this JSON data, do
//
//     final tduServicios = tduServiciosFromJson(jsonString);
import 'package:flutter/material.dart';
import 'dart:convert';

List<TduLocalizacion> tduLocalizacionFromJson(String str) =>
    List<TduLocalizacion>.from(
        json.decode(str).map((x) => TduLocalizacion.fromJson(x)));

String tduLocalizacionToJson(List<TduLocalizacion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TduLocalizacion {
  Sucursal? sucursal;
  Comercio? comercio;
  Beneficio? beneficio;

  TduLocalizacion({
    this.sucursal,
    this.comercio,
    this.beneficio,
  });

  factory TduLocalizacion.fromJson(Map<String, dynamic> json) =>
      TduLocalizacion(
        sucursal: Sucursal.fromJson(json["sucursal"]),
        comercio: Comercio.fromJson(json["comercio"]),
        beneficio: Beneficio.fromJson(json["beneficio"]),
      );

  Map<String, dynamic> toJson() => {
        "sucursal": sucursal!.toJson(),
        "comercio": comercio!.toJson(),
        "beneficio": beneficio!.toJson(),
      };
}

class Beneficio {
  int? id;
  Tipobeneficio? tipobeneficio;
  Tiporedencion? tiporedencion;
  String? promocorta;
  String? promolarga;
  String? descripcion;
  String? terminos;
  DateTime? fechafin;
  bool? sinsucursal;
  String? linkbeneficio;
  dynamic hotdeal;

  Beneficio({
    this.id,
    this.tipobeneficio,
    this.tiporedencion,
    this.promocorta,
    this.promolarga,
    this.descripcion,
    this.terminos,
    this.fechafin,
    this.sinsucursal,
    this.linkbeneficio,
    this.hotdeal,
  });

  factory Beneficio.fromJson(Map<String, dynamic> json) => Beneficio(
        id: json["id"],
        tipobeneficio: Tipobeneficio.fromJson(json["tipobeneficio"]),
        tiporedencion: Tiporedencion.fromJson(json["tiporedencion"]),
        promocorta: json["promocorta"],
        promolarga: json["promolarga"],
        descripcion: json["descripcion"],
        terminos: json["terminos"],
        fechafin: DateTime.parse(json["fechafin"]),
        sinsucursal: json["sinsucursal"],
        linkbeneficio: json["linkbeneficio"],
        hotdeal: json["hotdeal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipobeneficio": tipobeneficio!.toJson(),
        "tiporedencion": tiporedencion!.toJson(),
        "promocorta": promocorta,
        "promolarga": promolarga,
        "descripcion": descripcion,
        "terminos": terminos,
        "fechafin": fechafin!.toIso8601String(),
        "sinsucursal": sinsucursal,
        "linkbeneficio": linkbeneficio,
        "hotdeal": hotdeal,
      };
}

class Tipobeneficio {
  int? id;
  String? nombre;

  Tipobeneficio({
    this.id,
    this.nombre,
  });

  factory Tipobeneficio.fromJson(Map<String, dynamic> json) => Tipobeneficio(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}

class Tiporedencion {
  int? id;
  TiporedencionNombre? nombre;
  String? linkredencion;
  dynamic codigofijo;

  Tiporedencion({
    this.id,
    this.nombre,
    this.linkredencion,
    this.codigofijo,
  });

  factory Tiporedencion.fromJson(Map<String, dynamic> json) => Tiporedencion(
        id: json["id"],
        nombre: tiporedencionNombreValues.map![json["nombre"]],
        linkredencion: json["linkredencion"],
        codigofijo: json["codigofijo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": tiporedencionNombreValues.reverse![nombre],
        "linkredencion": linkredencion,
        "codigofijo": codigofijo,
      };
}

enum TiporedencionNombre { LINK, TARJETA_DIGITAL }

final tiporedencionNombreValues = EnumValues({
  "Link": TiporedencionNombre.LINK,
  "Tarjeta Digital": TiporedencionNombre.TARJETA_DIGITAL
});

class Comercio {
  String? unicoId;
  int? id;
  String? nombre;
  Giro? giro;
  Tipobeneficio? subgiro;
  String? paginaweb;
  String? facebook;
  String? logopath;

  Comercio({
    this.id,
    this.nombre,
    this.giro,
    this.subgiro,
    this.paginaweb,
    this.facebook,
    this.logopath,
  });

  factory Comercio.fromJson(Map<String, dynamic> json) => Comercio(
        id: json["id"],
        nombre: json["nombre"],
        giro: Giro.fromJson(json["giro"]),
        subgiro: Tipobeneficio.fromJson(json["subgiro"]),
        paginaweb: json["paginaweb"],
        facebook: json["facebook"],
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "giro": giro!.toJson(),
        "subgiro": subgiro!.toJson(),
        "paginaweb": paginaweb,
        "facebook": facebook,
        "logopath": logopath,
      };

  getImagenCercano() {
    if (logopath == null) {
      return Image.asset('images/portada_c24.png');
    } else {
      return "http://tdushots.blob.core.windows.net$logopath";
    }
  }

  getImagenMapa() {
    if (logopath == null) {
      return Image.asset('images/portada_c24.png');
    } else {
      return "http://tdushots.blob.core.windows.net$logopath";
    }
  }
}

class Giro {
  int? id;
  GiroNombre? nombre;
  int? orden;

  Giro({
    this.id,
    this.nombre,
    this.orden,
  });

  factory Giro.fromJson(Map<String, dynamic> json) => Giro(
        id: json["id"],
        nombre: giroNombreValues.map![json["nombre"]],
        orden: json["orden"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": giroNombreValues.reverse![nombre],
        "orden": orden,
      };
}

enum GiroNombre {
  VARIOS,
  ROPA_Y_ACCESORIOS,
  SALUD_Y_BELLEZA,
  HOTELES,
  RESTAURANTES,
  AUTOS,
  ENTRETENIMIENTO
}

final giroNombreValues = EnumValues({
  "Autos": GiroNombre.AUTOS,
  "Entretenimiento": GiroNombre.ENTRETENIMIENTO,
  "Hoteles": GiroNombre.HOTELES,
  "Restaurantes": GiroNombre.RESTAURANTES,
  "Ropa y Accesorios": GiroNombre.ROPA_Y_ACCESORIOS,
  "Salud y Belleza": GiroNombre.SALUD_Y_BELLEZA,
  "Varios": GiroNombre.VARIOS
});

class Sucursal {
  int? id;
  String? nombre;
  double? latitud;
  double? longitud;
  double? distancia;

  Sucursal({
    this.id,
    this.nombre,
    this.latitud,
    this.longitud,
    this.distancia,
  });

  factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        nombre: json["nombre"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        distancia: json["distancia"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "latitud": latitud,
        "longitud": longitud,
        "distancia": distancia,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
