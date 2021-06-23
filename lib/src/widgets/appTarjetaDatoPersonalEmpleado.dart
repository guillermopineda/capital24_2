import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTarjetaDatoPersonalEmpleado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  "Datos Personales",
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
                              "Numero de Identificación",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoPersonalEmpleadoModel.numeroEmpleado.toString()")),
                        ListTile(
                            subtitle: Text(
                              "Nombre",
                              textAlign: TextAlign.left,
                            ),
                            title: Text("datoPersonalEmpleadoModel.nombre")),
                        ListTile(
                            subtitle: Text(
                              "CURP",
                              textAlign: TextAlign.left,
                            ),
                            title: Text("datoPersonalEmpleadoModel.curp")),
                        ListTile(
                            subtitle: Text(
                              "RFC",
                              textAlign: TextAlign.left,
                            ),
                            title: Text("datoPersonalEmpleadoModel.rfc")),
                        ListTile(
                            subtitle: Text(
                              "NSS",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoPersonalEmpleadoModel.afiliacionImss")),
                        ListTile(
                            subtitle: Text(
                              "Nacionalidad",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text("datoPersonalEmpleadoModel.nacionalidad")),
                        ListTile(
                            subtitle: Text(
                              "Fecha de Nacimiento",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoPersonalEmpleadoModel.fechaNacimiento")),
                        ListTile(
                            subtitle: Text(
                              "Sexo",
                              textAlign: TextAlign.left,
                            ),
                            title: Text("datoPersonalEmpleadoModel.sexo")),
                        ListTile(
                            subtitle: Text(
                              "Estado Civil",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text("datoPersonalEmpleadoModel.estadoCivil")),
                        ListTile(
                            subtitle: Text(
                              "Peso",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoPersonalEmpleadoModel.peso.toString()")),
                        ListTile(
                            subtitle: Text(
                              "Estatura",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoPersonalEmpleadoModel.estatura.toString()")),
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
