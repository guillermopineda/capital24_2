import 'package:capital24_2/src/models/plantillaColaboradoresModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/widgets/appHamburguesaClienteEspejo.dart';
import 'package:capital24_2/src/widgets/appNoEmpleado.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlantillaColaboradoresDetallePago extends StatelessWidget {
  static const String routeName = '/plantillaColaboradoresDetallePago';
  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'empleado') {
        return NoEmpleado();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("Pagos Colaborador"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: Icon(Icons.arrow_back)),
          ),
          endDrawer: HamburguesaClienteEspejo(),
          backgroundColor: Theme.of(context).backgroundColor,
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              _selectorPeriodos(context),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        );
      }
    }
  }

  Widget _selectorPeriodos(context) {
    final _screenSize = MediaQuery.of(context).size;

    return Card(
        elevation: 5.0,
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
                      FontAwesomeIcons.calendarCheck,
                      color: Theme.of(context).dividerColor,
                    ),
                    title: Text(
                      "Selecciona Periodo",
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
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          cajaPagos(context, _screenSize),
                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),
                        ],
                      ),
                    ])
              ]),
        ));
  }

  SizedBox cajaPagos(context, Size _screenSize) {
    final PlantillaColaboradoresModel plantillaColaboradoresModel =
        ModalRoute.of(context)!.settings.arguments
            as PlantillaColaboradoresModel;

    if (plantillaColaboradoresModel.pagos!.length == 0) {
      return SizedBox(
        height: _screenSize.height * .1,
        child: mostrarPago(context),
      );
    } else {
      return SizedBox(
        height: _screenSize.height * .2,
        child: mostrarPago(context),
      );
    }
  }

  mostrarPago(context) {
    final PlantillaColaboradoresModel plantillaColaboradoresModel =
        ModalRoute.of(context)!.settings.arguments
            as PlantillaColaboradoresModel;
    if (plantillaColaboradoresModel.pagos!.length == 0) {
      return ListTile(
        title: Text(
          "Sin informaci??n disponible",
          textAlign: TextAlign.left,
        ),
        subtitle: Text("A??n no se han registrados pagos"),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: plantillaColaboradoresModel.pagos!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      plantillaColaboradoresModel.pagos![index].mesAnio
                          .toString(),
                      textAlign: TextAlign.left,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).dividerColor,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/plantillaColaboradoresPagoDetalleDesglose',
                          arguments: plantillaColaboradoresModel.pagos![index]);
                    },
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            );
          });
    }
  }
}
