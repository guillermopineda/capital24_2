class IndicadorNegocioModel {
  int? numeroEmpleados;
  List<AniosIndicador>? datos;

  IndicadorNegocioModel({this.numeroEmpleados, this.datos});

  factory IndicadorNegocioModel.fromJsonMap(Map<String, dynamic> json) {
    var list = json['datos'] as List;
    List<AniosIndicador> listAniosIndicador =
        list.map((i) => AniosIndicador.fromJson(i)).toList();

    return new IndicadorNegocioModel(
        numeroEmpleados: json['numero_empleados'], datos: listAniosIndicador);
  }
}

class AniosIndicador {
  int? anio;
  List<DatosIndicador>? datos;

  AniosIndicador({this.anio, this.datos});

  factory AniosIndicador.fromJson(Map<String, dynamic> json) {
    var list = json['meses'] as List;
    List<DatosIndicador> listaDatosIndicador =
        list.map((i) => DatosIndicador.fromJson(i)).toList();

    return new AniosIndicador(anio: json["anio"], datos: listaDatosIndicador);
  }
}

class DatosIndicador {
  String? mes;
  int? headcount;
  double? rotacion;
  int? altas;
  int? bajas;

  DatosIndicador(
      {this.mes, this.headcount, this.rotacion, this.altas, this.bajas});

  factory DatosIndicador.fromJson(Map<String, dynamic> json) {
    return new DatosIndicador(
        mes: json['mes'],
        headcount: json['headcount'],
        rotacion: json['rotacion'],
        altas: json['altas'],
        bajas: json['bajas']);
  }
}
