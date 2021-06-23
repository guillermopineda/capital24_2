import 'package:capital24_2/src/widgets/appHamburguesaEmpleadoEspejo.dart';
import 'package:capital24_2/src/widgets/appNominaEmpleado.dart';
import 'package:flutter/material.dart';

class Nomina extends StatefulWidget {
  static const String routeName = '/nomina';
  _NominaState createState() => _NominaState();
}

class _NominaState extends State<Nomina> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
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

  Widget _selectorPeriodos() {
    // final _screenSize = MediaQuery.of(context).size;

    return AppNominaEmpleado();
  }
}
