import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTarjetaDatoDomicilioEmpleado extends StatelessWidget {
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
                            title: Text(
                                "datoDomicilioEmpleadoModel.calle ?? " "")),
                        ListTile(
                            subtitle: Text(
                              "Número Exterior",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoDomicilioEmpleadoModel.numeroExterior ?? "
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Número Interior",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoDomicilioEmpleadoModel.numeroInterior ?? "
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Colonia",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoDomicilioEmpleadoModel.colonia ?? " "")),
                        ListTile(
                            subtitle: Text(
                              "Población",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoDomicilioEmpleadoModel.municipio ?? " "")),
                        ListTile(
                            subtitle: Text(
                              "Código Postal",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoDomicilioEmpleadoModel.codigoPostal ?? "
                                "")),
                        ListTile(
                            subtitle: Text(
                              "Estado",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                "datoDomicilioEmpleadoModel.estado ?? " "")),
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
