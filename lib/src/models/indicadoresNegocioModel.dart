class ListaIndicadorNegocioModel {
  List<IndicadorNegocioModel>? items = [];
  ListaIndicadorNegocioModel({this.items});

  ListaIndicadorNegocioModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final indicadorNegocioModel = new IndicadorNegocioModel.fromJson(item);
      items!.add(indicadorNegocioModel);
    }
  }
}

class IndicadorNegocioModel {
  String? indicadorNegocio;
  List<AniosIndicador>? anios;

  IndicadorNegocioModel({this.indicadorNegocio, this.anios});

  factory IndicadorNegocioModel.fromJson(Map<String, dynamic> json) {
    var list = json['anios'] as List;
    List<AniosIndicador> listAniosIndicador =
        list.map((i) => AniosIndicador.fromJson(i)).toList();

    return new IndicadorNegocioModel(
        indicadorNegocio: json['indicador_negocio'], anios: listAniosIndicador);
  }
}

class AniosIndicador {
  int? anio;
  List<DatosIndicador>? datos;

  AniosIndicador({this.anio, this.datos});

  factory AniosIndicador.fromJson(Map<String, dynamic> json) {
    var list = json['datos'] as List;
    List<DatosIndicador> listaDatosIndicador =
        list.map((i) => DatosIndicador.fromJson(i)).toList();

    return new AniosIndicador(anio: json["anio"], datos: listaDatosIndicador);
  }
}

class DatosIndicador {
  String? mes;
  double? suma;

  DatosIndicador({this.mes, this.suma});

  factory DatosIndicador.fromJson(Map<String, dynamic> json) {
    return new DatosIndicador(mes: json['mes'], suma: json['suma']);
  }
}
