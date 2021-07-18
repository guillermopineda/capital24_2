import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/InformacionLaboralProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoCliente.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appTarjetaDatoLaboralEmpleado.dart';
import 'package:capital24_2/src/widgets/appTarjetaDatoServiciosEmpleado.dart';
import 'package:flutter/material.dart';

class InformacionLaboral extends StatefulWidget {
  static const String routeName = '/informacionLaboral';
  _InformacionLaboralState createState() => _InformacionLaboralState();
}

class _InformacionLaboralState extends State<InformacionLaboral> {
  @override
  Widget build(BuildContext context) {
    final _prefs = PreferenciasUsuario();
    final _screenSize = MediaQuery.of(context).size;
    if (_prefs.tipoUsuario == '') {
      return NoLogin();
    } else {
      if (_prefs.tipoUsuario == 'cliente') {
        return NoCliente();
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("Información Laboral"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          endDrawer: HamburguesaEmpleadoEspejo(),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            bottom: true,
            maintainBottomViewPadding: true,
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
                    _datoLaboral(),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                    _serviciosLaboral(),
                    SizedBox(
                      height: _screenSize.height * .03,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  Widget _datoLaboral() {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: datoLaboralEmpleadoProvider.getDatoLaboral(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return AppTarjetaDatoLaboralEmpleado(
              datoLaboralEmpleadoModel: snapshot.data);
        } else {
          return Container(
              height: _screenSize.height * .85,
              child: Center(
                  child: Image.asset(
                "images/load_2.gif",
              )));
        }
      },
    );
  }

  Widget _serviciosLaboral() {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: datoLaboralEmpleadoProvider.getDatoLaboral(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return AppTarjetaDatoServiciosEmpleado(
              datoLaboralEmpleadoModel: snapshot.data);
        } else {
          return Container(
              height: _screenSize.height * .85,
              child: Center(
                  child: Image.asset(
                "images/load_2.gif",
              )));
        }
      },
    );
  }
}
