import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
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
    final _screenSize = MediaQuery.of(context).size;
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

  Widget _datoLaboral() {
    // final _screenSize = MediaQuery.of(context).size;

    return AppTarjetaDatoLaboralEmpleado();
  }

  Widget _serviciosLaboral() {
    // final _screenSize = MediaQuery.of(context).size;

    return AppTarjetaDatoServiciosEmpleado();
  }
}
