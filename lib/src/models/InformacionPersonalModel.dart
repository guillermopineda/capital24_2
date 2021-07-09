class DatoPersonalEmpleadoModel {
  String? sexo;
  String? estadoCivil;
  String? nacionalidad;
  String? nombre;
  String? curp;
  String? rfc;
  String? afiliacionImss;
  String? fechaNacimiento;
  double? peso;
  double? estatura;
  int? numeroEmpleado;

  DatoPersonalEmpleadoModel({
    this.sexo,
    this.estadoCivil,
    this.nacionalidad,
    this.nombre,
    this.curp,
    this.rfc,
    this.afiliacionImss,
    this.fechaNacimiento,
    this.peso,
    this.estatura,
    this.numeroEmpleado,
  });

  DatoPersonalEmpleadoModel.fromJsonMap(Map<String, dynamic> json) {
    sexo = json["sexo"];
    estadoCivil = json["estado_civil"];
    nacionalidad = json["nacionalidad"];
    nombre = json["nombre"];
    curp = json["curp"];
    rfc = json["rfc"];
    afiliacionImss = json["afiliacion_imss"];
    fechaNacimiento = json["fecha_nacimiento"];
    peso = json["peso"];
    estatura = json["estatura"];
    numeroEmpleado = json["numero_empleado"];
  }
}
