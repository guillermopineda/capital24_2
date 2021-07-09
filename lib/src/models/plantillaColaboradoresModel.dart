class ListaPlantillaColaboradoresModel {
  List<PlantillaColaboradoresModel>? items = [];

  ListaPlantillaColaboradoresModel({this.items});

  ListaPlantillaColaboradoresModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final plantillaColaboradoresModel =
          new PlantillaColaboradoresModel.fromJson(item);
      items!.add(plantillaColaboradoresModel);
    }
  }
}

class PlantillaColaboradoresModel {
  bool? nulo;
  String? nombre;
  int? numeroEmpleado;
  DatosInformacionLaboral? datosInformacionLaboral;
  DatosDomicilio? datosDomicilio;
  DatosContacto? datosDeContacto;
  DatosPersonales? datosPersonales;
  List<Pagos>? pagos;
  List<Otros>? otros;

  PlantillaColaboradoresModel(
      {this.nombre,
      this.numeroEmpleado,
      this.datosInformacionLaboral,
      this.datosDomicilio,
      this.datosDeContacto,
      this.datosPersonales,
      this.pagos,
      this.otros});

  factory PlantillaColaboradoresModel.fromJson(Map<String, dynamic> json) {
    var listaPagos = json['pagos'] as List;
    var listaOtros = json['otros'] as List;
    List<Pagos> pagosList = listaPagos.map((k) => Pagos.fromJson(k)).toList();
    List<Otros> otrosList = listaOtros.map((l) => Otros.fromJson(l)).toList();

    return PlantillaColaboradoresModel(
        nombre: json['nombre'],
        numeroEmpleado: json['numero_empleado'],
        datosInformacionLaboral:
            DatosInformacionLaboral.fromJson(json['informacion_laboral']),
        datosDomicilio: DatosDomicilio.fromJson(json['domicilio']),
        datosDeContacto: DatosContacto.fromJson(json['datos_de_contacto']),
        datosPersonales: DatosPersonales.fromJson(json['datos_personales']),
        pagos: pagosList,
        otros: otrosList);
  }
}

class DatosInformacionLaboral {
  double? importe;
  String? fechaAntig1;
  String? nombreCompania;
  int? numeroEmpleado;
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

  DatosInformacionLaboral(
      {this.importe,
      this.fechaAntig1,
      this.numeroEmpleado,
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
      this.puesto});

  factory DatosInformacionLaboral.fromJson(Map<String, dynamic> json) {
    return new DatosInformacionLaboral(
      importe: json["importe"],
      fechaAntig1: json["fecha_antig_1"],
      numeroEmpleado: json["numero_empleado"],
      nombreCompania: json["nombre_compania"],
      fechaIngreso: json["fecha_ingreso"],
      fechaAntiguedad: json["fecha_antiguedad"],
      fechaContrato: json["fecha_contrato"],
      fechaTerminacion: json["fecha_terminacion"],
      declaracionImp: json["declaracion_imp"],
      sueldo: json["sueldo"],
      area: json["area"],
      centro: json['centro'],
      linea: json['linea'],
      zona: json['zona'],
      puesto: json['puesto'],
    );
  }
}

class DatosDomicilio {
  String? calle;
  String? numeroExterior;
  String? numeroInterior;
  String? colonia;
  String? municipio;
  String? codigoPostal;
  String? estado;

  DatosDomicilio(
      {this.calle,
      this.numeroExterior,
      this.numeroInterior,
      this.colonia,
      this.municipio,
      this.codigoPostal,
      this.estado});

  factory DatosDomicilio.fromJson(Map<String, dynamic> json) {
    return new DatosDomicilio(
        calle: json['calle'],
        numeroExterior: json['numero_exterior'],
        numeroInterior: json['numero_interior'],
        colonia: json['colonia'],
        municipio: json['municipio'],
        codigoPostal: json['codigo_postal'],
        estado: json['estado']);
  }
}

class DatosContacto {
  String? telefonoOficina;
  String? telefonoCasa;
  String? telefonoCelular;
  String? email1;
  String? email2;

  DatosContacto({
    this.telefonoOficina,
    this.telefonoCasa,
    this.telefonoCelular,
    this.email1,
    this.email2,
  });

