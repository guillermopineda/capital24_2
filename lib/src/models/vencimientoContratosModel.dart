class ListaVencimientoContratosModel {
  List<VencimientoContratosModel>? items = [];

  ListaVencimientoContratosModel({this.items});

  ListaVencimientoContratosModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final vencimientoContratosModel =
          new VencimientoContratosModel.fromJson(item);
      items!.add(vencimientoContratosModel);
    }
  }
}

class VencimientoContratosModel {
  String? nombre;
  String? fecha;
  String? compania;
  String? area;
  String? centro;

  VencimientoContratosModel(
      {this.nombre, this.fecha, this.compania, this.area, this.centro});

  factory VencimientoContratosModel.fromJson(Map<String, dynamic> json) {
    return new VencimientoContratosModel(
        nombre: json['nombre'],
        fecha: json['fecha'],
        compania: json['compania'],
        area: json['area'],
        centro: json['centro']);
  }
}
