import 'package:capital24_2/src/models/otrosModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoCliente.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OtrosPagoDetalle extends StatelessWidget {
  static const String routeName = '/desgloseOtrosDetalle';
  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    final DesgloseOtroModel desglosesOtroModel =
        ModalRoute.of(context)!.settings.arguments as DesgloseOtroModel;
    var f = NumberFormat('#,###,###.0#', 'en_US');
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'cliente') {
        return NoCliente();
      } else {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text("Detalle Otros Pagos"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          endDrawer: HamburguesaEmpleadoEspejo(),
          body: SafeArea(
            bottom: true,
            maintainBottomViewPadding: true,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: desglosesOtroModel.pagos!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ExpansionTile(
                        title: Text(
                          'Periodo ${desglosesOtroModel.pagos![index].proceso} ${desglosesOtroModel.pagos![index].periodo.toString()}',
                          style: TextStyle(fontSize: 16.0),
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
                                  "Banco Colaborador",
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(desglosesOtroModel
                                    .pagos![index].banco
                                    .toString()),
                              ),
                              ListTile(
                                subtitle: Text(
                                  "Cuenta Colaborador",
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(desglosesOtroModel
                                    .pagos![index].cuenta
                                    .toString()),
                              ),
                              ListTile(
                                subtitle: Text(
                                  "Clabe Colaborador",
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(desglosesOtroModel
                                    .pagos![index].cuentaClabe
                                    .toString()),
                              ),
                              ListTile(
                                subtitle: Text(
                                  "Lugar de Pago",
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(desglosesOtroModel
                                    .pagos![index].lugarPago
                                    .toString()),
                              ),
                              ListTile(
                                subtitle: Text(
                                  "Importe Depositado",
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(f
                                    .format(desglosesOtroModel
                                        .pagos![index].importe)
                                    .toString()),
                              ),
                              Divider(
                                color: Theme.of(context).dividerColor,
                              ),
                            ],
                          )
                        ],
                      ));
                }),
          ),
        );
      }
    }
  }
}
