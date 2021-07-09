import 'package:flutter/material.dart';

class ComunicadosModel {
  List<ComunicadoModel> items = [];

  ComunicadosModel();

  ComunicadosModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final comunicadoModel = new ComunicadoModel.fromJsonMap(item);
      items.add(comunicadoModel);
    }
  }
}

class ComunicadoModel {
  Color getColorComunicado() {
    String comunicado = "Comunicado";
    String enterate = "Entérate";
    String salud = "Salud"; //aqui controlamos los colores segun el json
    if (tipo == comunicado) {
      return Color(0xff7ed957);
    } else if (tipo == enterate) {
      return Color(0xffff9559);
    } else if (tipo == salud) {
      return Color(0xff0077C8);
    } else
      return Color(0xffcb6ce6);
  }

  String? comunicadoId;
  String? tipo;
  String? nombre;
  String? descripcion;
  String? fechaFinal;
  String? imagenPoster;
  String? imagenPortada;
  String? urlReferencia;

  ComunicadoModel({
    this.tipo,
    this.nombre,
    this.descripcion,
    this.fechaFinal,
    this.imagenPoster,
    this.imagenPortada,
    this.urlReferencia,
  });

  ComunicadoModel.fromJsonMap(Map<String, dynamic> json) {
    tipo = json["tipo"];
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    fechaFinal = json["fecha_final"];
    imagenPoster = json["imagen_poster"];
    imagenPortada = json["imagen_portada"];
    urlReferencia = json["url_referencia"];
  }

  getImagenComunicado() {
    if (imagenPortada == null) {
      print("object");
      return Image.asset('images/portada_c24.png');
    } else {
      print(imagenPortada);
      return imagenPortada;
    }
  }

  getImagenDetalle() {
    if (imagenPoster == null) {
      return Image.asset('images/detalle_c24.png');
    } else {
      return imagenPoster;
    }
  }
}
