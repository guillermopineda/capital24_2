import 'package:capital24_2/src/models/nominaModel.dart';
import 'package:capital24_2/src/preferences/PreferenciasUsuario.dart';
import 'package:capital24_2/src/providers/NominaProvider.dart';
import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNoCliente.dart';
import 'package:capital24_2/src/widgets/appNoLogin.dart';
import 'package:capital24_2/src/widgets/appNominaEmpleado.dart';
import 'package:flutter/material.dart';

class Nomina extends StatefulWidget {
  static const String routeName = '/nomina';
  _NominaState createState() => _NominaState();
}

class _NominaState extends State<Nomina> {
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
            title: Text("Mis Pagos"),
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
                    _selectorPeriodos(),
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

  Widget _selectorPeriodos() {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: desglosesPagoProvider.getDesglosePago(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return AppNominaEmpleado(
              desglosesPagoModel: snapshot.data as List<DesglosePagoModel>);
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