  factory DatosContacto.fromJson(Map<String, dynamic> json) {
    return new DatosContacto(
      telefonoOficina: json['telefono_oficina'],
      telefonoCasa: json['telefono_casa'],
      telefonoCelular: json['telefono_celular'],
      email1: json['email_1'],
      email2: json['email_2'],
    );
  }
}

class DatosPersonales {
  String? curp;
  String? rfc;
  String? afiliacionImss;
  String? fechaNacimiento;
  String? sexo;
  String? estadoCivil;
  double? peso;
  double? estatura;
  String? nacionalidad;
  String? paisNacimiento;
  String? licenciaConducir;
  String? venceLicencia;
  String? pasaporte;

  DatosPersonales(
      {this.curp,
      this.rfc,
      this.afiliacionImss,
      this.fechaNacimiento,
      this.sexo,
      this.estadoCivil,
      this.peso,
      this.estatura,
      this.nacionalidad,
      this.paisNacimiento,
      this.licenciaConducir,
      this.venceLicencia,
      this.pasaporte});

  factory DatosPersonales.fromJson(Map<String, dynamic> json) {
    return new DatosPersonales(
        curp: json['curp'],
        rfc: json['rfc'],
        afiliacionImss: json['afiliacion_imss'],
        fechaNacimiento: json['fecha_nacimiento'],
        sexo: json['sexo'],
        estadoCivil: json['estado_civil'],
        peso: json['peso'],
        estatura: json['estatura'],
        nacionalidad: json['nacionalidad'],
        paisNacimiento: json['pais_nacimiento'],
        licenciaConducir: json['licencia_conducir'],
        venceLicencia: json['vence_licencia'],
        pasaporte: json['pasaporte']);
  }
}

class Pagos {
  String? mes;
  int? anio;
  String? mesAnio;
  List<PagoDetalle>? pagos;
  Pagos({
    this.mes,
    this.anio,
    this.mesAnio,
    this.pagos,
  });

  factory Pagos.fromJson(Map<String, dynamic> json) {
    var list = json['pagos'] as List;
    List<PagoDetalle> pagosList =
        list.map((i) => PagoDetalle.fromJson(i)).toList();

    return new Pagos(
      mes: json["mes"],
      anio: json["anio"],
      mesAnio: json["mes_anio"],
      pagos: pagosList,
    );
  }
}

class Otros {
  String? mes;
  int? anio;
  String? mesAnio;
  List<OtroDetalle>? otros;

  Otros({
    this.mes,
    this.anio,
    this.mesAnio,
    this.otros,
  });

  factory Otros.fromJson(Map<String, dynamic> json) {
    var list = json['pagos'] as List;
    List<OtroDetalle> otrosList =
        list.map((i) => OtroDetalle.fromJson(i)).toList();

    return new Otros(
      mes: json["mes"],
      anio: json["anio"],
      mesAnio: json["mes_anio"],
      otros: otrosList,
    );
  }
}

class PagoDetalle {
  String? recibo;
  String? banco;
  String? cuenta;
  String? cuentaClabe;
  String? lugarPago;
  String? proceso;
  int? periodo;
  double? importe;

  PagoDetalle({
    this.recibo,
    this.banco,
    this.cuenta,
    this.cuentaClabe,
    this.lugarPago,
    this.proceso,
    this.periodo,
    this.importe,
  });

  factory PagoDetalle.fromJson(Map<String, dynamic> json) {
    return new PagoDetalle(
        recibo: json["recibo"],
        banco: json["banco"],
        cuenta: json["cuenta"],
        cuentaClabe: json["cuenta_clabe"],
        lugarPago: json["lugar_pago"],
        proceso: json["proceso"],
        periodo: json["periodo"],
        importe: json["importe"]);
  }
}

class OtroDetalle {
  String? banco;
  String? cuenta;
  String? cuentaClabe;
  String? lugarPago;
  String? proceso;
  int? periodo;
  double? importe;

  OtroDetalle({
    this.banco,
    this.cuenta,
    this.cuentaClabe,
    this.lugarPago,
    this.proceso,
    this.periodo,
    this.importe,
  });

  factory OtroDetalle.fromJson(Map<String, dynamic> json) {
    return new OtroDetalle(
        banco: json["banco"],
        cuenta: json["cuenta"],
        cuentaClabe: json["cuenta_clabe"],
        lugarPago: json["lugar_pago"],
        proceso: json["proceso"],
        periodo: json["periodo"],
        importe: json["importe"]);
  }
}
