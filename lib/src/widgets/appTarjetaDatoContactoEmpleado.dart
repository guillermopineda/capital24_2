import 'package:capital24_2/src/models/InformacionContactoModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTarjetaDatoContactoEmpleado extends StatelessWidget {
  final DatoContactoEmpleadoModel? datoContactoEmpleadoModel;

  AppTarjetaDatoContactoEmpleado({this.datoContactoEmpleadoModel});
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
                            subtitle: Text(
                              "Teléfono Oficina",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoContactoEmpleadoModel!.telefonoOficina ??
                                    "")),
                        ListTile(
                            subtitle: Text(
                              "Teléfono Casa",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoContactoEmpleadoModel!.telefonoCasa ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Teléfono Celular",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoContactoEmpleadoModel!.telefonoCelular ??
                                    "")),
                        ListTile(
                            subtitle: Text(
                              "Email Oficina",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text(datoContactoEmpleadoModel!.email1 ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Teléfono Personal",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text(datoContactoEmpleadoModel!.email2 ?? " ")),
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
