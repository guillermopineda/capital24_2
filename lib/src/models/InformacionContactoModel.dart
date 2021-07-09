class DatoContactoEmpleadoModel {
  String? telefonoCasa;
  String? telefonoOficina;
  String? telefonoCelular;
  String? email1;
  String? email2;

  DatoContactoEmpleadoModel({
    this.telefonoCasa,
    this.telefonoOficina,
    this.telefonoCelular,
    this.email1,
    this.email2,
  });

  DatoContactoEmpleadoModel.fromJsonMap(Map<String, dynamic> json) {
    telefonoCasa = json["telefono_casa"];
    telefonoOficina = json["telefono_oficina"];
    telefonoCelular = json["telefono_celular"];
    email1 = json["email_1"];
    email2 = json["email_2"];
  }
}
