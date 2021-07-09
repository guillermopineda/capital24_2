import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantillaColaboradoresDetalle extends StatelessWidget {
  static const String routeName = '/plantillaColaboradoresDetalle';
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Kiosco Colaborador"),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        endDrawer: HamburguesaClienteEspejo(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: _screenSize.height * .85,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _plantillaPersonal(context),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _plantillaLaboral(context),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _plantillaContacto(context),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _plantillaDomicilio(context),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _detallePagos(context),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _plantillaPersonal(BuildContext context) {
    final PlantillaColaboradoresModel plantillaColaboradoresModel =
        ModalRoute.of(context)!.settings.arguments
            as PlantillaColaboradoresModel;

    return Card(
        elevation: 40.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionTile(
                leading: Icon(
                  FontAwesomeIcons.idBadge,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Personales",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(
                  Icons.expand_more,
                  color: Theme.of(context).dividerColor,
                ),
                children: <Widget>[
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            subtitle: Text(
                              "Nombre",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text(plantillaColaboradoresModel.nombre ?? "")),
                        ListTile(
                            subtitle: Text(
                              "CURP",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.curp ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "RFC",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.rfc ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "NSS",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.afiliacionImss ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Nacionalidad",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.nacionalidad ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Fecha de Nacimiento",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.fechaNacimiento ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Sexo",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.sexo ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Estado Civil",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                    .datosPersonales!.estadoCivil ??
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Peso",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                .datosPersonales!.peso
                                .toString())),
                        ListTile(
                            subtitle: Text(
                              "Estatura",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(plantillaColaboradoresModel
                                .datosPersonales!.estatura
                                .toString())),
                        Divider(
                          color: Theme.of(context).dividerColor,
                        ),
                      ])
                ],
              ),
            ],
          ),
        ));
  }
}

Widget _plantillaContacto(BuildContext context) {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;

  return Card(
      elevation: 40.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ExpansionTile(
              leading: Icon(
                FontAwesomeIcons.mobileAlt,
                color: Theme.of(context).dividerColor,
              ),
              title: Text(
                "Contacto",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
              trailing: Icon(
                Icons.expand_more,
                color: Theme.of(context).dividerColor,
              ),
              children: <Widget>[
                Divider(
                  color: Theme.of(context).dividerColor,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          onTap: () => _launchTelOficina(context),
                          subtitle: Text(
                            "Teléfono Oficina",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDeContacto!.telefonoOficina ??
                              "")),
                      ListTile(
                          onTap: () => _launchTelCasa(context),
                          subtitle: Text(
                            "Teléfono Casa",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDeContacto!.telefonoCasa ??
                              "")),
                      ListTile(
                          onTap: () => _launchTelCelular(context),
                          subtitle: Text(
                            "Teléfono Celular",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDeContacto!.telefonoCelular ??
                              "")),
                      ListTile(
                          onTap: () => _launchMailOficina(context),
                          subtitle: Text(
                            "Email Oficina",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDeContacto!.email1 ??
                              "")),
                      ListTile(
                          onTap: () => _launchMailPersonal(context),
                          subtitle: Text(
                            "Email Personal",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDeContacto!.email2 ??
                              "")),
                      Divider(
                        color: Theme.of(context).dividerColor,
                      ),
                    ])
              ],
            ),
          ],
        ),
      ));
}

Widget _plantillaDomicilio(BuildContext context) {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;

  return Card(
      elevation: 40.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ExpansionTile(
              leading: Icon(
                FontAwesomeIcons.home,
                color: Theme.of(context).dividerColor,
              ),
              title: Text(
                "Domicilio",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
              trailing: Icon(
                Icons.expand_more,
                color: Theme.of(context).dividerColor,
              ),
              children: <Widget>[
                Divider(
                  color: Theme.of(context).dividerColor,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          subtitle: Text(
                            "Calle",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.calle ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Número Exterior",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.numeroExterior ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Número Interior",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.numeroInterior ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Colonia",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.colonia ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Población",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.municipio ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Código Postal",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.codigoPostal ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Estado",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosDomicilio!.estado ??
                              "")),
                      Divider(
                        color: Theme.of(context).dividerColor,
                      ),
                    ])
              ],
            ),
          ],
        ),
      ));
}

Widget _detallePagos(BuildContext context) {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  return Card(
      elevation: 40.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionTile(
                  leading: Icon(
                    FontAwesomeIcons.donate,
                    color: Theme.of(context).dividerColor,
                  ),
                  title: Text(
                    "Dispersión",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(
                    Icons.expand_more,
                    color: Theme.of(context).dividerColor,
                  ),
                  children: <Widget>[
                    Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Tradicional",
                                  textAlign: TextAlign.left,
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Theme.of(context).dividerColor,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      '/plantillaColaboradoresDetallePago',
                                      arguments: plantillaColaboradoresModel);
                                },
                              ),
                              Divider(
                                color: Theme.of(context).dividerColor,
                              ),
                              _mostrarOtros(context),
                            ],
                          ),
                        )
                      ],
                    ),
                  ])
            ]),
      ));
}

