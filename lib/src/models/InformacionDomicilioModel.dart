class DatoDomicilioEmpleadoModel {
  String? calle;
  String? numeroExterior;
  String? numeroInterior;
  String? colonia;
  String? municipio;
  String? codigoPostal;
  String? estado;

  DatoDomicilioEmpleadoModel(
      {this.calle,
      this.numeroExterior,
      this.numeroInterior,
      this.colonia,
      this.municipio,
      this.codigoPostal,
      this.estado});

  DatoDomicilioEmpleadoModel.fromJsonMap(Map<String, dynamic> json) {
    calle = json["calle"];
    numeroExterior = json["numero_exterior"];
    numeroInterior = json["numero_interior"];
    colonia = json["colonia"];
    municipio = json["municipio"];
    codigoPostal = json["codigo_postal"];
    estado = json["estado"];
  }
}
