import 'package:capital24_2/src/models/informacionLaboralModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AppTarjetaDatoLaboralEmpleado extends StatelessWidget {
  final DatoLaboralEmpleadoModel? datoLaboralEmpleadoModel;

  AppTarjetaDatoLaboralEmpleado({this.datoLaboralEmpleadoModel});
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
                  FontAwesomeIcons.fileAlt,
                  color: Theme.of(context).dividerColor,
                ),
                title: Text(
                  "Expediente",
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
                            title: Text(datoLaboralEmpleadoModel!.numeroEmpleado
                                .toString())),
                        ListTile(
                            subtitle: Text(
                              "Compañia",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoLaboralEmpleadoModel!.nombreCompania ??
                                    "")),
                        ListTile(
                            subtitle: Text(
                              "Proyecto Principal",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(datoLaboralEmpleadoModel!.area ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Centro de Costos Proyecto",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text(datoLaboralEmpleadoModel!.centro ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Línea de Proyecto",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(datoLaboralEmpleadoModel!.linea ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Registro Patronal",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(datoLaboralEmpleadoModel!.zona ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Fecha de Ingreso",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoLaboralEmpleadoModel!.fechaIngreso ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Fecha de Antigüedad",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoLaboralEmpleadoModel!.fechaAntiguedad ??
                                    "")),
                        ListTile(
                            subtitle: Text(
                              "Fecha de Contrato",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoLaboralEmpleadoModel!.fechaContrato ?? "")),
                        ListTile(
                            subtitle: Text(
                              "Fecha de Término de Contrato",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoLaboralEmpleadoModel!.fechaTerminacion ??
                                    "")),
                        ListTile(
                            subtitle: Text(
                              "Declaración de Impuestos",
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                                datoLaboralEmpleadoModel!.declaracionImp ??
                                    "")),
                        ListTile(
                            subtitle: Text(
                              "Servicio",
                              textAlign: TextAlign.left,
                            ),
                            title:
                                Text(datoLaboralEmpleadoModel!.puesto ?? "")),
                        getDatoSueldo(),
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

  getDatoSueldo() {
    var f = NumberFormat('#,###,###.0#', 'en_US');
    if (datoLaboralEmpleadoModel!.sueldo! >= 50.0) if (51 >= 50.0)
      return ListTile(
          subtitle: Text(
            "Sueldo",
            textAlign: TextAlign.left,
          ),
          title: Text(
              '\$ ${f.format(datoLaboralEmpleadoModel!.sueldo).toString()}'));

    return SizedBox(height: .10);
  }
}
