class ListaDesglosePagoModel {
  List<DesglosePagoModel>? items = [];

  ListaDesglosePagoModel({this.items});

  ListaDesglosePagoModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final desglosePagoModel = new DesglosePagoModel.fromJson(item);
      items!.add(desglosePagoModel);
    }
  }
}

class DesglosePagoModel {
  String? mes;
  int? anio;
  String? mesAnio;
  List<Pago>? pagos;

  DesglosePagoModel({
    this.mes,
    this.anio,
    this.mesAnio,
    this.pagos,
  });

  factory DesglosePagoModel.fromJson(Map<String, dynamic> json) {
    var list = json['pagos'] as List;
    List<Pago> pagosList = list.map((i) => Pago.fromJson(i)).toList();

    return DesglosePagoModel(
      mes: json["mes"],
      anio: json["anio"],
      mesAnio: json["mes_anio"],
      pagos: pagosList,
    );
  }
}

class Pago {
  String? banco;
  String? cuenta;
  String? cuentaClabe;
  String? lugarPago;
  String? proceso;
  int? periodo;
  double? importe;
  String? recibo;
  String? mostrarRecibo;

  Pago(
      {this.banco,
      this.cuenta,
      this.cuentaClabe,
      this.lugarPago,
      this.proceso,
      this.periodo,
      this.importe,
      this.recibo,
      this.mostrarRecibo
      //his.xml,

      });

  factory Pago.fromJson(Map<String, dynamic> json) {
    return new Pago(
        banco: json["banco"],
        cuenta: json["cuenta"],
        cuentaClabe: json["cuenta_clabe"],
        lugarPago: json["lugar_pago"],
        proceso: json["proceso"],
        periodo: json["periodo"],
        importe: json["importe"],
        recibo: json["recibo"],
        mostrarRecibo: json["mostrar_recibo"]
        //xml   :  json["xml"],
        );
  }
}
