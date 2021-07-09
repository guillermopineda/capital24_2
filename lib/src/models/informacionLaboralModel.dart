class DatoLaboralEmpleadoModel {
  int? numeroEmpleado;
  String? nombreCompania;
  String? fechaIngreso;
  String? fechaAntiguedad;
  String? fechaContrato;
  String? fechaTerminacion;
  String? declaracionImp;
  double? sueldo;
  String? area;
  String? centro;
  String? linea;
  String? zona;
  String? puesto;
  String? cartaPatronal;
  String? mostrarCarta;
  String? mostrarOtros;

  DatoLaboralEmpleadoModel(
      {this.numeroEmpleado,
      this.nombreCompania,
      this.fechaIngreso,
      this.fechaAntiguedad,
      this.fechaContrato,
      this.fechaTerminacion,
      this.declaracionImp,
      this.sueldo,
      this.area,
      this.centro,
      this.linea,
      this.zona,
      this.puesto,
      this.cartaPatronal,
      this.mostrarCarta,
      this.mostrarOtros});

  DatoLaboralEmpleadoModel.fromJsonMap(Map<String, dynamic> json) {
    numeroEmpleado = json["numero_empleado"];
    nombreCompania = json["nombre_compania"];
    fechaIngreso = json["fecha_ingreso"];
    fechaAntiguedad = json["fecha_antiguedad"];
    fechaContrato = json["fecha_contrato"];
    fechaTerminacion = json["fecha_terminacion"];
    declaracionImp = json["declaracion_imp"];
    sueldo = json["sueldo"];
    area = json["area"];
    centro = json['centro'];
    linea = json['linea'];
    zona = json['zona'];
    puesto = json['puesto'];
    cartaPatronal = json['carta_patronal'];
    mostrarCarta = json['mostrar_carta'];
    mostrarOtros = json['mostrar_otros'];
  }
}
