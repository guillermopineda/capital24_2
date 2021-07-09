class ListaAnioKardex {
  List<AnioKardexModel>? items = [];

  ListaAnioKardex({this.items});

  ListaAnioKardex.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final kardexClienteModel = new AnioKardexModel.fromJson(item);
      items!.add(kardexClienteModel);
    }
  }
}

class AnioKardexModel {
  int? anio;
  List<MesKardex>? datos;

  AnioKardexModel({this.anio, this.datos});

  factory AnioKardexModel.fromJson(Map<String, dynamic> json) {
    var listmeses = json['datos'] as List;
    List<MesKardex> mesesList =
        listmeses.map((e) => MesKardex.fromJson(e)).toList();

    return AnioKardexModel(anio: json['anio'], datos: mesesList);
  }
}

class MesKardex {
  String? mes;
  List<TotalKardex>? valores;

  MesKardex({this.mes, this.valores});

  factory MesKardex.fromJson(Map<String, dynamic> json) {
    var listaValores = json['valores'] as List;
    List<TotalKardex> valoresList =
        listaValores.map((e) => TotalKardex.fromJson(e)).toList();

    return MesKardex(mes: json['mes'], valores: valoresList);
  }
}

class TotalKardex {
  String? marca;
  int? total;

  TotalKardex({this.marca, this.total});

  factory TotalKardex.fromJson(Map<String, dynamic> json) {
    return new TotalKardex(marca: json['marca'], total: json['total']);
  }
}