Widget _plantillaLaboral(BuildContext context) {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;

  return Card(
      elevation: 40.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ExpansionTile(
              leading: Icon(
                FontAwesomeIcons.fileAlt,
                color: Theme.of(context).dividerColor,
              ),
              title: Text(
                "Laborales",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
              trailing: Icon(
                Icons.expand_more,
                color: Theme.of(context).dividerColor,
              ),
              children: <Widget>[
                Divider(
                  color: Theme.of(context).dividerColor,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          onTap: () => _launchTelOficina(context),
                          subtitle: Text(
                            "Numero de Identificación",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                              .datosInformacionLaboral!.numeroEmpleado
                              .toString())),
                      ListTile(
                          onTap: () => _launchTelCasa(context),
                          subtitle: Text(
                            "Compañia",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.nombreCompania ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Proyecto Principal",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.area ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Centro de Costos Proyecto",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.centro ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Línea de Proyecto",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.linea ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Registro Patronal",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.zona ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Fecha de Ingreso",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.fechaIngreso ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Fecha de Antigüedad",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.fechaAntiguedad ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Fecha de Antigüedad Cliente",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.fechaAntig1 ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Fecha de Contrato",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.fechaContrato ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Fecha de Término de Contrato",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.fechaTerminacion ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Declaración de Impuestos",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.declaracionImp ??
                              "")),
                      ListTile(
                          subtitle: Text(
                            "Servicio",
                            textAlign: TextAlign.left,
                          ),
                          title: Text(plantillaColaboradoresModel
                                  .datosInformacionLaboral!.puesto ??
                              "")),
                      getDatoSueldo(context),
                      getDatoImporte(context),
                      Divider(
                        color: Theme.of(context).dividerColor,
                      ),
                    ])
              ],
            ),
          ],
        ),
      ));
}

getDatoImporte(context) {
  var f = NumberFormat('#,###,###', 'en_US');
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  var intImporteColaborador =
      plantillaColaboradoresModel.datosInformacionLaboral!.importe ?? 1;
  var intSueldoColaborador =
      plantillaColaboradoresModel.datosInformacionLaboral!.sueldo ?? 1;
  if (intImporteColaborador > intSueldoColaborador) {
    return ListTile(
        subtitle: Text(
          "Importe Pactado",
          textAlign: TextAlign.left,
        ),
        title: Text('\$ ' +
            f
                .format(plantillaColaboradoresModel
                    .datosInformacionLaboral!.importe)
                .toString()));
  } else {
    return SizedBox(height: .10);
  }
}

getDatoSueldo(context) {
  var f = NumberFormat('#,###,###.0#', 'en_US');
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  if (plantillaColaboradoresModel.datosInformacionLaboral!.sueldo! >= 50.0)
    return ListTile(
        subtitle: Text(
          "Sueldo Imss",
          textAlign: TextAlign.left,
        ),
        title: Text('\$ ' +
            f
                .format(
                    plantillaColaboradoresModel.datosInformacionLaboral!.sueldo)
                .toString()));

  return SizedBox(height: .10);
}

_mostrarOtros(context) {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  if (plantillaColaboradoresModel.otros!.isEmpty) {
    return Container();
  } else {
    return ListTile(
      title: Text(
        "Otros Pagos",
        textAlign: TextAlign.left,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Theme.of(context).dividerColor,
      ),
      onTap: () {
        Navigator.pushNamed(context, '/plantillaColaboradoresDetalleOtro',
            arguments: plantillaColaboradoresModel);
      },
    );
  }
}

Future<void> _launchMailPersonal(context) async {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  var mail = 'mailto:${plantillaColaboradoresModel.datosDeContacto!.email2}';
  if (await canLaunch(mail)) {
    await launch(mail);
  } else {
    throw 'Ne es posible conectar al correo $mail';
  }
}

Future<void> _launchMailOficina(context) async {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  var mail = 'mailto:${plantillaColaboradoresModel.datosDeContacto!.email1}';
  if (await canLaunch(mail)) {
    await launch(mail);
  } else {
    throw 'Ne es posible conectar al correo $mail';
  }
}

Future<void> _launchTelCelular(context) async {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  var tel =
      'tel:${plantillaColaboradoresModel.datosDeContacto!.telefonoCelular}';
  if (await canLaunch(tel)) {
    await launch(tel);
  } else {
    throw 'Ne es posible llamar al telefono $tel';
  }
}

Future<void> _launchTelCasa(context) async {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  var tel = 'tel:${plantillaColaboradoresModel.datosDeContacto!.telefonoCasa}';
  if (await canLaunch(tel)) {
    await launch(tel);
  } else {
    throw 'Ne es posible llamar al telefono $tel';
  }
}

Future<void> _launchTelOficina(context) async {
  final PlantillaColaboradoresModel plantillaColaboradoresModel =
      ModalRoute.of(context)!.settings.arguments as PlantillaColaboradoresModel;
  var tel =
      'tel:${plantillaColaboradoresModel.datosDeContacto!.telefonoOficina}';
  if (await canLaunch(tel)) {
    await launch(tel);
  } else {
    throw 'Ne es posible llamar al telefono $tel';
  }
}
