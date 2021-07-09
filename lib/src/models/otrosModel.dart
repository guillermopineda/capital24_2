class ListaDesgloseOtroModel {
  List<DesgloseOtroModel>? items = [];

  ListaDesgloseOtroModel({this.items});

  ListaDesgloseOtroModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final desglosePagoModel = new DesgloseOtroModel.fromJson(item);
      items!.add(desglosePagoModel);
    }
  }
}

class DesgloseOtroModel {
  String? mes;
  int? anio;
  String? mesAnio;
  List<Otro>? pagos;

  DesgloseOtroModel({
    this.mes,
    this.anio,
    this.mesAnio,
    this.pagos,
  });

  factory DesgloseOtroModel.fromJson(Map<String, dynamic> json) {
    var list = json['pagos'] as List;
    List<Otro> pagosList = list.map((i) => Otro.fromJson(i)).toList();

    return DesgloseOtroModel(
      mes: json["mes"],
      anio: json["anio"],
      mesAnio: json["mes_anio"],
      pagos: pagosList,
    );
  }
}

class Otro {
  String? banco;
  String? cuenta;
  String? cuentaClabe;
  String? lugarPago;
  String? proceso;
  int? periodo;
  double? importe;

  Otro({
    this.banco,
    this.cuenta,
    this.cuentaClabe,
    this.lugarPago,
    this.proceso,
    this.periodo,
    this.importe,
  });

  factory Otro.fromJson(Map<String, dynamic> json) {
    return new Otro(
        banco: json["banco"],
        cuenta: json["cuenta"],
        cuentaClabe: json["cuenta_clabe"],
        lugarPago: json["lugar_pago"],
        proceso: json["proceso"],
        periodo: json["periodo"],
        importe: json["importe"]);
  }
}
